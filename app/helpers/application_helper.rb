module ApplicationHelper

  def flip_availability(user)
    if user.available == true
      user.available = false
    else
      user.available == false
      user.available = true
    end
    user.save
  end
end
