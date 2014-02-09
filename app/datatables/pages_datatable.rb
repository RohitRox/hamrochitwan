class PagesDatatable
  delegate :page_path, :params, :h, :link_to, :time_ago_in_words, :current_user, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      aaData: data,
      iTotalDisplayRecords: @raw_pages_count,
      iTotalRecords: Page.count
    }
  end

private

  def data
    pages.map do |page|
      page_info = "<h3>#{link_to page.title, page_path(page)}</h3><p><span class='label label-default'>#{time_ago_in_words(page.created_at)} ago</span> <span class='label label-info'>In: #{page.business.title}</span></p>"
      [
        page_info,
        page.title,
        page.created_at
      ]
    end
  end

  def pages
    @pages ||=fetch_pages
  end

  def fetch_pages
    condn = {}
    condn.merge!(user_id: current_user.id) if params[:filter] == "my_pages"
    raw_page = Page.includes(:business).where(condn).where('title ilike :search_term',search_term: "%#{params[:sSearch]}%")
    @raw_pages_count = raw_page.count 
    raw_page.order("#{sort_column} #{sort_direction}").page(page).per(per_page)
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[created_at id title]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end