# frozen_string_literal: true

class Design::Navigation::Carousel::WidgetComponent < ViewComponent::Base
  renders_many :slides, Design::Navigation::Carousel::SlideComponent
  renders_many :paginations
  renders_one :navigation

  attr_reader :pagination_position

  def initialize(pagination_position: :bottom)
    @pagination_position = pagination_position
  end
end
