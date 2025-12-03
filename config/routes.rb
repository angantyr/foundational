class PagePathConstraint
  def matches?(request)
    !request.path_parameters[:path].match(/^(rails|images|media|manage|admin|login|logout|register|auth)/)
  end
end



Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount Lookbook::Engine, at: "/lookbook" if Rails.env.development?
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"
  # web engine tries to catch any uncaught paths
  get '*path' => 'web/pages#show', constraints: PagePathConstraint.new

end
