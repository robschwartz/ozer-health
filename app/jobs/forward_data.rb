require 'uri'
require 'net/http'

module ForwardData
  def self.send_to_bucket(req_info)

    url = URI("https://data-bucket.herokuapp.com/incoming")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["authorization"] = 'Basic cm9iOnJvYg=='
    request["content-type"] = 'application/json'
    request.body = req_info.to_json

    response = http.request(request)
    puts response.read_body
  end
end
