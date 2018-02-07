class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
