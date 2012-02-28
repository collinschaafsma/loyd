class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.text :description
      t.string :city
      t.string :state
      t.string :type
      t.integer :year_built
      t.boolean :featured, :default => false

      t.timestamps
    end
  end
end
