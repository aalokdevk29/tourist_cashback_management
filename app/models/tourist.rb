class Tourist < ApplicationRecord
  has_many :purchases, dependent: :destroy

  devise :database_authenticatable, :registerable, :trackable, :validatable

  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false, format: { with: URI::MailTo::EMAIL_REGEXP
 }

  def generate_jwt
    JWT.encode({ id: id,
              exp: 60.days.from_now.to_i },
             Rails.application.secrets.secret_key_base)
  end

end
