class GoogleCloudVision
  attr_accessor :endpoint_uri, :file_path

    def initialize(file_path)
      @endpoint_uri = "https://vision.googleapis.com/v1/images:annotate?key=#{ENV['GOOGLE_APPLICATION_CREDENTIALS']}"
      @file_path = file_path
    end

    def request
      http_client = HTTPClient.new
      content = Base64.strict.encode64(File.new(file_path, 'rb').read)
      response = http_client.post_content(endpoint_uri, request_json(content), 'Content-Type' => 'application/json')
      descriptions = fetch_descriptions(response)
    end

    def request_json(content)
      {
        request: [{
          image: {
            content: content
          },
          features: [{
            type: 'LABEL_DETECTION',
            maxResults: 10
          }]
        }]
          }.to_json
    end

    def fetch_descriptions(response)
      result = JSON.parse(response)['response'].first
      label = result['labelAnnotations'].first
      "これは#{label['description']}です。"
    end
end

