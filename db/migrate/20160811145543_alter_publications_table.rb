class AlterPublicationsTable < ActiveRecord::Migration
  def change
  	change_column :publications, :body, :text, :limit => 191
  end
end
