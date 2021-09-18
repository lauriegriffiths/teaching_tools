class AddFrequencyToWords < ActiveRecord::Migration[4.2]
  def change
    add_column :words, :frequency, :integer
  end
end
