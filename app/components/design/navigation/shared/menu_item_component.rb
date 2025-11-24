# frozen_string_literal: true

class Design::Navigation::Shared::MenuItemComponent < ViewComponent::Base
  def initialize(label:, href: nil, icon: nil, description: nil, show_icon: true, show_chevron: false, variant: :default)
    @label = label
    @href = href
    @icon = icon
    @description = description
    @show_icon = show_icon
    @show_chevron = show_chevron
    @variant = variant
  end

  def css_classes
    classes = ["menu-item-component"]
    classes << "menu-item-component--card" if card_variant?
    classes << "menu-item-component--with-chevron" if @show_chevron
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
