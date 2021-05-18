class EventsController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def index
    @events = Event.all
  end

  def new
  end

  def create
    #Récupération des champs du formulaire
    date = Time.zone.now
    event = Event.new(
      'start_date' => date,
      'duration' => params[:duration],
      'title' => params[:title],
      'description' => params[:description],
      'price' => params[:price],
      'location' => params[:location],
      'organizer' => current_user
    )
    puts "*"*50
    p event
    puts "*"*50

    #Sauvegarde en BDD
    if event.save
      redirect_to event_path(event.id), alert: "Enregistrement réussi !"
    else
      p event.errors.messages
      flash.now[:alert] = "Echec à l'enregistrement !"
      render 'new'
    end
  end

  def show
    @event = event_find
    @start_date = @event.start_date.to_date.strftime("%d/%m/%Y")
    @end_date = @event.end_date.to_date.strftime("%d/%m/%Y")
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def event_find
    Event.find(params[:id])
  end
end
