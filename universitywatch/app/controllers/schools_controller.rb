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
    if school
      redirect_to school
    else
      flash[:errors] = "No results. Please try again."
      # @error = "No results. Please try again."
      redirect_to root_url
    end
  end

def json_search
  p params
  search_value = School.search_by_school_info(params[:school_name]).limit(10)
  render json: search_value
end

def state
  state = params[:state_name]
  @schools = School.where(state: state).paginate :page => params[:page]
  respond_to do |format|
    format.json {
      render :json => {
        :current_page => @schools.current_page,
        :per_page => @schools.per_page,
        :total_entries => @schools.total_entries,
        :entries => @schools
      }
    }
  end
end

  def type
    state = params[:state_name]
    school_type = params[:school_type]
    state_school_type = School.where(state: state, school_type: school_type)
    render :json => state_school_type
  end

  def states
  end

  def compare
    @schools = School.all
    render 'schools/comparison'
  end

  def compare_two
    @school_one = School.where(name: params[:first_school]).first.crimes
    @school_two = School.where(name: params[:second_school]).first.crimes

    render :json => {first_school: @school_one, second_school: @school_two}
  end

  private

  def current_pagination_params

  end

  def school_params
    params.require(:school).permit(:name)
  end

end
