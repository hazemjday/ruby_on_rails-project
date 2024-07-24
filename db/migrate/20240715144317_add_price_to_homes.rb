class AddPriceToHomes < ActiveRecord::Migration[6.1]
  def change
    add_column :homes, :price, :string
  end
end
