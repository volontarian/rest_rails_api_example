require 'spec_helper'

describe Article do
  subject { Factory(:article) }

  describe '#set_categories_by_names' do
    it 'assures that categories are unique by title' do
      Factory(:category, title: 'Category 1')
      
      subject.category_names = ['Category 1']
      
      Category.count.should == 1
    end
    
    it 'removes old categories' do
      subject.category_names = ['Category 1']
      subject.category_names = ['Category 2']
      
      subject.categories.length.should == 1
      subject.categories.first.title.should == 'Category 2' 
    end
  end
end
