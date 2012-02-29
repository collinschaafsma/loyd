require './app/presenters/application_presenter'
require './app/interfaces/building_interface'

module Presenters
  module Buildings
    class Index < Presenters::ApplicationPresenter

      attr_reader :building_interface

      def initialize(building_interface = Interfaces::BuildingInterface.new)
        @building_interface = building_interface
      end

      def buildings
        @building_interface.all
      end

      def building_location(building)
        "#{building.city}, #{building.state}"
      end

    end
  end
end
