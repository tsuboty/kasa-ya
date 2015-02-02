class CreateUmbrellas < ActiveRecord::Migration
  def change
    create_table :umbrellas do |t|
      t.float :gps_lat
      t.float :gps_lon
      t.boolean :status

      t.timestamps
    end
  end
end
