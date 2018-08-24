class CreateToDoLists < ActiveRecord::Migration[5.1]
  def change
    create_table :to_do_lists do |t|
      t.string :listname
      t.references :campaign, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
