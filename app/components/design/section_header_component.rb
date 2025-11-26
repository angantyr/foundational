# frozen_string_literal: true

class Design::SectionHeaderComponent < ViewComponent::Base
  def initialize(title:, summary: nil)
    @title = title
    @summary = summary
  end
end
