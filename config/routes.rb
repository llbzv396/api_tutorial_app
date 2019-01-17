Rails.application.routes.draw do
  root 'search#form'
  post '/search/postal',  to: 'search#postal'
  post '/search/youtube', to: 'search#youtube'
end
