class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.string :description
      t.integer :timeout
      t.string :thumbnail_url
      t.timestamps
    end
  end
end
