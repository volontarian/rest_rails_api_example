require 'spec_helper'

describe FeedSynchronization do
  before(:each) do
    Feedzirra::Feed.stub(:fetch_and_parse).and_return(
      OpenStruct.new(
        entries: [
          OpenStruct.new(title: 'Article 1', summary: 'Dummy', published: Time.now, categories: ['ruby'])
        ]
      )
    )
    
    @feed_record = Factory(:feed)
  end
  
  describe '#run' do
    context 'run once' do
      it 'imports 1 article with 1 category' do
        feed_synchronization = FeedSynchronization.new @feed_record
        feed_synchronization.run
        @feed_record.reload
        
        @feed_record.state.should == 'outdated'
        Article.count.should == 1
        Category.count.should == 1
      end
    end
    
    context 'run twice' do
      it 'imports 1 article with 1 category' do
        feed_synchronization = FeedSynchronization.new @feed_record
        feed_synchronization.run
        feed_synchronization.run
        @feed_record.reload
        
        @feed_record.state.should == 'outdated'
        Article.count.should == 1
        Category.count.should == 1
      end
    end
  end
end
