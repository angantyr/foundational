# frozen_string_literal: true

class Design::Navigation::Elements::HamburgerComponentPreview < ViewComponent::Preview
  # @label Default
  def default
    render(Design::Navigation::Elements::HamburgerComponent.new(
      target: "mobile-menu"
    ))
  end

  # @label Custom Label
  def custom_label
    render(Design::Navigation::Elements::HamburgerComponent.new(
      target: "mobile-menu",
      aria_label: "Open navigation menu"
    ))
  end
end
