class Ballot < ActiveRecord::Base
  belongs_to :user
  has_many   :votes
  has_many   :players, :through => :votes
end
