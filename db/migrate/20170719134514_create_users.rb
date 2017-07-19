class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :ticket_id

      t.timestamps
    end
  end
end
