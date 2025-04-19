class Task < ApplicationRecord
  # Associated with User model
  belongs_to :owner, class_name: "User"
  
  # Validations
  validates :title, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 255 }, allow_blank: true
  validates :status, inclusion: { in: STATUSES.keys }, allow_blank: true
  validates :due_date, allow_blank: true

  # Status
  STATUSES = {
    "ToDo" => "ToDo",
    "Doing" => "Doing",
    "Done" => "Done"
  }.freeze

  enum status: STATUSES, _prefix: :status
end
