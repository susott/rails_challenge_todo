class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.references :campaign, foreign_key: true
      t.references :to_do, foreign_key: true

      t.timestamps
    end
  end
end
