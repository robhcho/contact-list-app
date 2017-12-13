class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  
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
      # updated_at: month_date_time
    }
  end

  # def month_date_time
  #   strftime ('%b %e, %l:%M %p')
  # end
end
