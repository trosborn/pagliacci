class User < ActiveRecord::Base
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def active_order
    orders.last
  end

  def customer?
    if admin == false
      true
    end
  end
end
class NullUser
  def admin?
    nil
  end
end


