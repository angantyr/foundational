# frozen_string_literal: true

class Design::Typography::HeaderComponent < ViewComponent::Base
  def initialize(title:, subtitle:)
    @title = title
    @subtitle = subtitle
  end
end
