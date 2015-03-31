class HeatmapsController < ApplicationController
  def create
  	response_data = Heatmap.create(geodatainfos: params[:weightdatainfo])
  	p response_data
    render status: 200, json: response_data
	end

	private

	# def dataweight_params
	# 	params.require(:weightdatainfo).permit(:geodatainfos)
	# end

end
