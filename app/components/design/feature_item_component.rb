# frozen_string_literal: true

class Design::FeatureItemComponent < ViewComponent::Base
  def initialize(title:, description:, icon: nil, href: nil, border: false)
    @title = title
    @description = description
    @icon = icon
    @href = href
    @border = border
  end
end
