# frozen_string_literal: true

class Design::Layout::GridComponent < ViewComponent::Base
  renders_many :items

  def initialize(columns: 4, gap: 4)
    @columns = columns
    @gap = gap
  end

  def grid_classes
    classes = ["grid", "grid-cols-1", "gap-#{@gap}"]

    # Smart responsive breakpoints based on column count
    case @columns
    when 4
      classes << "sm:grid-cols-2"
      classes << "md:grid-cols-3"
      classes << "lg:grid-cols-4"
    when 3
      classes << "sm:grid-cols-2"
      classes << "lg:grid-cols-3"
    when 2
      classes << "sm:grid-cols-2"
    when 5, 6
      classes << "sm:grid-cols-2"
      classes << "md:grid-cols-3"
      classes << "lg:grid-cols-#{@columns}"
    else
      # For any other column count, just set it at lg
      classes << "lg:grid-cols-#{@columns}"
    end

    classes.join(" ")
  end
end
