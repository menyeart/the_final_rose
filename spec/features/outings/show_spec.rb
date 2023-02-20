require 'rails_helper'

RSpec.describe "the outing show page" do
  describe 'as a visitor' do
    describe 'when I visit a outings show page' do
      it "shows the outings attributes, a count of contestants on the outtings and a list of those contestants names" do
        stephanie = Bachelorette.create!(name: 'Stephanie', season_number: 32, description: 'Yay more bachelorette')
        matt = Contestant.create!(name: 'Matt', age: 30, hometown: 'Akron', bachelorette: stephanie)
        keith = Contestant.create!(name: 'Keith', age: 40, hometown: 'Colorado Springs', bachelorette: stephanie)
        coptor = Outing.create!(name: 'helicoptor ride', location: 'the sky', date: '01/02/2022')
        conout1 = ContestantOuting.create!(contestant: matt, outing: coptor)
        conout2 = ContestantOuting.create!(contestant: keith, outing: coptor)

        visit "/outings/#{coptor.id}"
      
        expect(page).to have_content('Matt')
        expect(page).to have_content('Keith')
        expect(page).to have_content('Count of Contestants: 2')
        expect(page).to have_content('helicoptor ride')
        expect(page).to have_content('Date: 2022-02-01')
        expect(page).to have_content('Location: the sky')
      end
    end
  end
end
