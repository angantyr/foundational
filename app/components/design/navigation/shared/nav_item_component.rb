# frozen_string_literal: true

class Design::Navigation::Shared::NavItemComponent < ViewComponent::Base
  def initialize(label:, href:, active: false, icon: nil, show_icon: true)
    @label = label
    @href = href
    @active = active
    @icon = icon
    @show_icon = show_icon
  end

  def css_classes
    classes = ["nav-item-component"]
    classes << "nav-item-component--active" if @active
    classes.join(" ")
  end

  def show_icon?
    @show_icon && @icon.present?
  end
end
