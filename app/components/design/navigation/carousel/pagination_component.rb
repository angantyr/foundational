# frozen_string_literal: true

class Design::Navigation::Carousel::PaginationComponent < ViewComponent::Base
  attr_reader :index

  def initialize(index:)
    @index = index
  end
end
