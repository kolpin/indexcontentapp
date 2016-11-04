class CreateUrlContents < ActiveRecord::Migration
  def change
    create_table :url_contents do |t|
      t.text :url
      t.text :content
      t.text :headers
      t.text :links

      t.timestamps null: false
    end
  end
end
