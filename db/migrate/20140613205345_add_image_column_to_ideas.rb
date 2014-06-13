class AddImageColumnToIdeas < ActiveRecord::Migration
  def self.up
    add_attachment :ideas, :image
  end

  def self.down
    remove_attachment :ideas, :image
  end
end
