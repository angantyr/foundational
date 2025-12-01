# frozen_string_literal: true

class Design::Navigation::Elements::BrandComponentPreview < ViewComponent::Preview
  # @label Default
  def default
    render(Design::Navigation::Elements::BrandComponent.new(
      logo: "brandmark.svg",
      href: "/",
      size: 64,
      animate_on_hover: true
    ))
  end

  # @label Without Animation
  def without_animation
    render(Design::Navigation::Elements::BrandComponent.new(
      logo: "brandmark.svg",
      href: "/",
      size: 64,
      animate_on_hover: false
    ))
  end

  # @label Large Size
  def large
    render(Design::Navigation::Elements::BrandComponent.new(
      logo: "brandmark.svg",
      href: "/",
      size: 96,
      animate_on_hover: true
    ))
  end

  # @label Small Size
  def small
    render(Design::Navigation::Elements::BrandComponent.new(
      logo: "brandmark.svg",
      href: "/",
      size: 48,
      animate_on_hover: true
    ))
  end
end
