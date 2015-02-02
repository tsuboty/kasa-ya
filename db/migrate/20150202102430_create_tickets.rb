class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true
      t.references :umbrella, index: true
      t.float :gps_present_lat
      t.float :gps_present_lon

      t.timestamps
    end
  end
end
