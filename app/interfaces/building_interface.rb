module Interfaces
  class BuildingInterface

    attr_reader :receiver

    def initialize(receiver = Building)
      @receiver = receiver
    end

    def build!(options)
      @receiver.create!(options)
    end

    def build(options)
      @receiver.create(options)
    end

    def remodel(id, options = {})
      building = find(id)
      building.update_attributes(options)
    end

    def demolish(id)
      building = find(id)
      building.destroy
    end

    def find(id)
      @receiver.find(id)
    end

    def all
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

