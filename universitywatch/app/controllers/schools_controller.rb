class SchoolsController < ApplicationController
  def index
     @schools = School.all
  end

  def show

  end

  def search_school
    school = School.where(school_params).first
    redirect_to school_crimes_path(school.id)
  end

  def state
    # params[:state_name]
  end

  private

  def school_params
    params.require(:school).permit(:name)
  end

end
