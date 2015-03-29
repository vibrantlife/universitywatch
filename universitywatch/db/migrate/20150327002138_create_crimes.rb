class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
        t.integer    :murder
        t.integer    :manslaughter
        t.integer    :f_sex
        t.integer    :nf_sex
        t.integer    :robbery
        t.integer    :ag_assault
        t.integer    :burglary
        t.integer    :auto_theft
        t.integer    :arson
        t.references :school
        t.integer    :year
      t.timestamps null: false
    end
  end
end






