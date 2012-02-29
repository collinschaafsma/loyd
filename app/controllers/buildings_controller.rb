require './app/presenters/buildings/index'
require './app/presenters/buildings/show'
require './app/interfaces/building_interface'

class BuildingsController < ApplicationController
  def index
    @presenter = Presenters::Buildings::Index.new
  end

  def show
    @presenter = Presenters::Buildings::Show.new(params[:id])
  end

  def new
    @building = Interfaces::BuildingInterface.new.new_building
  end

  def edit
    @building = Interfaces::BuildingInterface.new.find(params[:id])
  end

  def create
    if Interfaces::BuildingInterface.new.build(params[:building])
      redirect_to @building, notice: 'Building was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if Interfaces::BuildingInterface.new.remodel(params[:id], params[:building])
      redirect_to @building, notice: 'Building was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    Interfaces::BuildingInterface.new.demolish(params[:id])
    redirect_to buildings_url
  end
end
