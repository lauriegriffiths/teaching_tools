class CreateTypes < ActiveRecord::Migration[4.2]
  def change
    create_table :types do |t|
      t.string :pos

      t.timestamps null: false
    end
  end
end
