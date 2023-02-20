require 'rails_helper'

RSpec.describe 'the bachelorette show page' do
  describe 'as a visitor' do
    describe "when I visit the bachelorette show page(/bachelorettes/:id')" do
      it 'displays a bachelorettes attributes' do
        stephanie = Bachelorette.create!(name: 'Stephanie', season_number: 32, description: 'Yay more bachelorette')

        visit "bachelorettes/#{stephanie.id}"
   
        expect(page).to have_content('Stephanie')  
        expect(page).to have_content('Season 32 - Yay more bachelorette')
      end

      it 'links to a page showing only that bachelorettes contestants' do
        stephanie = Bachelorette.create!(name: 'Stephanie', season_number: 32, description: 'Yay more bachelorette')
        mary = Bachelorette.create!(name: 'Mary', season_number: 2, description: 'Yay even more bachelorette')
        matt = Contestant.create!(name: 'Matt', age: 30, hometown: 'Akron', bachelorette: stephanie)
        ace = Contestant.create!(name: 'Ace', age: 22, hometown: 'Hollywood', bachelorette: stephanie)
        fred = Contestant.create!(name: 'Fred', age: 21, hometown: 'Denver', bachelorette: mary)

        visit "bachelorettes/#{stephanie.id}"
        click_link("Stephanie's contestants")
  
        expect(current_path).to eq("/bachelorettes/#{stephanie.id}/contestants")
        expect(page).to have_content('Matt')  
        expect(page).to have_content('Ace')
        expect(page).to_not have_content('Fred')
      end

      it "shows the average age of all that bachelorette's contestants" do
        stephanie = Bachelorette.create!(name: 'Stephanie', season_number: 32, description: 'Yay more bachelorette')
        mary = Bachelorette.create!(name: 'Mary', season_number: 2, description: 'Yay even more bachelorette')
        matt = Contestant.create!(name: 'Matt', age: 30, hometown: 'Akron', bachelorette: stephanie)
        ace = Contestant.create!(name: 'Ace', age: 22, hometown: 'Hollywood', bachelorette: stephanie)
        fred = Contestant.create!(name: 'Fred', age: 21, hometown: 'Denver', bachelorette: mary)

        visit "bachelorettes/#{stephanie.id}"
    
        expect(page).to have_content('Average Age of Contestants: 26.0')  
      end
    end
  end
end