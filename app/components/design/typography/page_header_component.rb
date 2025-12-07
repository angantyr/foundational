# frozen_string_literal: true

class Design::Typography::PageHeaderComponent < ViewComponent::Base
  def initialize(title:, abstract: nil, prefix: nil, icon: nil)
    @title = title
    @abstract = abstract
    @prefix = prefix
    @icon = icon
  end
end
