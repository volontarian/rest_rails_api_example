class FeedSynchronization
  def initialize(feed_record)
    @feed_record = feed_record    
  end

  def run
    @feed_record.update_attribute :state, 'synchronizing'
    
    feed = Feedzirra::Feed.fetch_and_parse(@feed_record.url)
    
    feed.entries.each do |entry|
      next if Article.exists? title: entry.title
      
      article = Article.create!(title: entry.title, description: entry.summary, published_at: entry.published)
      
      article.category_names = entry.categories
    end
    
    @feed_record.update_attribute :state, 'outdated'
  end
end