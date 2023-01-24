class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.boolean :is_active
      t.datetime :published_date

      t.timestamps
    end
  end
end
