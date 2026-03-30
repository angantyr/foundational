# frozen_string_literal: true

class Design::Typography::SubHeaderComponentPreview < ViewComponent::Preview
  # Centered section header with optional summary text below.
  # Used to introduce content sections on a page.
  #
  # @label Interactive
  # @param header text "Header text"
  # @param summary textarea "Summary text (leave empty for header only)"
  def interactive(header: "Powerful Features", summary: "All modules share a set of powerful features that keeps you moving")
    # Only pass summary if it has content
    summary_param = summary.present? ? summary : nil

    render Design::Typography::SubHeaderComponent.new(
      header: header,
      summary: summary_param
    )
  end
end
