# frozen_string_literal: true

class Design::Navigation::Carousel::WidgetComponent < ViewComponent::Base
  renders_many :slides, Design::Navigation::Carousel::SlideComponent
  renders_many :paginations, Design::Navigation::Carousel::PaginationComponent
end
