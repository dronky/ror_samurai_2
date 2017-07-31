class AddNullValidation < ActiveRecord::Migration[5.1]
  def change
    change_column_null :wagons, :wagon_type_id, false
  end
end
