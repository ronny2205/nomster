class AddAverageToPlaces < ActiveRecord::Migration
  def change
  	add_column :places, :average_rate, :float, :default => 0
  end
end
