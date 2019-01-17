class SearchController < ApplicationController
  include ModuleList

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
    opts = Trollop::options do
      # defaultの中を検索したいワードにする
      opt :q, 'Search term', :type => String, :default => 'Google'
       # 検索結果の表示数を決める（最大50）
      opt :max_results, 'Max results', :type => :int, :default => 25
      end

    client, youtube = get_service

    begin
      search_response = client.execute!(
        :api_method => youtube.seach.list,
        :parameters => {
          :part => 'snippet',
          # 上で設定した検索ワードで検索をかける
          :q => opts[:q],
          # 上で設定した数だけ表示させる
          :maxResults => opts[:max_results]
        }
      )

      videos = []
    channels = []
    playlists = []

    search_response.data.items.each do |search_result|
      case search_result.id.kind
        when 'youtube#video'
          videos << "#{search_result.snippet.title} (#{search_result.id.videoId})"
        when 'youtube#channel'
          channels << "#{search_result.snippet.title} (#{search_result.id.channelId})"
        when 'youtube#playlist'
          playlists << "#{search_result.snippet.title} (#{search_result.id.playlistId})"
      end
    end

    puts "Videos:\n", videos, "\n"
    puts "Channels:\n", channels, "\n"
    puts "Playlists:\n", playlists, "\n"

    rescue Google::APIClient::TransmissionError => e
      puts e.result.body
    end
  end
end
