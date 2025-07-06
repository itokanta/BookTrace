class AddPublicToReadingRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :reading_records, :public, :boolean, default: false, null: false
  end
end
