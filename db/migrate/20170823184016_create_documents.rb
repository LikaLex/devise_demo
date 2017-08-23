class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :description
      t.text :url
      t.string :vendor_id

      t.timestamps
    end
  end
end
