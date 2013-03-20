MyStore::Application.routes.draw do

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  devise_for :users

  resources :items do
    get :upvote,    on: :member
    get :expensive, on: :collection
  end

  match "admin/users_count" => "admin#users_count"

  # match ':controller(/:action(/:id))(.:format)'
end
