# frozen_string_literal: true

class Design::Navigation::Elements::MenuItemComponent < ViewComponent::Base
  def initialize(label:, href: nil, icon: nil, description: nil, show_icon: true, show_chevron: false, chevron_icon: "chevron-right", variant: :default, active: false)
    @label = label
    @href = href
    @icon = icon
    @description = description
    @show_icon = show_icon
    @show_chevron = show_chevron
    @chevron_icon = chevron_icon
    @variant = variant
    @active = active
  end

  def css_classes
    classes = ["menu-item-component"]
    classes << "menu-item-component--card" if card_variant?
    classes << "menu-item-component--with-chevron" if @show_chevron
    classes << "menu-item-component--active" if @active
    classes.join(" ")
  end

  def show_icon?
    @show_icon && @icon.present?
  end

  def has_description?
    @description.present?
  end

  def card_variant?
    @variant == :card
  end
end
