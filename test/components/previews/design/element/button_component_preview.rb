# frozen_string_literal: true

class Design::Element::ButtonComponentPreview < ViewComponent::Preview
  # @label Primary Button
  def primary
    render Design::Element::ButtonComponent.new(
      label: "Primary Button",
      variant: :primary,
      href: "#"
    )
  end

  # @label Secondary Button
  def secondary
    render Design::Element::ButtonComponent.new(
      label: "Secondary Button",
      variant: :secondary,
      href: "#"
    )
  end

  # @label Outline Button
  def outline
    render Design::Element::ButtonComponent.new(
      label: "Outline Button",
      variant: :outline,
      href: "#"
    )
  end

  # @label All Variants
  def all_variants
    render_with_template
  end

  # @label All Sizes
  def all_sizes
    render_with_template
  end

  # @label With Icon
  def with_icon
    render Design::Element::ButtonComponent.new(
      label: "Download",
      variant: :primary,
      icon: "download",
      href: "#"
    )
  end
end
