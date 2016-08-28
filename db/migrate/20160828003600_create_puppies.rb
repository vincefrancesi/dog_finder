class CreatePuppies < ActiveRecord::Migration[5.0]
  def change
    create_table :puppies do |t|
      t.string :name
      t.integer :website_id

      t.timestamps
    end
  end
end
