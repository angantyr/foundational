# frozen_string_literal: true

class Design::TabsComponent < ViewComponent::Base
  attr_reader :variant

  def initialize(variant: :default)
    @tab_items = []
    @variant = variant
  end

  def before_render
    yield self if block_given?
  end

  def with_tab(label:)
    @tab_items << { label: label }
  end

  def tabs
    @tab_items
  end

  def tabs_class
    classes = ["tabs"]
    classes << "tabs--vertical" if variant == :vertical
    classes.join(" ")
  end
end
