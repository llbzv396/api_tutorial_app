Rails.application.routes.draw do
  root 'static_pages#index'
  post '/search', to: 'search#search'
end
