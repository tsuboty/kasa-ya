include Math

class SearchController < ApplicationController
	def index
		@umbrella = Umbrella.all.to_json

		#中原近くのコンビニ
		@p_lat = 35.581101
		@p_lon = 139.646444

		if lat = params[:lat]
			@p_lat = lat
		end
		if lon = params[:lon]
			@p_lon = lon
		end

		index = calc_min_distance(@p_lat,@p_lon)

		goal = Umbrella.find(index)
		@g_lat = goal.gps_lat
		@g_lon = goal.gps_lon

		@umbrella_img = ActionController::Base.helpers.asset_path('umbrella_60.png')
		@umbrella_close_img = ActionController::Base.helpers.asset_path('umbrella_close.png')
		@current_img = ActionController::Base.helpers.asset_path('current_marker.png')
	end

	def calc_min_distance(p_lat,p_lon)
		umbrella_gps = Umbrella.pluck(:id,:gps_lat,:gps_lon)
		min_d = 0
		index = 0
		umbrella_gps.each do |u|
			dx = p_lat.to_f - u[1].to_f
			dy = p_lon.to_f - u[2].to_f
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

	def json
  		@lat = params[:lat]
  		@lon = params[:lon]
  		index = calc_min_distance(@lat,@lon) 		
  		goal = Umbrella.find(index)
  		@g_lat = goal.gps_lat
		@g_lon = goal.gps_lon

  	end

  	def geo
  		distance = params[:distance]
  		duration = params[:duration]
  		info ={}
  		info["distance"] = distance
  		info["duration"] = duration

  		render json: info
  	end


    def polling
    	lat = params[:lat]
    	lon = params[:lon]

    	index = calc_min_distance(lat,lon)
    	umbrella = Umbrella.find(index)
    	
    	Geocoder.configure(:language  => :ja,	:units => :km )

    	#t1 = Geocoder.search("東京タワー")[0].geometry['location'].values.join(',')
		#t2 = Geocoder.search("東京スカイツリー")[0].geometry['location'].values.join(',')

		t1 = lat.to_s + "," + lon.to_s
		t2 = umbrella.gps_lat.to_s + "," + umbrella.gps_lon.to_s
    	d = Geocoder::Calculations.distance_between(t1,t2) #km

    	render json: d
    end

=begin
	def distance(p)
	    dx = @x - p.x
	    dy = @y - p.y
	    sqrt(dx * dx + dy * dy)
  	end
=end




end
