# frozen_string_literal: true

# Extend Web::Page from the web engine with placeholder image support
Rails.application.config.to_prepare do
  Web::Page.include Media::Placeholder
end
