class User < ApplicationRecord
  validates :full_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 5, maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 18, less_than_or_equal_to: 100 }

  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end
end
