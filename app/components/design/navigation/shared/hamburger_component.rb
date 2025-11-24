# frozen_string_literal: true

class Design::Navigation::Shared::HamburgerComponent < ViewComponent::Base
  def initialize(target:, aria_label: "Toggle menu")
    @target = target
    @aria_label = aria_label
  end
end
