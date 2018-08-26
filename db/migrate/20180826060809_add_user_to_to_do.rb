class AddUserToToDo < ActiveRecord::Migration[5.1]
  def change
    add_reference :to_dos, :user, foreign_key: true
  end
end
