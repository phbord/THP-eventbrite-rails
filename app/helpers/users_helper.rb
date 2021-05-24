module UsersHelper
    def authenticate_user
        unless current_user
            flash[:danger] = "Veuillez vous connecter !"
            redirect_to new_user_session_path
        end
    end

    def organizer_find(e)
        User.find(e.organizer_id)
    end

    def is_validated_checked(u)
        :checked if u.validated
    end
end
