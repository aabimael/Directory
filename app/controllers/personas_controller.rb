class PersonasController < ApplicationController

  before_filter :authorize
  
  # GET /personas
  # GET /personas.xml
  def index
    @personas = Persona.all

    consulta = ''
    #    parece = "like"
    parece = "ilike"
    #    concatena = "+"
    concatena = "||"
    nombres = params[:busca_nombre] || ''
    tel = params[:busca_tel] || ''
    empresa = params[:busca_empresa] || ''
    #variables para generar los links
    @nombre_link = nombres
    @tel_link = tel
    @empresa_link = empresa
    puts
    puts
    puts
    puts "Empresa = " + empresa
    
    if nombres == '' and tel == '' and empresa == ''
      @personas = []
      flash[:notice] = ''
    else
      if !nombres.nil? and nombres != ''
        nombres = '%'+ nombres + '%'
        consulta = "(nombres " + concatena + " ' ' " + concatena +
          " a_paterno " + concatena + " ' ' " + concatena + " a_materno)" + parece + " :nombres"
      end

      if nombres != '' and tel != ''
        consulta = consulta + " and "
      end

      if !tel.nil? and tel != ''
        tel = '%' + tel + '%'
        consulta = consulta + "(tel_oficina " + parece + " :tel or "
        consulta = consulta + "tel_particular " + parece + " :tel or "
        consulta = consulta + "tel_movil " + parece + " :tel or "
        consulta = consulta + "tel_fax " + parece + " :tel) "
      end

      if (nombres != '' or tel != '') and empresa != ""
        consulta = consulta + " and "
      end

      if !empresa.nil? and empresa != ""
        empresa = '%' + empresa + '%'
        consulta = consulta + "(empresa " + parece +" :empresa )"
      end
      #consulta = consulta + " order by nombres"
      puts "consulta = " + consulta
      puts
      puts
      puts
      #      @personas = Persona.find_by_sql ["select * from personas where nombres like ?", nombres.to_s]
      @personas = Persona.find(:all,:conditions => [consulta, {:nombres => nombres.to_s, :tel => tel, :empresa => empresa}], :order => { :nombres => ""})
      if @personas.empty?
        flash[:notice] = 'No se encontraron resultados.'
      else
        flash[:notice] = ''
      end
    end


    respond_to do |format|
      @identificador = 'algo'
      format.html # index.html.erb
      format.xml  { render :xml => @personas }
    end
  end

  # GET /personas/1
  # GET /personas/1.xml
  def show
    @persona = Persona.find(params[:id])
    @nombre_link = params[:nombre_link] || ''
    @tel_link = params[:tel_link] || ''
    @empresa_link = params[:empresa_link] || ''

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @persona }
    end
  end

  # GET /personas/new
  # GET /personas/new.xml
  def new
    @persona = Persona.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @persona }
    end
  end

  # GET /personas/1/edit
  def edit
    @persona = Persona.find(params[:id])
    @nombre_link = params[:nombre_link] || ''
    @tel_link = params[:tel_link] || ''
    @empresa_link = params[:empresa_link] || ''
  end

  # POST /personas
  # POST /personas.xml
  def create
    @persona = Persona.new(params[:persona])

    respond_to do |format|
      if @persona.save
        flash[:notice] = 'Registro guardado correctamente.'
        format.html { redirect_to(@persona) }
        format.xml  { render :xml => @persona, :status => :created, :location => @persona }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @persona.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /personas/1
  # PUT /personas/1.xml
  def update
    @persona = Persona.find(params[:id])
    @nombre_link = params[:nombre_link] || ''
    @tel_link = params[:tel_link] || ''
    @empresa_link = params[:empresa_link] || ''

    respond_to do |format|
      if @persona.update_attributes(params[:persona])
        flash[:notice] = 'Registro actualizado correctamente.'
        format.html { redirect_to(@persona) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @persona.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.xml
  def destroy
    @persona = Persona.find(params[:id])
    #    @persona.destroy


    @nombre_link = params[:nombre_link] || ''
    @tel_link = params[:tel_link] || ''
    @empresa_link = params[:empresa_link] || ''

    puts "nombre_link" + @nombre_link
    puts "tel_link" + @tel_link
    puts "empresa_link" + @empresa_link
    
    respond_to do |format|
      #      format.html { redirect_to(personas_url) }
      format.html { redirect_to :action => "index", :busca_nombre => @nombre_link,
        :busca_tel => @tel_link, :busca_empresa => @empresa_link}
      format.xml  { head :ok }
    end
  end

  def prueba
    @persona = Persona.find(params[:id])
    @persona.destroy
    
    @nombre_link = params[:nombre_link] || ''
    @tel_link = params[:tel_link] || ''
    @empresa_link = params[:empresa_link] || ''

    puts "prueba"
    puts "nombre_link " + @nombre_link
    puts "tel_link " + @tel_link
    puts "empresa_link " + @empresa_link
    

    respond_to do |format|
      #      format.html { redirect_to(personas_url) }
      format.html { redirect_to :action => "index", :busca_nombre => @nombre_link,
        :busca_tel => @tel_link, :busca_empresa => @empresa_link}
      format.xml  { head :ok }
    end

  end
end
