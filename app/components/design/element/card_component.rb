# frozen_string_literal: true

class Design::Element::CardComponent < ViewComponent::Base
  renders_one :icon
  renders_one :header
  renders_one :body
  renders_one :footer

  def initialize(header: nil, summary: nil, icon: nil, href: nil, border: false, tag: nil, wrapper_class: nil, data: {}, **html_options)
    @header = header
    @summary = summary
    @icon = icon
    @href = href
    @border = border
    @tag = tag
    @wrapper_class = wrapper_class
    @data = data
    @html_options = html_options
  end

  def wrapper_tag
    return @tag if @tag.present?
    link? ? :a : :div
  end

  def wrapper_classes
    return @wrapper_class if @wrapper_class.present?

    classes = ["flex", "flex-col", "gap-2", "pis-6", "pie-6", "pbs-6", "pbe-6"]
    if @border
      classes << "border border-main rounded-lg"
    end
    # Add link-specific styles if this is a link
    if link?
      classes += ["text-inherit", "no-underline", "hover:bg-surface-secondary", "transition-colors"]
    end
    classes.join(" ")
  end

  def wrapper_attributes
    attrs = { class: wrapper_classes }
    attrs[:href] = @href if link?
    attrs[:data] = @data if @data.present?
    attrs.merge!(@html_options) if @html_options.present?
    attrs
  end

  def link?
    @href.present?
  end
end
