# frozen_string_literal: true

class Design::Typography::SubHeaderComponent < ViewComponent::Base
  attr_reader :header, :summary

  def initialize(header:, summary: nil)
    @header = header
    @summary = summary
  end
end
