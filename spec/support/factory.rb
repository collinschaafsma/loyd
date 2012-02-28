# Simple class to create simple objects.
# The dumbest / simplest factory you'll ever use
class Factory
  def build(options = {})
    options.each_pair { |key, value|
      instance_variable_set("@#{key}", value)
      self.class.send(:attr_accessor, key)
    }
  end

  def self.build_multi(object, count)
    objects = []
    count.times do |c|
      objects << object.stub({id: (c + 1)})
    end
    objects
  end
end

