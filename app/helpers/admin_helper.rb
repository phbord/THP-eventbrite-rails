module AdminHelper
    def check_if_admin?
      unless current_user.is_admin?
        flash.now[:alert] = "Attention, espace réservé uniquement aux administrateurs !"
        redirect_to root_path
      end
      flash.now[:success] = "Accord pour l'entrée dans espace réservé aux administrateurs !"
    end
end
