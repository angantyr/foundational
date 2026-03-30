# frozen_string_literal: true

class Design::Layout::GridComponentPreview < ViewComponent::Preview
  # @label Interactive Grid
  # @param columns select [1, 2, 3, 4, 5, 6] "Explicit columns (leave empty for smart layout)"
  # @param max_columns select [2, 3, 4, 5, 6] "Max columns for smart layout"
  # @param gap select [2, 4, 6, 8, 10] "Gap size"
  # @param item_count number "Number of items"
  def interactive(columns: 4, max_columns: 4, gap: 4, item_count: 12)
    # Convert string params to integers
    columns = columns.to_i if columns.present?
    max_columns = max_columns.to_i
    gap = gap.to_i
    item_count = item_count.to_i

    render Design::Layout::GridComponent.new(columns: columns, max_columns: max_columns, gap: gap) do |grid|
      item_count.times do |i|
        grid.with_item do
          tag.div(class: "pis-6 pie-6 pbs-6 pbe-6 border border-main rounded-lg bg-surface") do
            tag.h3(class: "text-lg font-semibold m-0 mbe-2") { "Item #{i + 1}" } +
            tag.p(class: "text-sm text-subtle m-0") { "Grid item content goes here." }
          end
        end
      end
    end
  end

  # Pattern creates multiple grids with different column counts.
  # For example, pattern [2,3] means: first 2 items in 2 columns, then 3 items in 3 columns, and repeats.
  # Each batch gets its own grid with responsive breakpoints.
  #
  # @label Pattern Layout
  # @param pattern text "Pattern (comma-separated, e.g. '2,3' or '2,3,2')"
  # @param gap select [2, 4, 6, 8, 10] "Gap size"
  # @param item_count number "Number of items"
  def pattern_layout(pattern: "2,3", gap: 6, item_count: 8)
    # Convert string params to proper types
    pattern_array = pattern.present? ? pattern.split(",").map(&:strip).map(&:to_i) : [2, 3]
    gap = gap.to_i
    item_count = item_count.to_i

    render(Design::Layout::GridComponent.new(pattern: pattern_array, gap: gap)) do |grid|
      item_count.times do |i|
        grid.with_item do
          tag.div(class: "pis-6 pie-6 pbs-6 pbe-6 border border-main rounded-lg bg-surface") do
            tag.h3(class: "text-lg font-semibold m-0 mbe-2") { "Item #{i + 1}" } +
            tag.p(class: "text-sm text-subtle m-0") { "Pattern layout item" }
          end
        end
      end
    end
  end
end
