class AddPartSizeToHomes < ActiveRecord::Migration[6.1]
  def change
    add_column :homes, :size, :string
  end
end
