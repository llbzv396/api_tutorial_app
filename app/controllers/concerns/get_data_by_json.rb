require 'active_support'
require 'net/http'

module GetDataByJson
  extend ActiveSupport::Concern

  def get_street_address_by_json(keyword)
    # hash形式でパラメータ文字列を指定し、URL形式にエンコード
    # word には zipcode=1670034 の文字列が代入される
    word = URI.encode_www_form({ zipcode: "#{keyword}" })
    # URIを解析し、scheme,host,port,pathなどを取得できるようにする
    # URIが生成され、uriに代入される
    uri = URI.parse("http://zipcloud.ibsnet.co.jp/api/search?#{word}")
    # リクエストパラメータをインスタンスに代入("zipcode=1670034")
    @query = uri.query
    # httpセッションを開始し、結果をresponseに代入
    @response = Net::HTTP.start(uri.host, uri.port) do |http|
      # 接続時に待つ最大秒数を設定
      http.open_timeout = 5
      # 読み込み１回でブロックして良い最大秒数を設定
      http.read_timeout = 10
      # WebAPIを叩く、インスタンスを取得してくる
      http.get(uri.request_uri)
    end
  end

  def get_youtube_videos_by_json(keyword)
    @word = keyword
  end
end
