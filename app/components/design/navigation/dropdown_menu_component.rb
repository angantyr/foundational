# frozen_string_literal: true

class Design::Navigation::DropdownMenuComponent < ViewComponent::Base
  renders_one :brand
  renders_many :nav_items
  renders_many :desktop_actions
  renders_many :mobile_actions

  def initialize(trigger: :click)
    @trigger = trigger
  end

  def hover_trigger?
    @trigger == :hover
  end

  def trigger_actions
    hover_trigger? ? "mouseenter->popover#debouncedShow mouseleave->popover#debouncedHide" : nil
  end
end
