class CreateNumberChases < ActiveRecord::Migration
  def change
    create_table :number_chases do |t|
      t.string :title
      t.integer :maximum
      t.integer :player_count
      t.integer :turns_per_player

      t.timestamps null: false
    end
  end
end
