class CreateWagons < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.integer :traind_id
      t.integer :wagon_type
      t.integer :up_seats
      t.integer :down_seats

      t.timestamps
    end
  end
end
