class AddDiscardToUploads < ActiveRecord::Migration[7.0]
  def change
    add_column :uploads, :discarded_at, :datetime
    add_index :uploads, :discarded_at
  end
end
