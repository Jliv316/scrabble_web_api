# As a guest user (no sign in required)
# When I visit "/"
# And I fill in a text box with "mindfulness"
# And I click "Submit"
# Then I should see a message that says "Examples for using 'mindfulness'"
# And I should see a list of sentences with examples of how to use the word
# And I should see only sentences for usage in North America
# And I should not see sentences for any other regions

require 'rails_helper'

feature "User can visit root page" do
  scenario "and view navbar contents" do
    visit "/"
    fill_in id="word", with: "hello"
    click_on "Search"
    
    expect(current_path).to eq("/search")
    
  end
end