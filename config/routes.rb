Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#new"
  resources :posts, only:[:index, :new, :create, :show]
  namespace :api do
    namespace :vi do
      post 'image_cheak' => 'posts#image_cheak'
    end
  end
end
