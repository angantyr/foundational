namespace :foundational do
  namespace :web do
    desc "Reset and rebuild web sites, domain, and pages"
    task rebuild: :environment do
      puts "\n Rebuilding web models...\n\n"
      Rake::Task["foundational:web:reset"].invoke
      Rake::Task["foundational:web:populate_sites_and_domains"].invoke
      truncate_action_text_tables
      Rake::Task["foundational:web:populate_pages"].invoke
      # Rake::Task["foundational:web:augment"].invoke
      Rake::Task["foundational:web:publish_all"].invoke
      puts "\n\Done.\n\n"
    end

    desc "Reset and rebuild web pages only"
    task rebuild_pages: :environment do
      puts "\n Rebuilding web pages...\n\n"
      truncate_action_text_tables
      Rake::Task["foundational:web:populate_pages"].invoke
      # Rake::Task["foundational:web:augment"].invoke
      Rake::Task["foundational:web:publish_all"].invoke
      puts "\n\Done.\n\n"
    end

    task reset: :environment  do
      puts "\n Reset web model tables...\n\n"
      # reset action text tables
      # ActiveRecord::Base.connection.execute("TRUNCATE action_text_rich_texts RESTART IDENTITY CASCADE")
      targeted_models = [
        Design::Iconography::Iconification,
        Web::Page,
        Web::Domain,
        Web::Site
      ]
      targeted_models.each do |model|
        puts "  resetting #{model.class}"
        reset_model_table(model)
      end

      puts "\n\nWeb model tables reset.\n\n"
    end


    desc "populate web sites and domains"
    task populate_sites_and_domains: :environment do
      puts "===="
      puts
      puts "Populating web sites and domains..."
      puts

      reset_model_table(Web::Domain)
      reset_model_table(Web::Site)

      sites_data = YAML.load(File.read("#{Rails.root}/lib/tasks/data/web/sites.yml"))

      sites_data["sites"].each do |site_data|
        permalink = site_data.first
        attributes = site_data.last
        domains_data = attributes.delete("domains")

        site = Web::Site.create(attributes)
        puts " added site '#{site.name}'"

        domains_data.each do |domain_data|
          domain = Web::Domain.new(domain_data)
          domain.site = site
          domain.save!
          puts " added domain '#{domain.name}' to site '#{site.name}'"
        end
      end

      puts
      puts " Done. Created #{Web::Site.count} web sites."
      puts " Done. Created #{Web::Domain.count} web domains."
      puts
    end

    desc "populate pages"
    task populate_pages: :environment do
      puts "===="
      puts
      puts "Populating web pages ..."
      puts

      # NOTE: modified to look for a site permalink to assign the pages to

      targeted_models = [ Design::Iconography::Iconification, Web::Page ]
      targeted_models.each do |model|
        reset_model_table(model)
      end


      sites_data = YAML.load(File.read("#{Rails.root}/lib/tasks/data/web/pages.yml"))
      # debugger
      sites_data["sites"].each do |site_data|
        site = Web::Site.find_by!(permalink: site_data.first)
        pages_data = site_data.last
        # debugger
        pages_data["pages"].each do |page_data|
          permalink = page_data.first
          attributes = page_data.last
          children = attributes.delete("children")
          icon_name = attributes.delete("icon")
          # Enable when we have design engine installed 
          icon = Design::Iconography::Icon.find_by(permalink: icon_name)
          page = Web::Page.find_or_initialize_by(permalink: permalink)
          puts "page.permalink => #{page.permalink}"
          page.attributes = attributes
          page.site = site
          
          if icon
            # puts "adding icon #{icon.name} to page #{page.name}"
            page.build_iconification(icon: icon)
          else
            puts "WARNING: no icon found with name #{icon_name} to add to page #{page.name}"
          end
          
          page.save! if page.changed?
          # puts "page.permalink => #{page.permalink}"
          # puts "  added page '#{page.name}' to site '#{page.site.name}'"
          build_page_children(page, children) if children
        end
      end

      puts
      puts "Done."
      puts "Created #{Web::Page.count} web pages."
      puts "Created #{Design::Iconography::Iconification.count} iconficiations."
      puts
    end

    desc "publish web content"
    task publish_all: :environment do
      puts "===="
      puts
      puts "publishing web content ..."
      puts

      workflow_models = [
        Web::Site,
        Web::Domain,
        Web::Page
      ]

      workflow_models.each do |model|
        puts " - publishing all #{model.to_s.demodulize.pluralize.downcase}"
        model.update_all(state: "published", published_at: 1.week.ago)
      end
      puts " Done."
      puts
    end

    desc "disable some web pages"
    task disable_some_pages: :environment do
      puts "===="
      puts
      puts "disabling some web pages ..."
      puts

      paths = [
        # "boat/crest",
        # "boat/construction/hull-cylinders-90-percent-complete",
        # "boat/construction/certificate-of-occupancy-for-assembly-building",
        # "boat/construction/first-quad-pack-rotated-into-ships-position",
        # "boat/construction/lead-ship-30-percent-complete",
        # "contribute/mandate"
      ]

      pages_to_disable = Web::Page.where(path: paths)

      pages_to_disable.each do |page|
        puts "disabling web page '#{page.name}"
        page.disable! if page.live?
      end
      puts " Done."
      puts
    end

    desc "augment content with fake data"
    task augment: :environment do
      # require 'populator'
      require "faker"

      require "action_view/helpers"
      extend ActionView::Helpers
      include ActionView::Helpers::SanitizeHelper

      puts "augmenting web pages...\n\n"

      Web::Page.all.each_with_index do |page, idx|
        puts "#{idx}.\tprocessing page '#{page.name}'"
        page.header ||= page.name
        page.summary ||= get_paragraph(count: 2)
        page.title = page.name
        page.abstract = get_sentence

        if page.leaf?
          page.body = build_document_body(count: 5, with_headers: true)
          page.sidebar = build_document_sidebar(count: 3, with_headers: true)
          page.footnotes = build_document_footnotes(count: 2, numbered: true)
        else
          page.body = build_document_body(count: 1, with_headers: false)
          page.sidebar = build_document_sidebar_bullets(count: 5)
        end
        page.save!
      end

      puts "\n\nWebsite augment. Enjoy!\n\n"
    end
  end
