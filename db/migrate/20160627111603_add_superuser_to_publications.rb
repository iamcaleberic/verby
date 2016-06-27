class AddSuperuserToPublications < ActiveRecord::Migration
  def change
    add_reference :publications, :superuser, index: true, foreign_key: true
  end
end
