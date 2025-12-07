# frozen_string_literal: true

class Design::Typography::SubheaderComponent < ViewComponent::Base
  def initialize(title:, aside: nil)
    @title = title
    @aside = aside
  end
end
