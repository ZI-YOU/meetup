class MeetupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  
  def index
  	@meetups = Meetup.all
  end

  def show
  	@meetup = Meetup.find(params[:id])
  end

  def new
  	@meetup = Meetup.new(params[:id])
  end

  def create
  	@meetup = Meetup.new(meetup_params)

  	if @meetup.save
  	  redirect_to root_path
  	else
  	  render :new
  	end
  end

  def edit
  	@meetup = Meetup.find(params[:id])
  end

  def update
  	@meetup = Meetup.find(params[:id])
  	if @meetup.update(meetup_params)
  	  redirect_to root_path
  	else
  	  render :edit
  	end
  end

  def destroy
  	@meetup = Meetup.find(params[:id])
  	@meetup.destroy
  	redirect_to root_path
  end

  private

  def meetup_params
  	params.require(:meetup).permit(:title, :description)
  end
end
