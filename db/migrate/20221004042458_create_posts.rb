class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :trader, null: false, foreign_key: true
      t.string :title, null: false,default: ""
      t.text :body,null: false,default: ""
      t.timestamps
    end
  end
end
