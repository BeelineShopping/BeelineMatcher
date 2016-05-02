module BeelineMatcher
	class Model
		attr_accessor :file
		# Creates a new object which has a CRF++ generated model file
		def initialize(model_path)
			if File.exists?(model_path)
				@file = File.open(model_path,'r')
			else
				raise NoFileError.new(model_path), "file not found: #{model_path}"
			end
		end
	end
end