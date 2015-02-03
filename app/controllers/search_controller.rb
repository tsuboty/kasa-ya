class SearchController < ApplicationController
	def index
		@umbrella = Umbrella.all

		render json: @umbrella


	end
end