end



# shared method
def build_page_children(page, children)
  children.each do |child_data|
    permalink = child_data.first
    attributes = child_data.last
    children = attributes.delete("children")

    icon_name = attributes.delete("icon")
    # puts "icon_name: #{icon_name}"
    icon = Design::Iconography::Icon.find_by(permalink: icon_name)
    # icon = nil
    # puts "icon =>"
    # puts icon.inspect

    child = page.children.build(permalink: permalink)
    child.attributes = attributes
    child.site = page.site


    if icon
      puts "adding icon #{icon.name} to page #{child.name}"
      child.build_iconification(icon: icon)
    else
      puts "WARNING: no icon found with name #{icon_name} to add to page #{child.name}"
    end
    # puts child.path
    child.save!
    # puts "  added page '#{child.name}' to site '#{child.site.name}'"
    build_page_children(child, children) if children
  end
end

def build_document_body(count: 4, with_headers: false)
  paragraphs = count.times.map { get_paragraph }
  if with_headers
    header_count = count - 1
    headers = header_count.times.map { get_header }
    header_tags = headers.compact.map { |h| content_tag :h4, h }
    paragraph_tags = paragraphs.compact.map { |p| content_tag :p, p }
    paragraph_tags.zip(header_tags).join
  else
    paragraphs.compact.map { |p| content_tag :p, p }.join
  end
end

def build_document_sidebar(count: 4, with_headers: false)
  paragraphs = count.times.map { get_paragraph(count: 1) }
  if with_headers
    headers = count.times.map { get_header }
    header_tags = headers.compact.map { |h| content_tag :h4, h }
    paragraph_tags = paragraphs.compact.map { |p| content_tag :p, p }
    header_tags.zip(paragraph_tags).join
  else
    paragraphs.compact.map { |p| content_tag :p, p }.join
  end
end

def build_document_sidebar_bullets(count: 4)
  items = count.times.map { Faker::Lorem.sentence }
  items.compact.map { |i| content_tag :li, i }.join
end

def build_document_footnotes(count: 2, numbered: false)
  footnotes = []
  count.times do |idx|
    footnotes << [ get_superscript(idx +1), get_paragraph(count: 1) ].join(" ")
  end
  footnotes.join("<br/>")
end

def get_superscript(idx)
  content_tag :sup, idx
end

def get_header
  Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4)
end

def get_paragraph(count: 4)
  count.times.map { get_sentence }.join(" ")
end

def get_sentence
  Faker::Lorem.sentence(word_count: 12, supplemental: true, random_words_to_add: 6)
end
