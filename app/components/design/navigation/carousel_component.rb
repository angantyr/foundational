# frozen_string_literal: true

class Design::Navigation::CarouselComponent < ViewComponent::Base
  renders_many :slides, Design::Navigation::Carousel::SlideComponent
end
