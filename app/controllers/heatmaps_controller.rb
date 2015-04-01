class HeatmapsController < ApplicationController
  def create
  	response_data = Heatmap.create(geodatainfos: params[:weight_data])
    render status: 200, json: response_data
	end

	def show
		response_data = Heatmap.last.geodatainfos
		p response_data
		render status: 200, json: response_data
	end

	def heatmap
		render "geoinfos/heatmap"
	end
end
