class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.string :pen_name
      t.string :body ,:limit => 10000
      t.string :email
      t.string :comments
      t.integer :likes
      t.integer :dislikes

      t.timestamps null: false
    end
  end
end
