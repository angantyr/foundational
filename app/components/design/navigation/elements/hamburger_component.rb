# frozen_string_literal: true

class Design::Navigation::Elements::HamburgerComponent < ViewComponent::Base
  def initialize(target:, aria_label: "Toggle menu", variant: :popover)
    @target = target
    @aria_label = aria_label
    @variant = variant
  end

  def checkbox_variant?
    @variant == :checkbox
  end

  def popover_variant?
    @variant == :popover
  end
end
