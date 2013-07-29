class User < ActiveRecord::Base
  validates :password, :presence => true
  validates :name, :presence => true
  validates :email, :presence => true

  has_many :ballots

  include BCrypt

   def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    if new_password.length > 0
      @password = Password.create(new_password)
      self.password_hash = @password
    else
      @password = ''
    end
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password == password
      user
    else
      false
    end
  end 
end
