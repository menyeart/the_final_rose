require "rails_helper"

RSpec.describe "Bachelorette Contestants Index Page", type: :feature do
  describe "As a visitor" do
    it "When I visit a bachelorette's contestants index, I see the names of that bachelorette's contestants along with the their age, hometown and link to their respective show pages" do
      lauren = Bachelorette.create(name: "Lauren", season_number: 1)

      rachel = Contestant.create(name: "rachel", age: 35, hometown: "Los Angeles", bachelorette_id: lauren.id)
      merry = Contestant.create(name: "merry", age: 31, hometown: "Des Moines", bachelorette_id: lauren.id)
      sunita = Contestant.create(name: "sunita", age: 40, hometown: "Mumbai", bachelorette_id: lauren.id)

      visit bachelorette_contestants_path(lauren.id)

      expect(page).to have_content(rachel.name)
      expect(page).to have_content(rachel.hometown)
      expect(page).to have_content(rachel.age)
      expect(page).to have_content(merry.name)
      expect(page).to have_content(merry.hometown)
      expect(page).to have_content(merry.age)
      expect(page).to have_content(sunita.name)
      expect(page).to have_content(sunita.hometown)
      expect(page).to have_content(sunita.age)

      click_link("rachel")

      expect(current_path).to eq("/contestants/#{rachel.id}")
    end
  end
end