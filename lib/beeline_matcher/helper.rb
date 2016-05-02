require 'json'
module BeelineMatcher
	class Helper
		def self.parse(uri)
			# returns a hash with a function
			parser = BeelineMatcher::Parser.new(uri)
			parser.save_ingredients_to_file
			parser.parse_ingredients
			parser.convert_to_json

			# read in json file
			f = File.read("crf/tmp/#{parser.json_filename}")
			hash = JSON.parse(f)
			f.close

			# clean files
			parser.clean_files
			return hash
		end
	end
end