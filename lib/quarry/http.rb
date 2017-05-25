require 'net/http'

module Quarry
	class HTTP
		def self.get(url, options = {})
			uri = URI(url)
			if options.any?
			 uri.query = URI.encode_www_forms(options)
			end	 

			response = Net::HTTP.get_response(uri)
			return response.body if response.is_a?(Net::HTTPSuccess)
		end
	end
end

