class CreateSchoolGeos < ActiveRecord::Migration
  def change
    create_table :school_geos do |t|
      t.float :lat
      t.float :lng
      t.float :data_weight
      t.integer :school_id

      t.timestamps null: false
    end
  end
end
