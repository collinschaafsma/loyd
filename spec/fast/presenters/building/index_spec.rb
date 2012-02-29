require './spec/fast/spec_helper'
require './app/interfaces/building_interface'
require './app/presenters/application_presenter'
require './app/presenters/buildings/index'

describe Presenters::Buildings::Index do
  subject do
    interface = Interfaces::BuildingInterface.new(BuildingDummy)
    Presenters::Buildings::Index.new(interface)
  end

  describe "#buildings" do
    it "should return an array of buildings from the interface" do
      subject.buildings.instance_of?(Array).should == true
    end
  end

  describe "#building_location" do
    it "should return a building location based on city and state" do
      subject.building_location(BuildingDummy.new).should == "Boulder, CO"
    end
  end
end

