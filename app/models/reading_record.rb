class ReadingRecord < ApplicationRecord
  belongs_to :user
  
  # 必須項目のバリデーション
  validates :title, presence: true
  validates :author, presence: true
  validates :finished_on, presence: true
  
  # 読了日が未来日でないことのバリデーション
  validate :finished_on_cannot_be_in_the_future
  
  # 同一ユーザー＋同一書籍の重複登録を禁止
  validates :title, uniqueness: { scope: [:user_id, :author] }
  
  private
  
  def finished_on_cannot_be_in_the_future
    if finished_on.present? && finished_on > Date.current
      errors.add(:finished_on, "は未来の日付にできません")
    end
  end
end
