class MoviesController < ApplicationController
  before_filter :admin_user

  def index
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
