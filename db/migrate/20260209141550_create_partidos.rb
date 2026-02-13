class CreatePartidos < ActiveRecord::Migration[7.1]
  def change
    create_table :partidos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
