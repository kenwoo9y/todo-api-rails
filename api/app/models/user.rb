class User < ApplicationRecord
    # Associated with Task model
    has_many :tasks, foreign_key: :owner_id, dependent: :destroy

    # Validations
    validates :username, presence: true, uniqueness: true, length: { maximum: 30 }
    validates :email, presence: true, uniqueness: true, length: { maximum: 80 },
                      format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :first_name, length: { maximum: 40 }, allow_blank: true
    validates :last_name,  length: { maximum: 40 }, allow_blank: true
end
