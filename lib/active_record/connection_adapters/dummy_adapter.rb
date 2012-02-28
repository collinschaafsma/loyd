class ActiveRecord::Base
  def self.dummy_connection(config)
    ActiveRecord::ConnectionAdapters::DummyAdapter.new(config)
  end
end

class ActiveRecord::ConnectionAdapters::DummyAdapter <
    ActiveRecord::ConnectionAdapters::AbstractAdapter

end

