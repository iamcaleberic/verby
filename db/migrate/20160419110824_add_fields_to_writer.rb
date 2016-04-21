class AddFieldsToWriter < ActiveRecord::Migration
  def change
    add_column :writers, :name, :string
    add_column :writers, :penname, :string
    add_column :writers, :phone, :integer
    add_column :writers, :date_of_birth, :datetime
    add_column :writers, :experience, :string
    add_column :writers, :is_female, :boolean
  end
end
