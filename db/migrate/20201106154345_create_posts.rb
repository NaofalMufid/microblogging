class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :category_id
      t.integer :tag_id
      t.string :title
      t.text :content
      t.text :thumbnail
      t.integer :author_id

      t.timestamps
    end
  end
end
