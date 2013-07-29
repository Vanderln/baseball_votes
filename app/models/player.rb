class Player < ActiveRecord::Base
  has_many :votes
  has_many :ballots, :through => :votes
  
  def self.pick_rand
    num = self.all.count
    players = []
    8.times do  

      players << self.find_by_id(1 + rand(num))
    end
    players
  end
end
