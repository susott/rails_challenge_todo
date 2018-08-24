class CreateToDos < ActiveRecord::Migration[5.1]
  def change
    create_table :to_dos do |t|
      t.string :name
      t.text :description
      t.references :to_do_list, foreign_key: true

      t.timestamps
    end
  end
end
