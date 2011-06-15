class CommandsController < ApplicationController
  # GET /commands
  # GET /commands.xml
  def index
    @commands = Command.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @commands }
    end
  end

  # GET /commands/1
  # GET /commands/1.xml
  def show
    @command = Command.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @command }
    end
  end

  # GET /commands/new
  # GET /commands/new.xml
  def new
    @command = Command.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @command }
    end
  end

  # GET /commands/1/edit
  def edit
    @command = Command.find(params[:id])
  end

  # POST /commands
  # POST /commands.xml
  def create
    @command = Command.new(params[:command])

    respond_to do |format|
      if @command.save
        format.html { redirect_to(@command, :notice => 'Command was successfully created.') }
        format.xml  { render :xml => @command, :status => :created, :location => @command }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @command.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /commands/1
  # PUT /commands/1.xml
  def update
    @command = Command.find(params[:id])

    respond_to do |format|
      if @command.update_attributes(params[:command])
        format.html { redirect_to(@command, :notice => 'Command was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @command.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /commands/1
  # DELETE /commands/1.xml
  def destroy
    @command = Command.find(params[:id])
    @command.destroy

    respond_to do |format|
      format.html { redirect_to(commands_url) }
      format.xml  { head :ok }
    end
  end
  
  def conn
    Net::SSH.start( '127.0.0.1', 'unf-ubu' ) do |session|
      session.open_channel do |channel|
        channel.on_close do |ch|
          puts "channel closed successfully."
          render :text => 'hits'
        end
        puts "closing channel..."
        channel.close
      end
      session.loop
    end   
  end




  
  
end
