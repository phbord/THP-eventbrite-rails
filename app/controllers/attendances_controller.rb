class AttendancesController < ApplicationController
  before_action :authenticate_user

  def index
    @events
  end

  def new
  end

  def create
    #Récupération des champs du formulaire
    # attendance = Attendance.new(
    #   'user' => current_user,
    #   'event' => current_user,
    #   'strip_customer_id' => params[:strip_customer_id]
    # )
    # puts "*"*50
    # p attendance
    # p attendance.user
    # puts "*"*50

    #Sauvegarde en BDD
    # if attendance.save
    #   redirect_to event_path(attendance.user), alert: "Enregistrement réussi !"
    # else
    #   p attendance.errors.messages
    #   flash.now[:alert] = "Echec à l'enregistrement !"
    #   render :show
    # end

    @user = User.first
    @event = Event.first
    @amount = @event.price
    @stripe_amount = (@amount*100).to_i

    puts "*"*50
    p Stripe
    p Stripe::Customer
    p Stripe::Charge
    puts "*"*50

    begin
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @stripe_amount,
        description: "Achat d'un produit",
        currency: 'eur',
      })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_attendance_path
    end
  end

  def show
    @event = event_find
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
