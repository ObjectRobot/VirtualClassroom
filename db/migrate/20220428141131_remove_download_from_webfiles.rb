class RemoveDownloadFromWebfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :webfiles, :download, :string
  end
end
