class AddHeadToTrain < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :head, :boolean
  end
end
