# frozen_string_literal: true

class Design::Navigation::Shared::BrandComponentPreview < ViewComponent::Preview
  # @label Default
  def default
    render(Design::Navigation::Shared::BrandComponent.new(
      logo: "brandmark.svg",
      href: "/",
      size: 64,
      animate_on_hover: true
    ))
  end

  # @label Without Animation
  def without_animation
    render(Design::Navigation::Shared::BrandComponent.new(
      logo: "brandmark.svg",
      href: "/",
      size: 64,
      animate_on_hover: false
    ))
  end

  # @label Large Size
  def large
    render(Design::Navigation::Shared::BrandComponent.new(
      logo: "brandmark.svg",
      href: "/",
      size: 96,
      animate_on_hover: true
    ))
  end

  # @label Small Size
  def small
    render(Design::Navigation::Shared::BrandComponent.new(
      logo: "brandmark.svg",
      href: "/",
      size: 48,
      animate_on_hover: true
    ))
  end
end
