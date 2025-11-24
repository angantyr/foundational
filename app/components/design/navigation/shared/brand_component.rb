# frozen_string_literal: true

class Design::Navigation::Shared::BrandComponent < ViewComponent::Base
  def initialize(logo:, href: "/", size: 64, animate_on_hover: true)
    @logo = logo
    @href = href
    @size = size
    @animate_on_hover = animate_on_hover
  end

  def css_classes
    classes = ["brand-component"]
    classes << "brand-component--animate" if @animate_on_hover
    classes.join(" ")
  end
end
