require "rails_helper"

RSpec.describe "Bachelorette Show Page", type: :feature do
  describe "As a visitor" do
    it "when I visit a bachelorette's show page I see their name, season number and description as well as a link to their contestants" do
      lauren = Bachelorette.create(name: "Lauren", season_number: 1)

      rachel = Contestant.create(name: "rachel", age: 35, hometown: "Los Angeles", bachelorette_id: lauren.id)
      merry = Contestant.create(name: "merry", age: 31, hometown: "Des Moines", bachelorette_id: lauren.id)
      sunita = Contestant.create(name: "sunita", age: 40, hometown: "Mumbai", bachelorette_id: lauren.id)

      visit "/bachelorettes/#{lauren.id}"

      expect(page).to have_content("Bachelorette: Lauren")
      expect(page).to have_content("Season: 1")
      expect(page).to have_link("Lauren's Suitors")

      click_link("Lauren's Suitors")
      save_and_open_page
      expect(current_path).to eq("/bachelorettes/#{lauren.id}/contestants")
      expect(page).to have_content("rachel")
      expect(page).to have_content("merry")
      expect(page).to have_content("sunita")
    end
  end
end
