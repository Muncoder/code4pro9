class ChangeColumnType < ActiveRecord::Migration
  def change
  	change_column :tasks, :header, :boolean
  end
end
