class AddSlugToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :slug, :string
    add_index :publications, :slug, :unique => true
  end
end
