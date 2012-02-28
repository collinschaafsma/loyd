require './spec/fast/spec_helper'
require './app/interfaces/application_interface'
require './app/interfaces/building_interface'
require './app/models/building'

describe Interfaces::BuildingInterface do
  subject { Interfaces::BuildingInterface.new(BuildingDummy) }

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

  it "should have a #build! method" do
    subject.respond_to?(:build!).should == true
  end

  it "should have a #build method" do
    subject.respond_to?(:build).should == true
  end

  it "should have a #remodel method" do
    subject.respond_to?(:remodel).should == true
  end

  it "should have a #demolish method" do
    subject.respond_to?(:demolish).should == true
  end

  it "should have a #find method" do
    subject.respond_to?(:find).should == true
  end

  it "should have a #all method" do
    subject.respond_to?(:all).should == true
  end

  it "should have a #featured_building method" do
    subject.respond_to?(:featured_building).should == true
  end

  describe "#build!" do
    it "should raise an ArgumentError error if no options are passed" do
      expect { subject.build! }.to raise_error(ArgumentError)
    end

    it "should call #create on the target" do
      subject.receiver.should_receive(:create)
      subject.build({})
    end
  end

  describe "#build" do
    it "should raise an ArgumentError error if no options are passed" do
      expect { subject.build }.to raise_error(ArgumentError)
    end
  end

  describe "#remodel" do
    it "should raise an ArgumentError error if no id is passed" do
      expect { subject.remodel }.to raise_error(ArgumentError)
    end

    it "should call #update_attributes on the target" do
      subject.receiver.should_receive(:update_attributes)
      subject.remodel(1,{})
    end
  end

  describe "#demolish" do
    it "should raise an ArgumentError error if no id is passed" do
      expect { subject.demolish }.to raise_error(ArgumentError)
    end

    it "should call #destroy on the target" do
      subject.receiver.should_receive(:destroy)
      subject.demolish(1)
    end
  end

  describe "#find" do
    it "should raise an ArgumentError error if no id is passed" do
      expect { subject.find }.to raise_error(ArgumentError)
    end

    it "should call #find on the target" do
      subject.receiver.should_receive(:find)
      subject.find(1)
    end
  end

  describe "#all" do
    it "should call #all on the target" do
      subject.receiver.should_receive(:all)
      subject.all
    end
  end

  describe "#new_building" do
    it "should return a instance of the target" do
      subject.new_building.instance_of?(BuildingDummy).should == true
    end
  end

  describe "#featured_building" do
    it "should call #featured_building on the target" do
      subject.receiver.should_receive(:all)
      subject.featured_building
    end
  end
end
