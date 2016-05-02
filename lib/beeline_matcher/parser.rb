module BeelineMatcher
	class Parser
		attr_reader :raw_ingredients_filename, :uri, :parsed_ingredients_filename, :json_filename, :ingredients
		def initialize(uri)
			@ingredients = BeelineMatcher::Ingredients.new(uri)
		end

		def save_ingredients_to_file
			@raw_ingredients_filename = @ingredients.save
			return @raw_ingredients_filename
		end

		def parse_ingredients
			@parsed_ingredients_filename = "#{@raw_ingredients_filename}-parsed"
			system("python crf/lib/testing/parse-ingredients.py crf/tmp/#{@raw_ingredients_filename} > crf/tmp/#{@parsed_ingredients_filename}")
			return @parsed_ingredients_filename
		end

		def convert_to_json
			@json_filename = "#{@raw_ingredients_filename}.json"
			system("python crf/lib/testing/convert-to-json.py crf/tmp/#{@parsed_ingredients_filename} > crf/tmp/#{@json_filename}")
			return @json_filename
		end

		def clean_files
			if @raw_ingredients_filename
				system("rm crf/tmp/#{@raw_ingredients_filename}")
			end
			if @parsed_ingredients_filename
				system("rm crf/tmp/#{@parsed_ingredients_filename}")
			end
			if @json_filename
				system("rm crf/tmp/#{@json_filename}")
			end
		end
	end
end