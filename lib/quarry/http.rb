require 'net/http'

module Quarry
	class HTTP
		def self.get(url, options = {}, headers = {})
			uri = URI(url)

			# set URL parameters, if any exist. 
			if options.any?
			 uri.query = URI.encode_www_form(options)
			end	 

			# creates new HTTP::Get object from our uri
		  request = Net::HTTP::Get.new(uri)

			# sets addition HTTP headers in the request, if any exist as parameters
			if headers.any?
				headers.each do |k, v|
					request[k] = v
				end
			end
			
			puts "#{request.to_hash}"
			# perform the request, this opens a connection and closes it within the block
			response = Net::HTTP.start(uri.host, uri.port) do |http|
				http.request(request)
			end			
		  
			return response	
		end

		def self.post(url, options = {}, headers = {})
			uri = URI(url)

			request = Net::HTTP::Post.new(uri)

			# sets addition HTTP headers in the request, if any exist as parameters
			if headers.any?
				headers.each do |k, v|
					request[k] = v
				end
			end

			request.set_form_data(options)

			response = Net::HTTP.start(uri.hostname, uri.port) do |http|
				http.request(request)
			end
			return response
		end
	end
end

