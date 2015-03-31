class SchoolsController < ApplicationController
  def index
     @schools = School.all
     @forcible_sex2011 = []
     @crimes = Crime.where(year: 2011)
     @crimes.each { |crime| @forcible_sex2011 << crime.f_sex}
     @murder2011 = []
     @crimes.each { |crime| @murder2011 << crime.murder}
     @manslaughter2011 = []
     @crimes.each { |crime| @manslaughter2011 << crime.manslaughter}
     @nonforcible_sex2011 = []
     @crimes.each { |crime| @nonforcible_sex2011 << crime.nf_sex}
  end

  def show
    @school = School.find(params[:id])
    @crimes = @school.crimes
    @crime_2011 = @crimes.where(year: 2011)[0]
    @crime_2012 = @crimes.where(year: 2012)[0]
    @crime_2013 = @crimes.where(year: 2013)[0]
  end

  def search_school
    school = School.where(school_params)[0]
    redirect_to school
  end

  def json_search
    p params
    search_value = School.search_by_school_info(params[:school_name]).limit(10)
    render json: search_value
  end

  def state
    state = params[:state_name]
    @schools = School.where(state: state)
    render :json => @schools
  end

  # route: schools/state/:statename/:school_type
  # schools/state/CA/private
  def type
    state = params[:state_name]
    school_type = params[:school_type]
    state_school_type = School.where(state: state, school_type: school_type)
    render :json => state_school_type
  end
  # select school type
  # a = []
  # School.all.each {|school| a << school.school_type}
  # a.uniq

  def states
  end

  




  def geo_location
    @schools = School.all
    render 'schools/get_geo_info'
  end


  def geo_info
    @schools = School.all
    @school_array = []
    @schools.each do |school|
      string = "#{school.street} #{school.city} #{school.state}"
      @school_array.push(string)
    end
    p @school_array[0]
    render json: {school_address_array: @school_array}
  end

  def heatmap_page
    render 'geoinfos/get_heatmap_data'
  end

  def heatmap_data
    schools = School.first(100)
    @school_data_weight_array = []
    schools.each do |school|
      if school.geoinfo.lat
        new_data = [school.geoinfo.lat, school.geoinfo.lng, school.forced_2013_sexual_assault]
        @school_data_weight_array.push(new_data)
      end
    end
    render json: {school_data_weight_array: @school_data_weight_array}
  end
  
  private

  def school_params
    params.require(:school).permit(:name)
  end

end
