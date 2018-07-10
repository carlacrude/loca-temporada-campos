class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :description
      t.references :property_type, foreign_key: true
      t.references :region, foreign_key: true
      t.string :rent_purpose
      t.integer :area
      t.integer :room_quantity
      t.boolean :accessibility
      t.boolean :allow_pets
      t.boolean :allow_smokers
      t.integer :maximum_guests
      t.integer :minimum_rent
      t.integer :maximum_rent
      t.decimal :daily_rate

      t.timestamps
    end
  end
end
