module Interfaces
  class BuildingInterface < ApplicationInterface

    attr_reader :receiver

    def initialize(receiver = Building)
      @receiver = receiver
    end

    def create_building(options)
      building = new_building(options)
      building.save
    end

    def update_building(id, options = {})
      building = find_building(id)
      building.update_attributes(options)
    end

    def destroy_building(id)
      building = find_building(id)
      building.destroy
    end

    def find_building(id)
      @receiver.find(id)
    end

    def fetch_all_buildings
      @receiver.all
    end

    def new_building(options = {})
      @receiver.new(options)
    end

    def featured_building
      @receiver.all(:conditions => {:featured => true}, :limit => 1)
    end

  end
end

