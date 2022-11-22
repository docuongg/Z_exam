class CreateExamPasseds < ActiveRecord::Migration[7.0]
  def change
    create_table :exam_passeds do |t|
      t.string :name
      t.integer :numberOfQuestion
      t.integer :score
      t.datetime :finishAt

      t.timestamps
    end
  end
end
