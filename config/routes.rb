Rails.application.routes.draw do
  devise_for :users, skip: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      scope 'users' do
        get '/', to: 'users#index'
        get 'show/:id', to: 'users#show'
        post 'create', to: 'users#create'
        patch 'update/:id', to: 'users#update'
        delete 'delete/:id', to: 'users#delete'
        post 'login', to: 'users#login'
        post 'logout', to: 'users#logout'
      end

      scope 'friendships' do
        get '/', to: 'friendships#index'
        get 'show/:id', to: 'friendships#show'
        post 'create', to: 'friendships#create'
        patch 'update/:id', to: 'friendships#update'
        delete 'delete/:id', to: 'friendships#delete'
      end
    end
  end
end
