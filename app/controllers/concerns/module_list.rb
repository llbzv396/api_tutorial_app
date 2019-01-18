require 'active_support/concern'
require 'net/http'

module GetStreetAddressByJson

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
end

module GetYouTubeVideosByJson
  DEVELOPER_KEY = 'AIzaSyAzWuLA-vXq0xDIvnV4GVNz7ly7_6LxAh8'
  YOUTUBE_API_SERVICE_NAME = 'youtube'
  YOUTUBE_API_VERSION = 'v3'
  def get_youtube_videos_by_json(keyword)
    query = URI.encode_www_form({ q: "#{keyword}" })
    uri = URI.parse("https://www.googleapis.com/#{YOUTUBE_API_SERVICE_NAME}/#{YOUTUBE_API_VERSION}/search?type=video&maxResults=15&part=snippet&#{query}&key=#{DEVELOPER_KEY}")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    http.use_ssl = true
    @response = http.request(request)
  end
end

module GetRakutenProductsByJson
  APPLICATION_ID = 1004101381634799173
  def get_rkauten_products_by_json(keyword)
    query = URI.encode_www_form({ keyword: "#{keyword}" })
    uri = URI.parse("https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?format=json&#{query}&applicationId=#{APPLICATION_ID}")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    http.use_ssl = true
    @response = http.request(request)
  end
end

module GetQiitaPostsByJson
  def get_qiita_posts_by_json(keyword,tag)
    uri = URI.parse("https://qiita.com/api/v2/items?page=1&per_page=10&query=tag%3A#{tag}+title%3A#{keyword}")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    http.use_ssl = true
    @response = http.request(request)
  end
end

module ModuleList
  extend ActiveSupport::Concern
  include GetStreetAddressByJson
  include GetYouTubeVideosByJson
  include GetRakutenProductsByJson
  include GetQiitaPostsByJson
end
