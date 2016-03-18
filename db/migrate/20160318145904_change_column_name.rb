class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :photos, :avatar, :picture
  end
end
