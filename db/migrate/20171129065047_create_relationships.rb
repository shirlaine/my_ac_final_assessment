class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.references :leader, index: true
      t.references :followee, index: true
      t.timestamps
    end
  end
end
