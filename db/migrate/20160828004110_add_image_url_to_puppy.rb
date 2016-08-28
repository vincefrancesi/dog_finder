class AddImageUrlToPuppy < ActiveRecord::Migration[5.0]
  def change
    add_column :puppies, :image_url, :string
  end
end
