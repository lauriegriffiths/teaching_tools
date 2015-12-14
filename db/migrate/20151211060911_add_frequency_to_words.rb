class AddFrequencyToWords < ActiveRecord::Migration
  def change
    add_column :words, :frequency, :integer
  end
end
