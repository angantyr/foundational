# frozen_string_literal: true

class Design::Typography::PageHeaderComponentPreview < ViewComponent::Preview
  # @label Full Page Header
  def full
    render Design::Typography::PageHeaderComponent.new(
      prefix: "Modules",
      title: "Corporate Management System",
      abstract: "Comprehensive tools for managing companies, subsidiaries, offices, and people. Define reporting structures, organizational charts, departments, and teams.",
      icon: "building"
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

  # @label Custom Icon Size
  def custom_icon_size
    render Design::Typography::PageHeaderComponent.new(
      prefix: "Settings",
      title: "User Preferences",
      abstract: "Customize your experience with our comprehensive settings panel.",
      icon: "gear",
      icon_size: 16  # Larger icon (64px)
    )
  end

  # @label Using Slots
  def with_slots
    render Design::Typography::PageHeaderComponent.new do |c|
      c.with_prefix_slot do
        tag.div class: "text-sm font-bold text-subtle mbe-2 uppercase" do
          "🎨 Custom Prefix Slot"
        end
      end
      c.with_icon_slot do
        tag.div class: "w-16 h-16 bg-gray-200 rounded-lg flex items-center justify-center" do
          "🚀"
        end
      end
      c.with_title_slot do
        tag.h1 class: "text-5xl font-display font-bold m-0 text-primary" do
          "Slot-based Title"
        end
      end
      c.with_abstract_slot do
        tag.div class: "text-2xl text-subtle m-0 max-w-md" do
          "This example demonstrates using slots for complete control over the markup."
        end
      end
    end
  end
end
