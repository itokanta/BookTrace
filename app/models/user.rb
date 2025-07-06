class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reading_records, dependent: :destroy
  
  validates :email, presence: { message: "を入力してください" }, 
                    uniqueness: { message: "は既に使用されています" }, 
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "は有効なメールアドレスではありません" }
  validates :name, presence: { message: "を入力してください" }
end
