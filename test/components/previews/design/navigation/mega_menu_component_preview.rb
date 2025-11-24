# frozen_string_literal: true

class Design::Navigation::MegaMenuComponentPreview < ViewComponent::Preview
  # @label Hover Trigger (Default)
  def hover_trigger
    render_with_template(locals: { trigger: :hover })
  end

  # @label Click Trigger
  def click_trigger
    render_with_template(locals: { trigger: :click })
  end
end
