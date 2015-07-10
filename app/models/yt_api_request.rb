require 'google/api_client'

class YtApiRequest
  DEVELOPER_KEY = 'AIzaSyBqDi5pCmyFZm6hRuuCDPaMsOtxTNjQHNM'
  YOUTUBE_API_SERVICE_NAME = 'youtube'
  YOUTUBE_API_VERSION = 'v3'

  def initialize
    @videos = []
    @channels = []
    @playlists = []
  end

  def init_service
    client = Google::APIClient.new(
      :key => DEVELOPER_KEY,
      :authorization => nil,
      :application_name => $PROGRAM_NAME,
      :application_version => '1.0.0'
    )
    youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

    return client, youtube
  end

  def youtube_request(term)
    client, youtube = init_service

    begin
      search_response = client.execute!(
        :api_method => youtube.search.list,
        :parameters => {
          :part => 'snippet',
          :q => term,
          :maxResults => 24
        }
      )

      sort_result(search_response)

      puts "Videos:\n", @videos, "\n"
      return @videos
    rescue Google::APIClient::TransmissionError => e
      puts e.result.body
    end
  end

  def sort_result(search_response)
    search_response.data.items.each do |search_result|
      case search_result.id.kind
        when 'youtube#video'
          @videos << "#{search_result.id.videoId}"
      end
    end
  end
end
