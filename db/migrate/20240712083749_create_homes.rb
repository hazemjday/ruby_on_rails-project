class CreateHomes < ActiveRecord::Migration[6.1]
  def change
    create_table :homes do |t|
      t.string :image
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
