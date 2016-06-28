class AddIndexToWriters < ActiveRecord::Migration
  def change
    add_index :writers, :penname, unique: true
  end
end
