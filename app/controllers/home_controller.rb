class HomeController < PublicController
  def index
    @home_page = Web::Page.root
  end
end
