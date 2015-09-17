class RenameCompletedColumn < ActiveRecord::Migration
  def change
    rename_column(:tasks, :completion_level, :completed)
  end
end
