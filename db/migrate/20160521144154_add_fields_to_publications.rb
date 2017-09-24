class AddFieldsToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :genre, :string
    add_column :publications, :tags, :string
  end
end
