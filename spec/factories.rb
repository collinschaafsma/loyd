class BuildingMock < InactiveRecord
  def initialize(options = {})
    defaults = {
      id:           1,
      name:         "Test",
      description:  "Desc",
      city:         "Boulder",
      state:        "CO",
      type:         "Skyscrapper",
      year_built:   2012,
    }
    stub(defaults.merge(options))
  end
end
