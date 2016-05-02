module BeelineMatcher
	class Model
		attr_accessor :file
		# Creates a new object which has a CRF++ generated model file
		def initialize(model_path)
			@file = File.open(model_path,'r')
		end
	end
end