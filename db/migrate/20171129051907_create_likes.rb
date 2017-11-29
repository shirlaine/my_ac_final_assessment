class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, index: true
      t.references :note, null: false, index: true
      t.timestamps
    end
  end
end
