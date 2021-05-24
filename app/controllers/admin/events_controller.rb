class Admin::EventsController < ApplicationController
  before_action :check_if_admin?

  def index
    @events = events_all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
    @events = events_all
  end

  def update
    #Récupération des champs du formulaire
    event_validated = false
    event_validated = true if params["validated"] == "on"
    event_params = { validated: event_validated }
    event_find = Event.find(params[:id].to_i)

    puts "*"*50
    p event_validated
    p event_params
    p event_find
    p event_find.validated
    p event_find.start_date
    puts "*"*50

    #Sauvegarde en BDD
    # e = event_find.update(event_params)
    # p event_find.errors.messages
    if e = event_find.update(event_params)
      redirect_to admin_events_path, success: "Enregistrement réussi !"
    else
      flash.now[:alert] = "Echec à l'enregistrement !"
      render :index
    end

  end

  def destroy
  end

  private

  def events_all
    Event.all
  end
end
