class SchoolsController < ApplicationController
  def index
     @school = School.all
  end

  def show

  end

  def search_school
    # params[:school_acronym]

    school = School.where(acronym: params[:school_acronym]).first
    p school
    redirect_to school_crimes_path(school.id)
  end

  def state
    # params[:state_name]

  end

  def states
  end

end
