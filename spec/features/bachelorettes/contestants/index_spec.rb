require 'rails_helper'

RSpec.describe "the bachelorette's contestants index page" do 
  describe 'as a visitor' do
    describe "when I visit a bachelorette's constestants index page ('/bachelorettes/:bachelorette_id/contestants')" do
      it "shows each contestants attributes" do
        stephanie = Bachelorette.create!(name: 'Stephanie', season_number: 32, description: 'Yay more bachelorette')
        mary = Bachelorette.create!(name: 'Mary', season_number: 2, description: 'Yay even more bachelorette')
        matt = Contestant.create!(name: 'Matt', age: 30, hometown: 'Akron', bachelorette: stephanie)
        ace = Contestant.create!(name: 'Ace', age: 22, hometown: 'Hollywood', bachelorette: stephanie)
        fred = Contestant.create!(name: 'Fred', age: 21, hometown: 'Denver', bachelorette: mary)

        visit "bachelorettes/#{stephanie.id}"
        click_link("Stephanie's contestants")
        
        expect(current_path).to eq("/bachelorettes/#{stephanie.id}/contestants")
        expect(page).to have_content("Name: Matt, Age: 30, Hometown: Akron")
        expect(page).to have_content("Name: Ace, Age: 22, Hometown: Hollywood")
      end

      it "has a link to go to each contestant's show page" do
        stephanie = Bachelorette.create!(name: 'Stephanie', season_number: 32, description: 'Yay more bachelorette')
        mary = Bachelorette.create!(name: 'Mary', season_number: 2, description: 'Yay even more bachelorette')
        matt = Contestant.create!(name: 'Matt', age: 30, hometown: 'Akron', bachelorette: stephanie)
        ace = Contestant.create!(name: 'Ace', age: 22, hometown: 'Hollywood', bachelorette: stephanie)
        fred = Contestant.create!(name: 'Fred', age: 21, hometown: 'Denver', bachelorette: mary)

        visit "bachelorettes/#{stephanie.id}/contestants"

        expect(page).to have_link("Matt")
        expect(page).to have_link("Ace")
    
        click_link("Matt")
        
        expect(current_path).to eq("/contestants/#{matt.id}")
      end

      it "shows a unique list of all the hometowns the contestants are from" do
        stephanie = Bachelorette.create!(name: 'Stephanie', season_number: 32, description: 'Yay more bachelorette')
        mary = Bachelorette.create!(name: 'Mary', season_number: 2, description: 'Yay even more bachelorette')
        matt = Contestant.create!(name: 'Matt', age: 30, hometown: 'Akron', bachelorette: stephanie)
        ace = Contestant.create!(name: 'Ace', age: 22, hometown: 'Hollywood', bachelorette: stephanie)
        fred = Contestant.create!(name: 'Fred', age: 21, hometown: 'Denver', bachelorette: mary)

        visit "bachelorettes/#{stephanie.id}/contestants"
      
        expect(page).to have_content("Akron")
        expect(page).to have_content("Akron")
      end
    end
  end
end