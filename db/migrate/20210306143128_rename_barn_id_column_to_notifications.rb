class RenameBarnIdColumnToNotifications < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :barn_id, :bean_id
  end
end
