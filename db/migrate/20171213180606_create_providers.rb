class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :county
      t.integer :bed_count
      t.integer :occupied_beds
      t.boolean :medicare
      t.boolean :medicade
      t.string :holding_company
      t.integer :overall_rating
      t.integer :health_inspection_rating

      t.timestamps
    end
  end
end
