Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  unless Rails.env.production?
    apipie
  end


  defaults format: :json do
    resources :users, only: [:create, :update]

    get 'helloworld', to: 'hello_world#index'
    get 'search', to: 'search#search'
    get 'histories', to: 'histories#index'
    post 'login', to: 'authentication#authenticate'
  end
end
