class CappsController < ApplicationController
  # GET /capps
  # GET /capps.xml
  def index
    @capps = Capp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @capps }
    end
  end

  # GET /capps/1
  # GET /capps/1.xml
  def show
    @capp = Capp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @capp }
    end
  end

  # GET /capps/new
  # GET /capps/new.xml
  def new
    @capp = Capp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @capp }
    end
  end

  # GET /capps/1/edit
  def edit
    @capp = Capp.find(params[:id])
  end

  # POST /capps
  # POST /capps.xml
  def create
    @capp = Capp.new(params[:capp])

    respond_to do |format|
      if @capp.save
        flash[:notice] = 'Capp was successfully created.'
        format.html { redirect_to(@capp) }
        format.xml  { render :xml => @capp, :status => :created, :location => @capp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @capp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /capps/1
  # PUT /capps/1.xml
  def update
    @capp = Capp.find(params[:id])

    respond_to do |format|
      if @capp.update_attributes(params[:capp])
        flash[:notice] = 'Capp was successfully updated.'
        format.html { redirect_to(@capp) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @capp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /capps/1
  # DELETE /capps/1.xml
  def destroy
    @capp = Capp.find(params[:id])
    @capp.destroy

    respond_to do |format|
      format.html { redirect_to(capps_url) }
      format.xml  { head :ok }
    end
  end
end
