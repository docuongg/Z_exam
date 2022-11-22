class AddExamToVotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :votes, :exam, null: false, foreign_key: true
  end
end
