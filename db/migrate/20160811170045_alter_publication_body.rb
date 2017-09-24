class AlterPublicationBody < ActiveRecord::Migration
  def change
  	change_column :publications, :body , :text , :limit => 50000
  end
end
