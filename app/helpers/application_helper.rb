module ApplicationHelper
  def errors_exist?
    return !flash[:errors].nil? && flash[:errors].size != 0
  end

  def errors
    errors_list = flash[:errors]
    flash[:errors] = nil
    return errors_list
  end

  def prefix
    ["Oh snap! ", "Gee wizz! ", "Jeepers! ", "Holy moly! ", "Uh oh! ",
     "Gosh darnit! ", "Oh boy! ", "D'oh! ", "Blamo! ", "Oh my! ",
     "Oh dear! ", "Holy guacamole! ", "Shiver my timbers! ", 
     "Butter my butt and call me a biscuit! ", "Good grief! ", 
     "Well I never! ", "Oh my stars! ", "My word!, ", "Ay Caramba! "].sample
  end
end
