require 'httparty'
require 'json'



class Sabre
	include HTTParty
	def self.get_token
		
		
		client_id = ''
		clien_secret = ''
		credentials = Base64.encode64("#{client_id}:#{clien_secret}")

	
		post('https://api.sabre.com/v1/auth/token', :headers => {"User-Agent" => "tripea", "Authorization" => "Basic #{credentials}", "Content-type" => "application/x-www-form-urlencoded"}, :query => { grant_type: "client_credentials"})
		
	end

end

client = Sabre.new
response = Sabre.get_token
puts response
