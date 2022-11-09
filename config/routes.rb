Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  resources :merchants, only: %i[index show] do
    collection do
      get 'search'
    end
  end
  resources :items, only: %i[index show] do
    collection do
      get 'search'
    end
  end
end
