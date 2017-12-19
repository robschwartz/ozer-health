class AddProviderNumberToProvider < ActiveRecord::Migration[5.1]
  def change
    add_column :providers, :provider_number, :string
  end
end
