class SearchController < ApplicationController
	def index
		@umbrella = Umbrella.all


	end
end
