MyStore::Application.routes.draw do

  root to: "pages#frontpage"

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :items do
    get :upvote,    on: :member
    get :expensive, on: :collection
    get :crop_image, on: :member
    put :crop_image, on: :member
  end

  get "admin/users_count" => "admin#users_count"

  # match ':controller(/:action(/:id))(.:format)'
end
