require 'active_record'

# No need for a database, or a connection.  Keep shit fast!
ActiveRecord::Base.establish_connection(:adapter => :dummy)

class InactiveRecord < ActiveRecord::Base
  def stub(options = {})
    options.each_pair { |key, value|
      instance_variable_set("@#{key}", value)
      self.class.send(:attr_accessor, key)
    }
  end

  def self.stub_multi(object, count)
    objects = []
    count.times do |c|
      objects << object.stub({id: (c + 1)})
    end
    objects
  end

  def self.find(*args)
    self
  end

  def self.all(*args)
    []
  end

  def self.columns
    @columns ||= [];
  end

  def save(*args)
    true
  end
end

