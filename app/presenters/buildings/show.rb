module Presenters
  module Buildings
    class Show < Presenters::ApplicationPresenter

      attr_reader :building_interface
      attr_reader :building_id

      def initialize(building_id, building_interface = Interfaces::BuildingInterface.new)
        @building_interface = building_interface
        @building_id = building_id
      end

      def building
        @building ||= @building_interface.find(@building_id)
      end

      def building_location
        "#{building.city}, #{building.state}"
      end

    end
  end
end

