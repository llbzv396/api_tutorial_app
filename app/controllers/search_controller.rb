class SearchController < ApplicationController
  include ModuleList

  def postal(word = params[:word])
    if /\d{3}-\d{4}/ === word || /\d{7}/ === word
      get_street_address_by_json(word)
    else
      flash[:ERROR] = '正しい郵便番号を入力してください'
      redirect_to root_path
      return
    end
    # @responseのbody要素をJSON形式で解釈し、hashに変換
    @result = JSON.parse(@response.body)
    if @result["results"]
      # 表示用の変数に結果を格納
      @zipcode =  @result["results"][0]["zipcode"]
      @address1 = @result["results"][0]["address1"]
      @address2 = @result["results"][0]["address2"]
      @address3 = @result["results"][0]["address3"]
    else
      flash[:ERROR] = '該当する住所はありません'
      redirect_to root_path
      return
    end
  end

  def youtube(word = params[:word])
    get_youtube_videos_by_json(word)
    @movies = JSON.parse(@response.body)
    if @movies["items"].blank?
      flash[:ERROR] = '該当する動画はありません'
      redirect_to root_path
      return
    end
  end

  def rakuten(word = params[:word])
    get_rkauten_products_by_json(word)
    @products = JSON.parse(@response.body)
    if @products["Items"].blank?
      flash[:ERROR] = '該当する商品はありません'
      redirect_to root_path
      return
    end
    @products = @products["Items"]
  end

  def qiita(word = params[:word], tag = params[:tag])
    get_qiita_posts_by_json(word, tag)
    @posts = JSON.parse(@response.body)
    if @posts.blank?
      flash[:ERROR] = '該当する記事はありません'
      redirect_to root_path
      return
    end
  end
end
