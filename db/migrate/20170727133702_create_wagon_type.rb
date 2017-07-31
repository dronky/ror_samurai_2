class CreateWagonType < ActiveRecord::Migration[5.1]
  def change
    create_table :wagon_types do |t|
      # NOTE: здесь тоже стоит добавить ограничение `null: false`
      t.string :wagon_type
    end
  end
end
