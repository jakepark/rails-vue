class Trip < ApplicationRecord
  has_many :assignees, class_name: "User", foreign_key: "user_id"
  belongs_to :owner, class_name: "User"
end
