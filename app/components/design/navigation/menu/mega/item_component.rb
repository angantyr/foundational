# frozen_string_literal: true

class Design::Navigation::Menu::Mega::ItemComponent < ViewComponent::Base
  renders_one :header
  renders_one :links
  renders_one :footer
  renders_one :mobile_content

  def initialize(label:, popover_id:, trigger_actions: nil)
    @label = label
    @popover_id = popover_id
    @trigger_actions = trigger_actions
  end

  def controller_data
    attrs = {
      "data-controller": "popover",
      "data-popover-placement-value": "bottom-start"
    }
    attrs["data-action"] = @trigger_actions if @trigger_actions
    attrs
  end
end
