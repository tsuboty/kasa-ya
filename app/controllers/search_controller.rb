class SearchController < ApplicationController
	def index
		@umbrella = Umbrella.all.to_json

		#武蔵中原
		@p_lat = 35.581154
		@p_lon = 139.641474
		 
		#render json: @umbrella
		@img = ActionController::Base.helpers.asset_path('umbrella_60.png')
	end
end
