# frozen_string_literal: true

class Design::Element::ButtonComponent < ViewComponent::Base
  attr_reader :variant, :size, :icon, :icon_position, :tag, :href

  def initialize(label: nil, variant: :primary, size: :md, icon: nil, icon_position: :left, tag: :a, href: nil, **attrs)
    @label = label
    @variant = variant.to_sym
    @size = size.to_sym
    @tag = tag
    @href = href
    @icon = icon
    @icon_position = icon_position.to_sym 
    @attrs = attrs
  end

  def call
    tag_options = @attrs.merge(href_options).merge(class: button_classes)

    body = content? ? content : @label
    content_parts = [body]
    content_parts.unshift(icon_html) if icon_html && icon_position != :right
    content_parts.push(icon_html)   if icon_html && icon_position == :right

    helpers.tag.public_send(tag, **tag_options) do
      safe_join(content_parts.compact, " ")
    end
  end

  private

  def href_options
    tag == :a && href ? { href: href } : {}
  end

  def icon_html
    return unless icon
    helpers.icon(icon, class: icon_size_class)
  end

  def button_classes
    [
      "btn",
      variant_class,
      size_class,
      "btn--rounded",
      @attrs[:class]
    ].compact.join(" ")
  end

  def size_class
    {
      lg: "btn--large",
      xl: "btn--large"
    }[size]
  end

  def icon_size_class
    {
      sm: "w-3 h-3",
      md: "w-4 h-4",
      lg: "w-5 h-5",
      xl: "w-6 h-6"
    }[size]
  end

  def variant_class
    {
      primary: "btn--primary",
      inverted: "btn--secondary",
      secondary: "btn--secondary",
      outline: "btn--outline",
      ghost: "btn--ghost",
      link: "btn--link",
      alert: "btn--negative",
      warning: "btn--negative",
      success: "btn--positive"
    }[variant]
  end


end
