# frozen_string_literal: true

class Design::Element::CardComponentPreview < ViewComponent::Preview
  # @label Simple Card (parameters)
  def simple
    render Design::Element::CardComponent.new(
      header: "Feature Title",
      summary: "This is a description of the feature that explains what it does and why it's useful.",
      icon: "briefcase-business",
      border: true
    )
  end

  # @label Card with Link
  def with_link
    render Design::Element::CardComponent.new(
      header: "Corporate",
      summary: "Manage companies, subsidiaries, offices, and people. Define reporting structures, organizational charts, departments, and teams.",
      icon: "hotel",
      href: "/modules/corporate",
      border: true
    )
  end

  # @label Card with Slots
  def with_slots
    render_with_template
  end

  # @label Card with Image
  def with_image
    render Design::Element::CardComponent.new(
      image: "/lookbook/placeholder.jpg",
      header: "Team Member",
      summary: "John Doe is a senior software engineer with 10 years of experience in building scalable web applications.",
      border: true
    )
  end

  # @label Horizontal Layout (Banner)
  def horizontal_layout
    render_with_template
  end
end
