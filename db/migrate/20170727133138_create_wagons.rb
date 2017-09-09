class CreateWagons < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.integer :traind_id
      t.integer :wagon_type
      t.integer :up_seats
      t.integer :down_seats
      t.integer :side_up_seats
      t.integer :side_down_seats
      t.integer :sit_seats
      t.string :type

      t.timestamps
    end
  end
end
