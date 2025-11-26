# frozen_string_literal: true

class Design::FeatureGridComponent < ViewComponent::Base
  renders_many :features

  def initialize(columns: 4)
    @columns = columns
  end
end
