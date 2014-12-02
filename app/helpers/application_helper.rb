module ApplicationHelper
  def errors
    return flash[:errors]
  end

  def prefix
    ["Oh snap! ", "Gee wizz! ", "Jeepers! ", "Holy moly! ", "Uh oh! ",
     "Gosh darnit! ", "Oh boy! ", "D'oh! ", "Blamo! ", "Oh my! ",
     "Oh dear! ", "Holy guacamole! ", "Shiver my timbers! ", 
     "Butter my butt and call me a biscuit! ", "Good grief! ", 
     "Well I never! ", "Oh my stars! ", "My word!, ", "Ay Caramba! "].sample
  end
end
