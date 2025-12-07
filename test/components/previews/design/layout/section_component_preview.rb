# frozen_string_literal: true

class Design::Layout::SectionComponentPreview < ViewComponent::Preview
  # @label Simple Section (parameters)
  def simple
    render Design::Layout::SectionComponent.new(
      header: "Section Title",
      summary: "This is a summary that explains what this section is about."
    ) do |section|
      section.with_body do
        tag.p("Section body content goes here.", class: "text-base")
      end
    end
  end

  # @label With Custom Header
  def with_custom_header
    render_with_template
  end

  # @label With Grid and Cards
  def with_grid_and_cards
    render_with_template
  end
end
