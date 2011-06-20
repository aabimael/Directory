class UsersController < ApplicationController
  before_filter :authorize_admin
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    valido = false
    if !@user.password.blank? and @user.password.length < 5
      @user.errors.add("password", ": Debe ser mayor a 5.")
      valido = false
    else

      if @user.password == params[:confirmacion]
        valido = true
        @user.password = Digest::MD5.hexdigest(@user.password)
      else
        @user.errors.add("password", ": Los passwords no coinciden.")
      end
    end
    
    respond_to do |format|
      if valido and @user.save
        flash[:notice] = 'Usuario guardado.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    password = params[:password]
    valido = false
    if !password.blank? and password.length > 10
      @user.errors.add("password", ": Debe ser menor a 10.")
      valido = false
    else
      @user.password = password
      if @user.password == params[:confirmacion]
        valido = true
        @user.password = Digest::MD5.hexdigest(@user.password)
      else
        @user.errors.add("password", ": Los passwords no coinciden.")
      end
    end

    respond_to do |format|
      if valido and @user.update_attributes(params[:user])
        flash[:notice] = 'Usuario Actualizado.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
