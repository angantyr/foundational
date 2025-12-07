# frozen_string_literal: true

class Design::Typography::SubHeaderComponentPreview < ViewComponent::Preview
  # @label With Header and Summary
  def with_summary
    render Design::Typography::SubHeaderComponent.new(
      header: "Powerful Features",
      summary: "All modules share a set of powerful features that keeps you moving"
    )
  end

  # @label Header Only
  def header_only
    render Design::Typography::SubHeaderComponent.new(
      header: "Section Title"
    )
  end
end
