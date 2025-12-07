# frozen_string_literal: true

class Design::Element::CardComponent < ViewComponent::Base
  renders_one :icon
  renders_one :header
  renders_one :body
  renders_one :footer

  def initialize(header: nil, summary: nil, icon: nil, href: nil, border: false)
    @header = header
    @summary = summary
    @icon = icon
    @href = href
    @border = border
  end

  def wrapper_classes
    classes = ["flex", "flex-col"]
    classes << "pis-6 pie-6 pbs-6 pbe-6 border border-main rounded-lg" if @border
    classes.join(" ")
  end

  def link?
    @href.present?
  end
end
