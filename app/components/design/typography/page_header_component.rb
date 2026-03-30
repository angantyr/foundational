# frozen_string_literal: true

class Design::Typography::PageHeaderComponent < ViewComponent::Base
  # Allow slots for finer control
  renders_one :prefix_slot
  renders_one :icon_slot
  renders_one :title_slot
  renders_one :abstract_slot

  attr_reader :title, :abstract, :prefix, :icon, :icon_size

  def initialize(title: nil, abstract: nil, prefix: nil, icon: nil, icon_size: nil)
    @title = title
    @abstract = abstract
    @prefix = prefix
    @icon = icon
    @icon_size = icon_size
  end

  def icon_size_class
    # Use explicit size if provided, otherwise default to large (12 = 48px)
    size = @icon_size || 12
    "w-#{size} h-#{size}"
  end
end
