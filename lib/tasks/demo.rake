namespace :foundational do
  namespace :demo do

    desc "Erase and rebuild ALL databases from scratch (including managed)"
    task :reset do
      puts "\nErasing and rebuilding all databases (including managed)...\n\n"

      Rake::Task["db:drop:primary"].invoke
      Rake::Task["db:drop:managed"].invoke
      Rake::Task["db:drop:search"].invoke
      FileUtils.rm_f(Rails.root.join("db/schema.rb"))
      FileUtils.rm_f(Rails.root.join("db/managed_schema.rb"))
      FileUtils.rm_f(Rails.root.join("db/search_schema.rb"))
      Rake::Task["db:create:primary"].invoke
      Rake::Task["db:create:managed"].invoke
      Rake::Task["db:create:search"].invoke
      # Run migrations in fresh processes — db:drop/create leave stale AR
      # connections that cause duplicate column errors on migrate.
      system("bin/rails db:migrate:primary") || abort("Primary migration failed")
      system("bin/rails db:migrate:managed") || abort("Managed migration failed")
      system("bin/rails db:migrate:search")  || abort("Search migration failed")
      system("bin/rails db:seed")            || abort("db:seed failed")

      config_file = Rails.root.join("config/managed/foundational.yml")
      if config_file.exist?
        print "\nReload Foundational configuration from YAML? [y/N] "
        STDOUT.flush
        if STDIN.gets&.chomp&.downcase == 'y'
          puts "Loading Foundational configuration..."
          system("bin/rails managed:config:load NAMESPACE=Foundational") || abort("Config load failed")
        else
          puts "Skipping config reload."
        end
      end

      puts "\nBuilding demo data..."
      system("bin/rails foundational:demo:build") || abort("Demo build failed")

      puts "\n\nFoundational demo reset complete. Enjoy!\n\n"
    end

    desc "Erase and rebuild demo (primary + search DBs only — managed DB is preserved)"
    task :rebuild do
      puts "\nErasing and rebuilding demo (managed DB preserved)...\n\n"

      Rake::Task["db:drop:primary"].invoke
      Rake::Task["db:drop:search"].invoke
      FileUtils.rm_f(Rails.root.join("db/schema.rb"))
      Rake::Task["db:create:primary"].invoke
      Rake::Task["db:create:search"].invoke
      Rake::Task["db:migrate:primary"].invoke
      Rake::Task["db:migrate:managed"].invoke
      Rake::Task["db:migrate:search"].invoke

      # Run build in a fresh process — db:drop/create/migrate leave stale AR
      # connections that can't be reliably cleared in the current process.
      puts "\nBuilding demo data..."
      system("bin/rails foundational:demo:build") || abort("Demo build failed")

      puts "\n\nFoundational demo rebuilt. Enjoy!\n\n"
    end

    desc "Build demo data (does not touch schema)"
    task :build do
      puts "\nBuilding demo...\n\n"
      Rake::Task["design:rebuild"].invoke
      Rake::Task["foundational:web:rebuild"].invoke
      puts "\n\nFoundational demo built. Enjoy!\n\n"
    end

  end
end
