class CreateWagonType < ActiveRecord::Migration[5.1]
  def change
    create_table :wagon_types do |t|
      t.string :wagon_type
    end
  end
end
