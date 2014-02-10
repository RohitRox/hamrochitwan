class PagesController < ApplicationController
  
  skip_before_filter :authenticate_user!, only: [:index, :show]
  load_and_authorize_resource

  # GET /pages
  # GET /pages.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: PagesDatatable.new(view_context) }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id], include: [:attachments, :business])
    @posts = @page.posts.select('id, title, slug, price, photo, created_at')
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new
    @page.build_business
    @business = Business.select('id, title')
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
    @business = Business.select('id, title')
  end

  # POST /pages
  # POST /pages.json
  def create
    params[:page][:map_info] = nil unless params[:page][:map_info].present?
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        @business = Business.select('id, title')
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])
    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

  def feature_process
    @page = Page.find(params[:page_id])
    attr = @page.feature ? false : true
    @page.update_attribute(:feature, attr)
    @page.user.notify('Page Feature', "Your page #{view_context.link_to @page.title, @page.get_path} was #{attr ? 'featured' : 'unfeatured'}.")
    redirect_to @page, notice: "Page was successfully #{attr ? 'featured' : 'unfeatured'}."
  end

  def gallery
    redirect_to @page and return unless can? :edit, @page
    @page = Page.find(params[:page_id])
  end

end
