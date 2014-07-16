class User < ActiveRecord::Base
# Add in user authentication with bCrypt

include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(params)
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      @user
    else
      nil
    end
  end
end
