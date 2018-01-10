class AddFieldsToProvider < ActiveRecord::Migration[5.1]
  def change
    add_column :providers, :home_type, :string
    add_column :providers, :description, :text
  end
end
