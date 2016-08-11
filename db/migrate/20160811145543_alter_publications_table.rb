class AlterPublicationsTable < ActiveRecord::Migration
  def change
  	change_column :publications, :title,:text, :limit => 191
  end
end
