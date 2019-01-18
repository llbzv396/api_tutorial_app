class SearchController < ApplicationController
  include ModuleList

  def postal
    get_street_address_by_json(params[:word])
    # @responseのbody要素をJSON形式で解釈し、hashに変換
    @result = JSON.parse(@response.body)
    # 表示用の変数に結果を格納
    @zipcode =  @result["results"][0]["zipcode"]
    @address1 = @result["results"][0]["address1"]
    @address2 = @result["results"][0]["address2"]
    @address3 = @result["results"][0]["address3"]
  end

  def youtube
    get_youtube_videos_by_json(params[:word])
    @movies = JSON.parse(@response.body)
  end

  def rakuten
    get_rkauten_products_by_json(params[:word])
    @products = JSON.parse(@response.body)
    @products = @products["Items"]
  end

  def qiita
    get_qiita_posts_by_json(params[:word],params[:tag])
    @posts = JSON.parse(@response.body)
    #byebug
  end
end
