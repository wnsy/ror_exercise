class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
         after_create { |admin| admin.send_reset_password_instructions }
         # checks if the record is created for the
         # first time and returns false if no
         # making ad admin to be created w/o a password_required
         # after_create sends an email to the registered email address w/ a link
         # to set password
end
