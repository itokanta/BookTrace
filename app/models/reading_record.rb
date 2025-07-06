class ReadingRecord < ApplicationRecord
  belongs_to :user
  
  # 必須項目のバリデーション
  validates :title, presence: { message: "を入力してください" }
  validates :author, presence: { message: "を入力してください" }
  validates :finished_on, presence: { message: "を入力してください" }
  
  # 読了日が未来日でないことのバリデーション
  validate :finished_on_cannot_be_in_the_future
  
  # 同一ユーザー＋同一書籍の重複登録を禁止
  validates :title, uniqueness: { 
    scope: [:user_id, :author], 
    message: "は既に登録されています" 
  }
  
  # 公開フラグのデフォルト値を設定
  attribute :public, :boolean, default: false
  
  # スコープ
  scope :public_records, -> { where(public: true) }
  scope :private_records, -> { where(public: false) }
  
  private
  
  def finished_on_cannot_be_in_the_future
    if finished_on.present? && finished_on > Date.current
      errors.add(:finished_on, "は未来の日付にできません")
    end
  end
end
