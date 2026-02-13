class CreateCandidatos < ActiveRecord::Migration[7.1]
  def change
    create_table :candidatos do |t|
      t.string :nombre
      t.text :propuesta
      t.references :cargo, null: false, foreign_key: true
      t.references :partido, null: false, foreign_key: true

      t.timestamps
    end
  end
end
