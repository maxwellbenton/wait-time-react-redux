class CreateWaitTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :wait_times do |t|
      t.references :user, foreign_key: true
      t.references :store, foreign_key: true
      t.integer :wait_time

      t.timestamps
    end
  end
end
