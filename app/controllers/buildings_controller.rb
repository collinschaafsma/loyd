class BuildingsController < ApplicationController
  before_filter :initialize_building_interface,
    :only => [:new, :create, :edit, :update, :destroy]

  def index
    @presenter = Presenters::Buildings::Index.new
  end

  def show
    @presenter = Presenters::Buildings::Show.new(params[:id])
  end

  def new
    @building = @building_interface.new_building
  end

  def edit
    @building = @building_interface.find(params[:id])
  end

  def create
    if @building_interface.build(params[:building])
      redirect_to @building, notice: 'Building was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @building_interface.remodel(params[:id], params[:building])
      redirect_to @building, notice: 'Building was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @building_interface.demolish(params[:id])
    redirect_to buildings_url
  end

private
  def initialize_building_interface
    @building_interface = Interfaces::BuildingInterface.new
  end
end
