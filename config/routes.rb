Rails.application.routes.draw do
  root 'search#form'
  post '/search/postal',  to: 'search#postal'
  post '/search/youtube', to: 'search#youtube'
  post '/search/rakuten', to: 'search#rakuten'
  post '/search/qiita',   to: 'search#qiita'
end
