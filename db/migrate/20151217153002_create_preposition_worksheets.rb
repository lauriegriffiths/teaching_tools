class CreatePrepositionWorksheets < ActiveRecord::Migration[4.2]
  def change
    create_table :preposition_worksheets do |t|
      t.string :title
      t.text :body
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
