class AddTagToUserTags < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_tags, :tag, null: false, foreign_key: true
  end
end
