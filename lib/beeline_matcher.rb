require "beeline_matcher/version"
require 'nokogiri'
require 'open-uri'

module BeelineMatcher
  class Matcher
    def initialize(uri)
    	# Set the uri 
    	@uri = uri
    end

    def get_ingredients()
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
  end
end
