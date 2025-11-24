# frozen_string_literal: true

class Design::Navigation::SimpleMenu::MobileComponent < ViewComponent::Base
  renders_many :nav_items
  renders_many :actions

  def initialize
  end
end
