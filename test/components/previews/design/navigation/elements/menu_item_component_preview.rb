# frozen_string_literal: true

class Design::Navigation::Elements::MenuItemComponentPreview < ViewComponent::Preview
  # @label Default
  def default
    render(Design::Navigation::Elements::MenuItemComponent.new(
      label: "Corporate",
      href: "/modules/corporate",
      icon: "hotel"
    ))
  end

  # @label With Description
  def with_description
    render(Design::Navigation::Elements::MenuItemComponent.new(
      label: "Business",
      href: "/modules/business",
      icon: "briefcase-business",
      description: "Manage your business operations and workflows"
    ))
  end

  # @label With Chevron
  def with_chevron
    render(Design::Navigation::Elements::MenuItemComponent.new(
      label: "View all modules",
      href: "/modules",
      icon: "layout-dashboard",
      show_chevron: true
    ))
  end

  # @label Without Icon
  def without_icon
    render(Design::Navigation::Elements::MenuItemComponent.new(
      label: "Simple Link",
      href: "/link",
      show_icon: false
    ))
  end

  # @label Static (No Link)
  def static
    render(Design::Navigation::Elements::MenuItemComponent.new(
      label: "Menu Header",
      icon: "globe"
    ))
  end

  # @label Card Variant
  def card
    render(Design::Navigation::Elements::MenuItemComponent.new(
      label: "Corporate",
      href: "/modules/corporate",
      icon: "hotel",
      description: "Manage companies, subsidiaries, offices, and people. Define reporting structures, organizational charts, departments, and teams.",
      variant: :card
    ))
  end

  # @label Card Grid
  def card_grid
    components = [
      Design::Navigation::Elements::MenuItemComponent.new(
        label: "Corporate",
        href: "/modules/corporate",
        icon: "hotel",
        description: "Manage companies, subsidiaries, offices, and people. Define reporting structures, organizational charts, departments, and teams.",
        variant: :card
      ),
      Design::Navigation::Elements::MenuItemComponent.new(
        label: "Business",
        href: "/modules/business",
        icon: "briefcase-business",
        description: "A set of defaults for managing solutions, products, and services. Onboard partners.",
        variant: :card
      ),
      Design::Navigation::Elements::MenuItemComponent.new(
        label: "Catalog",
        href: "/modules/catalog",
        icon: "book-open-text",
        description: "Build product pages on best practices for key features, benefits, detailed specs, related products and collateral.",
        variant: :card
      ),
      Design::Navigation::Elements::MenuItemComponent.new(
        label: "Web",
        href: "/modules/web",
        icon: "globe",
        description: "Managed multiple websites under multiple domains. Define information architecture, navigation, site, accessibility constraints.",
        variant: :card
      )
    ]

    render_with_template(locals: { components: components })
  end

  # @label Menu List
  def menu_list
    components = [
      Design::Navigation::Elements::MenuItemComponent.new(
        label: "Corporate",
        href: "/modules/corporate",
        icon: "hotel",
        show_chevron: true
      ),
      Design::Navigation::Elements::MenuItemComponent.new(
        label: "Business",
        href: "/modules/business",
        icon: "briefcase-business",
        show_chevron: true
      ),
      Design::Navigation::Elements::MenuItemComponent.new(
        label: "Catalog",
        href: "/modules/catalog",
        icon: "book-open-text",
        show_chevron: true
      ),
      Design::Navigation::Elements::MenuItemComponent.new(
        label: "Web",
        href: "/modules/web",
        icon: "globe",
        show_chevron: true
      ),
      Design::Navigation::Elements::MenuItemComponent.new(
        label: "Collateral",
        href: "/modules/collateral",
        icon: "book-image",
        show_chevron: true
      ),
      Design::Navigation::Elements::MenuItemComponent.new(
        label: "Broadcast",
        href: "/modules/broadcast",
        icon: "radio-tower",
        show_chevron: true
      ),
      Design::Navigation::Elements::MenuItemComponent.new(
        label: "Store",
        href: "/modules/store",
        icon: "shopping-cart",
        show_chevron: true
      ),
      Design::Navigation::Elements::MenuItemComponent.new(
        label: "Media",
        href: "/modules/media",
        icon: "image",
        show_chevron: true
      )
    ]

    render_with_template(locals: { components: components })
  end
end
