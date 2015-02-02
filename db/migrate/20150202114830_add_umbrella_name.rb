class AddUmbrellaName < ActiveRecord::Migration
  def change
  
  	change_table :umbrellas do |t|

  		t.string :name
  	end


  end
end
