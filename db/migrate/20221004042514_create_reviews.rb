class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :client, null: false, foreign_key: true
      t.references :trader, null: false, foreign_key: true
      t.integer :score
      t.string :review_comment
      t.timestamps
    end
  end
end
