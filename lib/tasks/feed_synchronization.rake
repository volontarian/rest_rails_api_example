task feed_synchronization: :environment do
  Feed.outdated.each do |feed_record|
    feed_synchronization = FeedSynchronization.new feed_record
    feed_synchronization.run
  end
end