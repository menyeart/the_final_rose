class Contestant <ApplicationRecord
  belongs_to :bachelorette

  def self.average_age
    Contestant
    .average(:age)
  end
end