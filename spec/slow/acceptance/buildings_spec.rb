require './spec/slow/spec_helper'

feature "User can manage buildings" do
  background do
  end

  scenario "User can list buildings" do
    visit('/buildings')
    page.should have_content('Listing buildings')
  end
end
