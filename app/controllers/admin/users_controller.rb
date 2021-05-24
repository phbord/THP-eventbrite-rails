class Admin::UsersController < ApplicationController
  before_action :check_if_admin?

  def index
    @user = User.find(current_user.id)
    @users = users_all
  end

  def new
  end

  def create
  end

  def show
    @user = user_find
  end

  def edit
    @user = user_find
    @users = users_all
    @events = events_all
  end

  def update
    #Récupération des champs du formulaire
    user = user_find
    user_params = { is_admin: params[:is_admin] }

    #Sauvegarde en BDD
    if user.update(user_params)
      redirect_to admin_users_path, success: "Enregistrement réussi !"
    else
      flash.now[:alert] = "Echec à l'enregistrement !"
      render :edit
    end
  end

  def destroy
    #Récupération des champs du formulaire
    user = user_find

    #Sauvegarde en BDD
    if user.destroy
      redirect_to admin_users_path, success: "Suppression du like, réussie !"
    else
      flash.now[:alert] = "Echec à l'enregistrement !"
      render :index
    end
  end

  private

  def user_find
    User.find(params[:id])
  end

  def users_all
    User.all
  end

  def events_all
    Event.all
  end
end
