# frozen_string_literal: true

class Design::Navigation::Menu::DropdownComponentPreview < ViewComponent::Preview
  # @label Click Trigger
  def click_trigger
    render_with_template(locals: { trigger: :click })
  end

  # @label Hover Trigger
  def hover_trigger
    render_with_template(locals: { trigger: :hover })
  end

  private

  def modules_menu_items
    [
      { label: "Corporate", icon: "hotel" },
      { label: "Business", icon: "briefcase-business" },
      { label: "Catalog", icon: "book-open-text" },
      { label: "Web", icon: "globe" },
      { label: "Collateral", icon: "book-image" },
      { label: "Broadcast", icon: "radio-tower" },
      { label: "Store", icon: "shopping-cart" },
      { label: "Media", icon: "image" }
    ]
  end
end
