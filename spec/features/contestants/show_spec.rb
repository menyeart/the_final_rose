require 'rails_helper'

RSpec.describe "the contestant show page" do
  describe 'as a visitor' do
    describe 'when I visit a contestants show page' do
      it "show the contestants name, seeason and a list of outings" do
        stephanie = Bachelorette.create!(name: 'Stephanie', season_number: 32, description: 'Yay more bachelorette')
        matt = Contestant.create!(name: 'Matt', age: 30, hometown: 'Akron', bachelorette: stephanie)
        kickball = Outing.create!(name: 'kickball', location: 'the beach', date: '01/01/2022')
        coptor = Outing.create!(name: 'helicoptor ride', location: 'the sky', date: '01/02/2022')
        springs = Outing.create!(name: 'hot springs', location: 'party volcano', date: '01/03/2022')
        conout1 = ContestantOuting.create!(contestant: matt, outing: springs)
        conout2 = ContestantOuting.create!(contestant: matt, outing: coptor)
        conout3 = ContestantOuting.create!(contestant: matt, outing: kickball)

        visit "/contestants/#{matt.id}"
        save_and_open_page
        expect(page).to have_content('Matt')
        expect(page).to have_content("Season #{matt.bachelorette.season_number} - #{matt.bachelorette.description}")
        expect(page).to have_content('kickball')
        expect(page).to have_content('helicoptor ride')
        expect(page).to have_content('hot springs')
      end

      it "show each outing's name as a link to it's show page" do
        stephanie = Bachelorette.create!(name: 'Stephanie', season_number: 32, description: 'Yay more bachelorette')
        matt = Contestant.create!(name: 'Matt', age: 30, hometown: 'Akron', bachelorette: stephanie)
        kickball = Outing.create!(name: 'kickball', location: 'the beach', date: '01/01/2022')
        coptor = Outing.create!(name: 'helicoptor ride', location: 'the sky', date: '01/02/2022')
        springs = Outing.create!(name: 'hot springs', location: 'party volcano', date: '01/03/2022')
        conout1 = ContestantOuting.create!(contestant: matt, outing: springs)
        conout2 = ContestantOuting.create!(contestant: matt, outing: coptor)
        conout3 = ContestantOuting.create!(contestant: matt, outing: kickball)

        visit "/contestants/#{matt.id}"
       
        expect(page).to have_link('hot springs')
        expect(page).to have_link('kickball')
        expect(page).to have_link('helicoptor ride')

        click_link('hot springs')
        
        expect(current_path).to eq("/outings/#{springs.id}")

      end
    end
  end
end