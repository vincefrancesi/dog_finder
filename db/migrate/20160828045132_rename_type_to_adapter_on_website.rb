class RenameTypeToAdapterOnWebsite < ActiveRecord::Migration[5.0]
  def change
    rename_column :websites, :type, :adapter
  end
end
