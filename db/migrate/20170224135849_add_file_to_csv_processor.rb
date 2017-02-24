class AddFileToCsvProcessor < ActiveRecord::Migration
  def up
    add_attachment :csv_processors, :file
  end

  def down
    remove_attachment :csv_processors, :file
  end
end
