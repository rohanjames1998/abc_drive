class CreateShortenedUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :shortened_urls do |t|
      t.string :full_url, null: false
      t.string :unique_identifier, null: false
      t.references :upload, null: false, foreign_key: true

      t.timestamps
    end

    add_index :shortened_urls, :unique_identifier, unique: true
  end
end
