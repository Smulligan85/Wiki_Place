class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.text :body
      t.boolean :private, default: false
      t.references :user, index: true
      t.references :collaborator, index: true

      t.timestamps null: false
    end
    add_foreign_key :wikis, :users
    add_foreign_key :wikis, :collaborators
  end
end
