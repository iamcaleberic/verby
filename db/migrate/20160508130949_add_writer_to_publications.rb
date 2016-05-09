class AddWriterToPublications < ActiveRecord::Migration
  def change
    add_reference :publications, :writer, index: true, foreign_key: true
  end
end
