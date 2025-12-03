# frozen_string_literal: true

# Extend engine models with additional concerns and functionality
Rails.application.config.to_prepare do
  Web::Page.include Design::Iconifiable unless Web::Page.include?(Design::Iconifiable)
  Web::Page.include Media::Placeholder unless Web::Page.include?(Media::Placeholder)
end
