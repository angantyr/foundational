# frozen_string_literal: true

class Design::Navigation::Menu::SimpleComponent < ViewComponent::Base
  renders_one :brand
  renders_many :nav_items
  renders_many :desktop_actions
  renders_many :mobile_actions

  def initialize
  end
end
