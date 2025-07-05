class CreateReadingRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :reading_records do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :author, null: false
      t.date :finished_on, null: false

      t.timestamps
    end
    
    # 同一ユーザー＋同一書籍の重複登録を禁止するユニークインデックス
    add_index :reading_records, [:user_id, :title, :author], unique: true
  end
end
