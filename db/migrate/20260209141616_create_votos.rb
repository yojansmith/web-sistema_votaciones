class CreateVotos < ActiveRecord::Migration[7.1]
  def change
    create_table :votos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :candidato, null: false, foreign_key: true
      t.references :cargo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
