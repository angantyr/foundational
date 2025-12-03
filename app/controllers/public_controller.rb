class PublicController < ApplicationController
  include ActsAs::Site

  before_action :set_topnav_pages
  before_action :set_active_header

  private

  def set_topnav_pages
    @topnav_pages = top_nav_pages.limit(5)
  end

  def set_active_header
    return unless current_page

    page_ancestors = current_page.self_and_ancestors.map(&:permalink)
    nav_pages = top_nav_pages.map(&:permalink)
    @active_header = (page_ancestors & nav_pages).first
  end
end
