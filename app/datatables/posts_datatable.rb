class PostsDatatable
  delegate :post_path, :params, :h, :link_to, :time_ago_in_words, :current_user, :image_tag, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      aaData: data,
      iTotalDisplayRecords: @raw_posts_count,
      iTotalRecords: Post.count
    }
  end

private

  def data
    posts.map do |post|
      post_info = "#{image_tag(post.photo_url(:thumb), class: 'table-thumb')}<h3>#{link_to post.title, post_path(post)}</h3><p><span class='label label-default'>#{time_ago_in_words(post.created_at)} ago</span> <span class='label label-warning'>Price: Rs. #{post.price}</span></p>"
      [
        post_info,
        post.title,
        post.price,
        post.created_at
      ]
    end
  end

  def posts
    @posts ||=fetch_posts
  end

  def fetch_posts
    condn = {}
    condn.merge!(user_id: current_user.id) if params[:filter] == "my_posts"
    raw_post = Post.select('id, title, created_at, price, slug, photo').where(condn).where('title ilike :search_term',search_term: "%#{params[:sSearch]}%")
    @raw_posts_count = raw_post.count 
    raw_post.order("#{sort_column} #{sort_direction}").page(page).per(per_page)
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[created_at id title price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end