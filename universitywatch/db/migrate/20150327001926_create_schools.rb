class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
        t.string :name
        t.string :school_type
        t.string :state
        t.string :city
        t.integer :population
        t.string :acronym
        t.string :street
        t.string :zip
        t.timestamps null: false
    end
  end
end
