class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.string :phone
      t.references :home, null: false, foreign_key: true

      t.timestamps
    end
  end
end
