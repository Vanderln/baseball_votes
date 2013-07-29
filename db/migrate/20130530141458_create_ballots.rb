class CreateBallots < ActiveRecord::Migration
  def change
    create_table :ballots do |t|
      t.string :name
      t.string :first_base
      t.string :second_base
      t.string :third_base
      t.string :short_stop
      t.string :left_field
      t.string :right_field
      t.string :center_field
      t.string :starting_pitcher
      t.string :relief_pitcher
      t.string :catcher
      t.integer :user_id
      t.timestamps

    end
  end
end
