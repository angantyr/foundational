# frozen_string_literal: true

class Design::Layout::HeroComponentPreview < ViewComponent::Preview
  # @label Simple Hero (parameters)
  def simple
    render Design::Layout::HeroComponent.new(
      prefix: "Modules",
      title: "Corporate Management System",
      abstract: "Comprehensive tools for managing companies, subsidiaries, offices, and people. Define reporting structures, organizational charts, departments, and teams.",
      icon: "hotel"
    )
  end

  # @label With Custom Header
  def with_custom_header
    render_with_template
  end
end
