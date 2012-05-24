MyStore::Application.routes.draw do
  resources :items
  # match ':controller(/:action(/:id))(.:format)'
end
