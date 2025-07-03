class CreateReadingRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :reading_records do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :author
      t.date :finished_on

      t.timestamps
    end
  end
end
