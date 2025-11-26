# frozen_string_literal: true

class Design::PageHeaderComponent < ViewComponent::Base
  def initialize(section:, title:, description:, icon: nil)
    @section = section
    @title = title
    @description = description
    @icon = icon
  end
end
