# frozen_string_literal: true

class Design::Layout::GridComponent < ViewComponent::Base
  renders_many :items

  def initialize(columns: 4)
    @columns = columns
  end

  def grid_classes
    "grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-#{@columns} gap-y-10 gap-x-12"
  end
end
