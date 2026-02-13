class AddCedulaAndNombreToVotos < ActiveRecord::Migration[7.1]
  def change
    add_column :votos, :nombre, :string
    add_column :votos, :cedula, :string
  end
end
