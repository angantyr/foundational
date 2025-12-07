# frozen_string_literal: true

class Design::Layout::GridComponent < ViewComponent::Base
  renders_many :items

  def initialize(columns: 4)
    @columns = columns
  end

  def grid_classes
    "grid grid-cols-1 grid-cols-2@sm grid-cols-#{@columns}@lg gap-y-10 gap-x-12"
  end
end
