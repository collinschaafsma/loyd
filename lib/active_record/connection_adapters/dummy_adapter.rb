class ActiveRecord::Base
  def self.dummy_connection(config)
    ActiveRecord::ConnectionAdapters::DummyAdapter.new(config)
  end
end

class MockTable

end

class ActiveRecord::ConnectionAdapters::DummyAdapter <
    ActiveRecord::ConnectionAdapters::AbstractAdapter

    def tables
      []
    end

    # def initialize(config={})
    #   @tables = {}
    # end
end

