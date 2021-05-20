Rails.application.routes.draw do
  resources :lists, only: [:index, :show, :new, :create] do
    member do
      resources :bookmarks, only: [:new, :create]
    end
  end

  resources :bookmarks, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
