module UserHelper
  def get_user_name(current_user)
    current_user ? "#{current_user.first_name} #{current_user.last_name}" : "Guest"
  end

  def get_user_email(current_user)
    current_user ? "#{current_user.email}" : "kvirani@gmail.com"
  end
end