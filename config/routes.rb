Rails.application.routes.draw do
  root 'search#form'
  get '/search/postal',  to: 'search#postal'
  get '/search/youtube', to: 'search#youtube'
  get '/search/rakuten', to: 'search#rakuten'
  get '/search/qiita',   to: 'search#qiita'
end
