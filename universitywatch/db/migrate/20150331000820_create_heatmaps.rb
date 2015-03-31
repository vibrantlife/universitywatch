class CreateHeatmaps < ActiveRecord::Migration
  def change
    create_table :heatmaps do |t|

    	t.text :geodatainfos
    	# t.string :geodatainfos
      t.timestamps null: false
    end
  end
end
