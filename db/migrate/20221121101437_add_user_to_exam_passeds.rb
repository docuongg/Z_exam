class AddUserToExamPasseds < ActiveRecord::Migration[7.0]
  def change
    add_reference :exam_passeds, :user, null: false, foreign_key: true
  end
end
