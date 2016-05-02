require 'nokogiri'
require 'open-uri'
require 'securerandom'
module BeelineMatcher
	class Ingredients
		attr_reader :filename
		def initialize(uri)
			@uri = uri
			@filename = gen_filename
		end

		def get_ingredients
			data = Nokogiri::HTML(open(@uri))

			# init variables
			ingredients = []

			data.xpath("//li").each do |x|
  				if x.to_s.include? "ingredients"
    				ingredients << x.content.to_s.strip
  				end
			end
			ingredients
		end

		def save
			file = File.open("crf/tmp/#{@filename}","w")
			file.puts(get_ingredients)
			file.close
			return @filename
		end

		private

		def gen_filename
			return "#{SecureRandom.urlsafe_base64}"
		end
	end
end