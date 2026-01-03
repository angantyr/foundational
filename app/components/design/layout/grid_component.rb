# frozen_string_literal: true

class Design::Layout::GridComponent < ViewComponent::Base
  renders_many :items

  def initialize(columns: nil, max_columns: 4, gap: 4, pattern: nil)
    @columns = columns  # Explicit column count (backwards compat)
    @max_columns = max_columns
    @gap = gap
    @pattern = pattern
  end

  def has_pattern?
    @pattern.present?
  end

  def batched_items
    return [] unless has_pattern?

    batches = []
    remaining = items.to_a
    pattern_index = 0

    until remaining.empty?
      batch_size = @pattern[pattern_index % @pattern.length]
      batch_items = remaining.take(batch_size)
      batches << {
        items: batch_items,
        columns: batch_items.length  # Actual item count, not pattern size
      }
      remaining = remaining.drop(batch_size)
      pattern_index += 1
    end

    batches
  end

  def calculated_columns(item_count = nil)
    # Explicit column count takes precedence
    return @columns if @columns

    # Smart: use item count, capped at max
    count = item_count || items.length
    [count, @max_columns].min
  end

  def grid_classes(columns = nil)
    # Use provided columns, or calculate based on items
    col_count = columns || calculated_columns

    classes = ["grid", "grid-cols-1", "gap-#{@gap}"]

    # Smart responsive breakpoints based on column count
    case col_count
    when 1
      # Single column - stays 1 column at all breakpoints
      # (no additional classes needed)
    when 2
      classes << "sm:grid-cols-2"
    when 3
      classes << "sm:grid-cols-2"
      classes << "lg:grid-cols-3"
    when 4
      classes << "sm:grid-cols-2"
      classes << "md:grid-cols-3"
      classes << "lg:grid-cols-4"
    when 5, 6
      classes << "sm:grid-cols-2"
      classes << "md:grid-cols-3"
      classes << "lg:grid-cols-#{col_count}"
    else
      # For any other column count, just set it at lg
      classes << "lg:grid-cols-#{col_count}"
    end

    classes.join(" ")
  end
end
