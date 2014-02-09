module Searcher
	def search keyword
		self.find(:all, :conditions => ['title ILIKE ? OR description ILIKE ?', "%#{keyword}%", "%#{keyword}%"], select: 'id, title, description')
	end
end