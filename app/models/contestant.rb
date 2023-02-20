class Contestant < ApplicationRecord
  belongs_to :bachelorette
  has_many :contestant_outings
  has_many :outings, through: :contestant_outings 

  def self.count_contestants
    self.count(:id)
  end

  def self.average_age
    self.average(:age)
  end

  def self.find_uniq_hometowns
    self.pluck(:hometown).uniq
  end
end
