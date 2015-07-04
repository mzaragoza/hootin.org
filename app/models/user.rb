class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name
    (first_name + ' ' + last_name).titleize
  end

  def update_available_status
    puts self.available
    if self.available == false
      self.available = true
    else
      self.available = false
    end
    self.save
  end
end
