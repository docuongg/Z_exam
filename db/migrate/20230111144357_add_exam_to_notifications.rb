class AddExamToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_reference :notifications, :exam, null: false, foreign_key: true
  end
end
