require './app/presenters/application_presenter'
require './app/interfaces/building_interface'

module Presenters
  module Buildings
    class Show < Presenters::ApplicationPresenter

      attr_reader :building_interface

      def initialize(id, building_interface = Interfaces::BuildingInterface.new)
        @building_interface = building_interface
        @id = id
      end

      def building
        @building_interface.find(id)
      end

    end
  end
end

