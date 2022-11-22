class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.float :rate
      t.string :comment

      t.timestamps
    end
  end
end
