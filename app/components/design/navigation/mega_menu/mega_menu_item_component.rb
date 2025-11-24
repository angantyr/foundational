# frozen_string_literal: true

class Design::Navigation::MegaMenu::MegaMenuItemComponent < ViewComponent::Base
  renders_one :megamenu_content
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
