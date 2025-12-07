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
    helpers.inline_svg_tag(icon, class: "w-4 h-4 #{icon_position == :right ? 'ml-2' : 'mr-2'}")
  end

  def button_classes
    [
      "inline-flex items-center justify-center font-medium tracking-wide rounded-full transition-colors focus:outline-none focus:ring-2 focus:ring-offset-2",
      size_class,
      variant_class,
      @attrs[:class]
    ].compact.join(" ")
  end

  def size_class
    {
      sm: "px-4 py-2 text-sm",
      md: "px-5 py-2 text-base",
      lg: "px-6 py-2 text-lg",
      xl: "px-8 py-3 text-xl"
    }[size]
  end

  def variant_class
    {
      primary: "bg-gray-800 text-gray-50 hover:text-white hover:bg-gray-600 hover:shadow focus:ring-gray-500",
      inverted: "bg-gray-50 text-gray-800 hover:bg-blue-700 focus:ring-blue-500",
      secondary: "bg-gray-200 text-gray-800 hover:bg-gray-300 focus:ring-gray-400",
      outline: "border border-gray-500 text-gray-800 hover:bg-gray-100 focus:ring-gray-400",
      alert: "bg-red-600 text-white hover:bg-red-700 focus:ring-red-500",
      warning: "bg-yellow-500 text-black hover:bg-yellow-600 focus:ring-yellow-400",
      success: "bg-green-600 text-white hover:bg-green-700 focus:ring-green-500"
    }[variant]
  end


end
