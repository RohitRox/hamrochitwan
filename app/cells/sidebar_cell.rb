class SidebarCell < Cell::Rails

  def show
  	@hotdeals = Post.where(hotdeal: true, hotdeal_status: Post::HOTDEAL_ACTIVE).order("created_at desc").limit(10)
  	@popular = Post.order("created_at desc").limit(10)
  	@ads = Buzz.where(status: Buzz::PUBLISHED, position: [Buzz::POSITION_HOMEPAGE,Buzz::POSITION_ALL]).order('created_at desc').limit(10).shuffle.in_groups_of(2, false)
    render
  end

end
