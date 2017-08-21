class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :search do |t|

      t.timestamps
    end
  end
end
