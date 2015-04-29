class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.references :users, index: true
      t.references :wikis, index: true

      t.timestamps null: false
    end
    add_foreign_key :collaborations, :users
    add_foreign_key :collaborations, :wikis
  end
end
