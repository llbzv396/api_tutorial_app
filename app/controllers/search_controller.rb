class SearchController < ApplicationController
  include GetDataByJson

  def postal
    get_street_address_by_json(params[:word])
    # @responseのbody要素をJSON形式で解釈し、hashに変換
    @result = JSON.parse(@response.body)
    # 表示用の変数に結果を格納
    @zipcode =  @result["results"][0]["zipcode"]
    @address1 = @result["results"][0]["address1"]
    @reading1 = @result["results"][0]["kana1"]
    @address2 = @result["results"][0]["address2"]
    @reading2 = @result["results"][0]["kana2"]
    @address3 = @result["results"][0]["address3"]
    @reading3 = @result["results"][0]["kana3"]
  end

  def youtube
    get_youtube_videos_by_json(params[:word])
    @word = "入力してください" if @word.blank?
  end
end
