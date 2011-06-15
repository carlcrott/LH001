class AddMovementToCommands < ActiveRecord::Migration
  def self.up
    add_column :commands, :movement, :string
  end

  def self.down
    remove_column :commands, :movement
  end
end
