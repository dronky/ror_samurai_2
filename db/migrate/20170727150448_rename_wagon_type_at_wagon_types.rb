class RenameWagonTypeAtWagonTypes < ActiveRecord::Migration[5.1]
  def change
    rename_column :wagon_types, :wagon_type, :title
  end
end
