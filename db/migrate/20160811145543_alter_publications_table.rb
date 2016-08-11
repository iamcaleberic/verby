class AlterPublicationsTable < ActiveRecord::Migration
  def change
  	change_column :publications, :title,:text, :limit => 191
  	change_column :publications, :body , :text , :limit => 50000
  end
end
