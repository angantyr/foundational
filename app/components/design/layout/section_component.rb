# frozen_string_literal: true

class Design::Layout::SectionComponent < ViewComponent::Base
  renders_one :header
  renders_one :body

  def initialize(header: nil, summary: nil)
    @header = header
    @summary = summary
  end

  def render_header?
    header? || @header.present?
  end
end
