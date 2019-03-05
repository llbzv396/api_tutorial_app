Rails.application.routes.draw do
  root 'search#form'
  post '/search/postal',  to: 'search#postal'
  post '/search/youtube', to: 'search#youtube'
  post '/search/rakuten', to: 'search#rakuten'
  post '/search/qiita',   to: 'search#qiita'
  
  get '/search/postal',  to: 'search#form'
  get '/search/youtube', to: 'search#form'
  get '/search/rakuten', to: 'search#form'
  get '/search/qiita',   to: 'search#form'
end
