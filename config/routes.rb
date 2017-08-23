Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  scope :api do
    resources :recipes do
      resources :ingredients
    end
  end



  root to: 'home#index'

  match '*path' => 'home#index', via: :get


end
