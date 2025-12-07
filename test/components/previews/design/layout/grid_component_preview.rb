# frozen_string_literal: true

class Design::Layout::GridComponentPreview < ViewComponent::Preview
  # @label 4 Column Grid
  def four_columns
    render_with_template(template: "design/layout/grid_component_preview/four_columns")
  end

  # @label 3 Column Grid
  def three_columns
    render_with_template(template: "design/layout/grid_component_preview/three_columns")
  end

  # @label 2 Column Grid
  def two_columns
    render_with_template(template: "design/layout/grid_component_preview/two_columns")
  end
end
