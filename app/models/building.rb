class Building < ActiveRecord::Base
  validates :name, :city, :state, :year_built, :presence => true
end
