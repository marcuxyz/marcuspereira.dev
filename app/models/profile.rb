class Profile < ApplicationRecord
  validates :first_name, :last_name, presence: true

  belongs_to :user

  def fullname
    "#{first_name} #{last_name}"
  end
end
