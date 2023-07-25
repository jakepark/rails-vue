class AddStartedAtToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :started_at, :datetime
  end
end
