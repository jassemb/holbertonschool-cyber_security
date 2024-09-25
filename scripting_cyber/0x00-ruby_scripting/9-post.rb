# 10-post.rb

require 'net/http'
require 'uri'
require 'json'

def post_request(url, body_params = {})
  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = (uri.scheme == 'https')
  request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
  request.body = body_params.to_json
  response = http.request(request)

  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"
  begin
    response_body = JSON.pretty_generate(JSON.parse(response.body))
    puts response_body
  rescue JSON::ParserError
    puts response.body
  end

  unless response.is_a?(Net::HTTPSuccess)
    puts "Request failed with status: #{response.code} #{response.message}"
  end
end