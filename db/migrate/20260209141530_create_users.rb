class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :cedula

      t.timestamps
    end
  end
end
