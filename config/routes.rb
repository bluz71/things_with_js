Rails.application.routes.draw do
  root "things#index"

  resources :things do
    member do
      patch "countup" 
      patch "countdown" 
    end
  end

  namespace :json_thing do
    resource :thing, only: [] do
      member do
        get "rendered", defaults: { :format => :json }
        get "jbuilder", defaults: { :format => :json }
        get "collection", defaults: { :format => :json }
      end
    end
  end
end
