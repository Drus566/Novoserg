class CreateNewsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :news_items do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :news_items, [:user_id, :created_at]
  end
end
