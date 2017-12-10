class Contact < ApplicationRecord
  def as_json
    {
      name: name,
      middle_name: middle_name,
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
