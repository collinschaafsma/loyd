require './spec/fast/spec_helper'
require './app/interfaces/application_interface'
require './app/interfaces/building_interface'
require './app/models/building'

describe Interfaces::BuildingInterface do
  subject { Interfaces::BuildingInterface.new(BuildingMock) }

  it "should default the target to the building model" do
    interface = Interfaces::BuildingInterface.new
    interface.receiver.name.should == "Building"
  end

  it "should accept any Class as a target" do
    MyClass = Class.new
    interface = Interfaces::BuildingInterface.new(MyClass)
    interface.receiver.name.should == "MyClass"
  end

  it "should have a #new_building method" do
    subject.respond_to?(:new_building).should == true
  end

  it "should have a #create_building method" do
    subject.respond_to?(:create_building).should == true
  end

  it "should have a #update_building method" do
    subject.respond_to?(:update_building).should == true
  end

  it "should have a #destroy_building method" do
    subject.respond_to?(:destroy_building).should == true
  end

  it "should have a #find_building method" do
    subject.respond_to?(:find_building).should == true
  end

  it "should have a #fetch_all_buildings method" do
    subject.respond_to?(:fetch_all_buildings).should == true
  end

  it "should have a #featured_building method" do
    subject.respond_to?(:featured_building).should == true
  end

  describe "#create_building" do
    it "should raise an ArgumentError error if no options are passed" do
      expect { subject.create_building }.to raise_error(ArgumentError)
    end

    # it "should call #save on the target" do
    #   subject.receiver.should_receive(:save)
    #   subject.create_building({})
    # end
  end

  describe "#update_building" do
    it "should raise an ArgumentError error if no id is passed" do
      expect { subject.update_building }.to raise_error(ArgumentError)
    end

    it "should call #update_attributes on the target" do
      subject.receiver.should_receive(:update_attributes)
      subject.update_building(1,{})
    end
  end

  describe "#destroy_building" do
    it "should raise an ArgumentError error if no id is passed" do
      expect { subject.destroy_building }.to raise_error(ArgumentError)
    end

    it "should call #destroy on the target" do
      subject.receiver.should_receive(:destroy)
      subject.destroy_building(1)
    end
  end

  describe "#find_building" do
    it "should raise an ArgumentError error if no id is passed" do
      expect { subject.find_building }.to raise_error(ArgumentError)
    end

    it "should call #find on the target" do
      subject.receiver.should_receive(:find)
      subject.find_building(1)
    end
  end

  describe "#fetch_all_buildings" do
    it "should call #all on the target" do
      subject.receiver.should_receive(:all)
      subject.fetch_all_buildings
    end
  end

  describe "#new_building" do
    it "should return a instance of the target" do
      subject.new_building.instance_of?(BuildingMock).should == true
    end
  end

  describe "#featured_building" do
    it "should call #featured_building on the target" do
      subject.receiver.should_receive(:all)
      subject.featured_building
    end
  end
end
