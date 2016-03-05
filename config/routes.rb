Rails.application.routes.draw do
  root "things#index"

  resources :things do
    member do
      patch "countup" 
      patch "countdown" 
    end
  end
end
