class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :player
      t.references :ballot
      t.timestamps
    end
  end
end
