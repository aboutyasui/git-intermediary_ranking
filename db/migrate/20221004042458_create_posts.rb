class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :trader, null: false, foreign_key: true
      t.string :title, null: false,default: ""
      t.text :body
      t.timestamps
    end
  end
end
