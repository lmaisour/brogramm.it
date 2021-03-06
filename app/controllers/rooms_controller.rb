class RoomsController < ApplicationController
  before_action :config_opentok, :except => [:index]
  before_action :require_login

  def new
    @new_room = Room.new
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to rooms_path
  end

  def index
    @rooms = Room.where(public: true).order("created_at DESC")
    @new_room = Room.new
  end

 def create
    session = @opentok.create_session :media_mode => :routed
    # took out request.remote_addr since 
    #open tok doesn't allow strings in parameters for sessions
    params[:room][:sessionId] = session.session_id

    @new_room = Room.new(room_params)

    if @new_room.save
        redirect_to("/rooms/"+@new_room.id.to_s) 
    else
        redirect_to root_path 
    end

  end
  
  def show
        # change
        @room = Room.find(params[:id])
        @tok_token = @opentok.generate_token @room.sessionId
        @comment = Comment.new
        @comments = Comment.order('created_at DESC')
        # pass in @room.sessionId in as first argument instead of a hash
        # that contains it in a value
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  private

  def config_opentok
    if @opentok.nil?
        @opentok = OpenTok::OpenTok.new "45020052", "7fef46f167d1d7cdad73873d2e141943a8ac611d"
    end
  end

  def room_params
    params.require(:room).permit(:sessionId, :name, :public, :subject, :created_by, :description, :editor)
  end




end