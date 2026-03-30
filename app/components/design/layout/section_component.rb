# frozen_string_literal: true

class Design::Layout::SectionComponent < ViewComponent::Base
  renders_one :header
  renders_one :body

  attr_reader :header_text, :summary

  def initialize(header: nil, summary: nil)
    @header_text = header
    @summary = summary
  end

  def render_header?
    header? || header_text.present?
  end
end
