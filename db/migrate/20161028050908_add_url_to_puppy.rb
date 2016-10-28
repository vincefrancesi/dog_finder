class AddUrlToPuppy < ActiveRecord::Migration[5.0]
  def change
    add_column :puppies, :url, :string
  end
end
