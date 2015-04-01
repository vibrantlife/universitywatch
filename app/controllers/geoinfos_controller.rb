class GeoinfosController < ApplicationController
	def create
	  p params
	  school = School.find(params[:geoinfo][:id])
	  school.create_geoinfo(geoinfo_params)
	  render status: 200, json: school.to_json
	end

	def heatmap
		# render "geoinfos/heatmap"
	end

	private
	def geoinfo_params
		params.require(:geoinfo).permit(:lat, :lng, :id)
	end
end
