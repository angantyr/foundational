# frozen_string_literal: true

class Design::Navigation::Shared::NavItemComponentPreview < ViewComponent::Preview
  # @label Default
  def default
    render(Design::Navigation::Shared::NavItemComponent.new(
      label: "Solutions",
      href: "/solutions",
      active: false
    ))
  end

  # @label Active State
  def active
    render(Design::Navigation::Shared::NavItemComponent.new(
      label: "Solutions",
      href: "/solutions",
      active: true
    ))
  end

  # @label With Icon
  def with_icon
    render(Design::Navigation::Shared::NavItemComponent.new(
      label: "Business",
      href: "/business",
      icon: "briefcase-business",
      show_icon: true
    ))
  end

  # @label Multiple Items
  def multiple
    components = [
      Design::Navigation::Shared::NavItemComponent.new(
        label: "Solutions",
        href: "/solutions"
      ),
      Design::Navigation::Shared::NavItemComponent.new(
        label: "Products",
        href: "/products",
        active: true
      ),
      Design::Navigation::Shared::NavItemComponent.new(
        label: "About",
        href: "/about"
      )
    ]

    render_with_template(locals: { components: components })
  end
end
