class CreateWords < ActiveRecord::Migration[4.2]
  def change
    create_table :words do |t|
      t.string :headword
      t.text :definition
      t.references :type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
