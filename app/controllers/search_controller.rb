include Math
class SearchController < ApplicationController
	def index
		@umbrella = Umbrella.all.to_json

		#川崎市立西中原中学校(現在地と仮定)
		@p_lat = 35.578762
		@p_lon = 139.643466

		#新丸子
		@p_lat = 35.580626
		@p_lon = 139.661919 
		
		index = calc_min_distance(@p_lat,@p_lon)
		#render json: index
		goal = Umbrella.find(index)
		@g_lat = goal.gps_lat
		@g_lon = goal.gps_lon


		@umbrella_img = ActionController::Base.helpers.asset_path('umbrella_60.png')
		@current_img = ActionController::Base.helpers.asset_path('current_marker.png')
	end

	def calc_min_distance(p_lat,p_lon)
		umbrella_gps = Umbrella.pluck(:id,:gps_lat,:gps_lon)
		min_d = 0
		index = 0
		umbrella_gps.each do |u|
			dx = p_lat - u[1]
			dy = p_lon - u[2]

			d = sqrt(dx * dx + dy * dy)
			
			if min_d == 0 
				min_d = d
			else
				if d < min_d
					min_d = d
					index = u[0]
					
				end
			end	
		end
		return index
	end

	def distance(p)
	    dx = @x - p.x
	    dy = @y - p.y
	    sqrt(dx * dx + dy * dy)
  	end




end
