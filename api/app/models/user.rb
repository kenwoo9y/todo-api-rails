class User < ApplicationRecord
    has_many :tasks, foreign_key: :owner_id, dependent: :destroy
end
