class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :tags, array: true, default: []
      t.integer :duration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
