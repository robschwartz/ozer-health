class AddMedicaidToProvider < ActiveRecord::Migration[5.1]
  def change
    add_column :providers, :medicaid, :boolean
    remove_column :providers, :medicade
  end
end
