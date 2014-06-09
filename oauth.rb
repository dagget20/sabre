require 'httparty'
require 'json'
require 'base64'



class Sabre
	include HTTParty
	def self.get_token
		
		
		client_id = Base64.strict_encode64("")
		client_secret = Base64.strict_encode64('')
		credentials = Base64.strict_encode64("#{client_id}:#{client_secret}")

	
		req = post('https://api.test.sabre.com/v1/auth/token', 
			:headers => {"User-Agent" => "tripea", "Authorization" => "Basic #{credentials}", "Content-type" => "application/x-www-form-urlencoded"},
			:ssl_version => :TLSv1,
			:verbose     => true,
			:body => { :grant_type => 'client_credentials'})
		
		@@token = req['access_token']
	end

end

response = Sabre.get_token
puts response
