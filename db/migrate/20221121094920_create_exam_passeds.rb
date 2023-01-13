class CreateExamPasseds < ActiveRecord::Migration[7.0]
  def change
    create_table :exam_passeds do |t|
      t.string :name
      t.integer :number_of_question
      t.integer :score
      t.datetime :finish_at

      t.timestamps
    end
  end
end
