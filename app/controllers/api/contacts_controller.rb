class Api::ContactsController < ApplicationController

  def index
    # if current_user
    #   @contacts = current_user.contacts

    #   if params[:search]
    #     @contacts = @contacts.where("first_name iLIKE ? OR last_name iLIKE ? OR middle_name iLIKE ? OR email iLIKE ? OR bio iLIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    #   end

    #   if params[:group]
    #     group = Group.find_by(name: params[:group])
    #     @contacts = group.contacts.where(user_id: current_user.id)
    #   end

    #   @contacts = @contacts.order(:id)

    #   render 'index.json.jb'
    # else
    #   render json: []
    # end
    @contacts = Contact.all
    render 'index.json.jb'
  end

  def create
    coordinates = Geocoder.coordinates(params[:address])
    # coordinates should be an array of lat, long

    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio],
      latitude: coordinates[0],
      longitude: coordinates[1],
      user_id: 2
    )
    if @contact.save
      render 'show.json.jb'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @contact = Contact.find(params[:id])

    if params[:address]
      coordinates = Geocoder.coordinates(params[:address])
      @contact.latitude = coordinates[0] || @contact.latitude
      @contact.longitude = coordinates[1] || @contact.longitude
    end
    
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.bio = params[:bio] || @contact.bio

    if @contact.save
      render 'show.json.jb'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: {message: "Contact successfully destroyed"}
  end

end
