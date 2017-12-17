class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  belongs_to :user
  
  def as_json
    {
      id: id,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      email: email,
      phone_number: phone_number,
      bio: bio,
      created_at: created_at.strftime('%b %e, %l:%M %p')
    }
  end

  # def current_user
  #   if current_user
  #     contacts = current_user.contacts

  # end
end
