require './spec/slow/spec_helper'

describe Building  do
  include Shoulda::Matchers::ActiveRecord
  include Shoulda::Matchers::ActiveModel

  subject { Building.new }

  describe "#validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :year_built }
  end
end

