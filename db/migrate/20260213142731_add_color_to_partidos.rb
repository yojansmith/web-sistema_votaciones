class AddColorToPartidos < ActiveRecord::Migration[7.1]
  def change
    add_column :partidos, :color, :string
  end
end
