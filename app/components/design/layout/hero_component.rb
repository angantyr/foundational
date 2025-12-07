# frozen_string_literal: true

class Design::Layout::HeroComponent < ViewComponent::Base
  renders_one :header

  def initialize(title: nil, abstract: nil, prefix: nil, icon: nil)
    @title = title
    @abstract = abstract
    @prefix = prefix
    @icon = icon
  end

  def render_header?
    header? || @title.present?
  end
end
