require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it {should belong_to :bachelorette}
  end

  describe "methods" do
    it "can determine the average age of all contestants" do
      jenny = Bachelorette.create(name: "Jenny", season_number: 1)
      bill = Contestant.create(name: "Bill", age: 10, hometown: "Los Angeles", bachelorette_id: jenny.id)
      jomah = Contestant.create(name: "Jomah", age: 20, hometown: "Denver", bachelorette_id: jenny.id)
      merry = Contestant.create(name: "Bill", age: 30, hometown: "Deluth", bachelorette_id: jenny.id)

      expect(jenny.contestants.average_age).to eq(20)

      jill = Contestant.create(name: "Jill", age: 40, hometown: "Deluth", bachelorette_id: jenny.id)

      expect(jenny.contestants.average_age).to eq(25)

      jill = Contestant.create(name: "Jill", age: 40, hometown: "Deluth")

      expect(jenny.contestants.average_age).to eq(25)
    end 
  end
end
