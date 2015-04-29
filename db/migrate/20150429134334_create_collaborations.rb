class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :wiki, index: true

      t.timestamps null: false
    end
    add_foreign_key :collaborations, :users
    add_foreign_key :collaborations, :wikis
  end
end
