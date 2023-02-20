require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it {should belong_to :bachelorette}
    it {should have_many(:outings).through(:contestant_outings)}
    it {should have_many(:contestant_outings)}
  end

  describe 'class methods' do
    it 'can count the total number of contestants' do
      stephanie = Bachelorette.create!(name: 'Stephanie', season_number: 32, description: 'Yay more bachelorette')  
      matt = Contestant.create!(name: 'Matt', age: 30, hometown: 'Akron', bachelorette: stephanie)
      keith = Contestant.create!(name: 'Keith', age: 40, hometown: 'Colorado Springs', bachelorette: stephanie)

      expect(Contestant.count_contestants).to eq(2)

      amy = Contestant.create!(name: 'Amy', age: 20, hometown: 'Golden', bachelorette: stephanie)

      expect(Contestant.count_contestants).to eq(3)
    end

    it "can determine the contestant's average age" do
      stephanie = Bachelorette.create!(name: 'Stephanie', season_number: 32, description: 'Yay more bachelorette')  
      matt = Contestant.create!(name: 'Matt', age: 30, hometown: 'Akron', bachelorette: stephanie)
      keith = Contestant.create!(name: 'Keith', age: 40, hometown: 'Colorado Springs', bachelorette: stephanie)

      expect(Contestant.average_age).to eq(35.0)

      amy = Contestant.create!(name: 'Amy', age: 20, hometown: 'Golden', bachelorette: stephanie)

      expect(Contestant.average_age).to eq(30.0)
    end

    it "can create a unique list of contestants hometowns" do
      stephanie = Bachelorette.create!(name: 'Stephanie', season_number: 32, description: 'Yay more bachelorette')  
      matt = Contestant.create!(name: 'Matt', age: 30, hometown: 'Akron', bachelorette: stephanie)
      keith = Contestant.create!(name: 'Keith', age: 40, hometown: 'Colorado Springs', bachelorette: stephanie)

      expect(Contestant.find_uniq_hometowns).to eq(['Akron', 'Colorado Springs'])

      amy = Contestant.create!(name: 'Amy', age: 20, hometown: 'Golden', bachelorette: stephanie)

      expect(Contestant.find_uniq_hometowns).to eq(['Akron', 'Colorado Springs', 'Golden'])

      josh = Contestant.create!(name: 'Josh', age: 20, hometown: 'Golden', bachelorette: stephanie)

      expect(Contestant.find_uniq_hometowns).to eq(['Akron', 'Colorado Springs', 'Golden'])
    end
  end
end
