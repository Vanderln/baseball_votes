class Votes < ActiveRecord::Base
  belongs_to :ballots
  belongs_to :players
end
