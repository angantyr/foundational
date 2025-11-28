# frozen_string_literal: true

class Design::Navigation::Tabs::ButtonComponent < ViewComponent::Base
  attr_reader :index

  def initialize(index:)
    @index = index
  end

  def trigger_id
    "trigger_#{index}"
  end

  def tab_id
    "tab_#{index}"
  end
end
