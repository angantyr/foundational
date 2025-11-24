# frozen_string_literal: true

class Design::Navigation::DropdownMenu::DropdownItemComponent < ViewComponent::Base
  renders_one :dropdown_content
  renders_one :mobile_content

  def initialize(label:, popover_id:, trigger_actions: nil, popover_width: "14rem")
    @label = label
    @popover_id = popover_id
    @trigger_actions = trigger_actions
    @popover_width = popover_width
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
