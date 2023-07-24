class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.datetime :ETA
      t.datetime :ETC
      t.string :status_id
      t.string :action_id

      t.timestamps
    end
  end
end
