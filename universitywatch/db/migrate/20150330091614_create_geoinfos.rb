class CreateGeoinfos < ActiveRecord::Migration
  def change
    create_table :geoinfos do |t|
      t.float :lat
      t.float :lng
      
      t.integer :school_id
      t.timestamps null: false
    end
  end
end
