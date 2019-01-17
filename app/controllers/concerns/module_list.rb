require 'active_support/concern'

module GetStreetAddressByJson
  require 'net/http'

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
  require 'rubygems'
  require 'google/api_client'
  require 'trollop'

  DEVELOPER_KEY = 'AIzaSyAzWuLA-vXq0xDIvnV4GVNz7ly7_6LxAh8'
  YOUTUBE_API_SERVICE_NAME = 'youtube'
  YOUTUBE_API_VERSION = 'v3'

  def get_service
    client = Google::APIClient.new(
      :key => DEVELOPER_KEY,
      :authorization => nil,
      :application_name => $PROGRAM_NAME,
      :application_version => '1.0.0'
    )
      youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)
    return client, youtube
  end
end

module ModuleList
  extend ActiveSupport::Concern
  include GetStreetAddressByJson
  include GetYouTubeVideosByJson
end
