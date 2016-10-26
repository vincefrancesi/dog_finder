class AddDescriptionToPuppies < ActiveRecord::Migration[5.0]
  def change
  	add_column :puppies, :description, :string
  end
end
