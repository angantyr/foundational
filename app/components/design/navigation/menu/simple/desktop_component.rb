# frozen_string_literal: true

class Design::Navigation::Menu::Simple::DesktopComponent < ViewComponent::Base
  renders_one :brand
  renders_many :nav_items
  renders_many :actions

  def initialize
  end
end
