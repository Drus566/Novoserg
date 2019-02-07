class CreateJoinTableTagMircropost < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tags, :microposts do |t|
      t.index [:tag_id, :micropost_id]
      # t.index [:micropost_id, :tag_id]
    end
  end
end
