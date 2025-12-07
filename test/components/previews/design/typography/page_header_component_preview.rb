# frozen_string_literal: true

class Design::Typography::PageHeaderComponentPreview < ViewComponent::Preview
  # @label Full Page Header
  def full
    render Design::Typography::PageHeaderComponent.new(
      prefix: "Modules",
      title: "Corporate Management System",
      abstract: "Comprehensive tools for managing companies, subsidiaries, offices, and people. Define reporting structures, organizational charts, departments, and teams.",
      icon: "hotel"
    )
  end

  # @label Without Icon
  def without_icon
    render Design::Typography::PageHeaderComponent.new(
      prefix: "Documentation",
      title: "Getting Started Guide",
      abstract: "Learn how to use the platform and get up and running quickly with our comprehensive documentation and tutorials."
    )
  end

  # @label Minimal (Title Only)
  def minimal
    render Design::Typography::PageHeaderComponent.new(
      title: "Simple Page Title"
    )
  end
end
