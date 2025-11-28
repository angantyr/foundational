# frozen_string_literal: true

class Design::Navigation::Tabs::WidgetComponent < ViewComponent::Base
  attr_reader :variant

  renders_many :buttons, ->(index: nil, &block) do
    index = buttons.size if index.nil?
    Design::Navigation::Tabs::ButtonComponent.new(index: index, &block)
  end

  renders_many :panels, ->(index: nil, &block) do
    index = panels.size if index.nil?
    Design::Navigation::Tabs::PanelComponent.new(index: index, &block)
  end

  def initialize(variant: :default)
    @variant = variant
  end

  def tabs_class
    classes = ["tabs"]
    classes << "tabs--vertical" if variant == :vertical
    classes << "tabs--responsive" if variant == :responsive
    classes.join(" ")
  end
end
