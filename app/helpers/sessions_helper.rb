module SessionsHelper 
 def admin?
 	if current_user.nil?
 		false
 	else
 		current_user.is_role_by_name?("admin")
 	end
 end

 def customer?
 	if current_user.nil?
 		false
 	else
 		current_user.is_role_by_name?("customer")
 	end
 end

 def owner?
 	if current_user.nil?
 		false
 	else
 		current_user.is_role_by_name?("owner")
 	end
 end
 
end