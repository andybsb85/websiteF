class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :phone
      t.string :website
      t.string :openning_hours

      t.timestamps
    end
  end
end
