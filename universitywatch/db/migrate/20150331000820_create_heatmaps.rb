class CreateHeatmaps < ActiveRecord::Migration
  def change
    create_table :heatmaps do |t|

    	t.text :geodatainfos, array: true, default: []
      t.timestamps null: false
    end
  end
end
