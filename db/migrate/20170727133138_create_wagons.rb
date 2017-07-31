class CreateWagons < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.integer :traind_id
      # NOTE: стоит добавить для типа вагона `null: false`
      t.integer :wagon_type
      # NOTE: для количества мест стоит добавить значение по умолчанию `default: 0`
      t.integer :up_seats
      t.integer :down_seats

      t.timestamps
    end
  end
end
