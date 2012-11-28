class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :url
      t.string :state, default: 'outdated'
      t.datetime :synchronized_at
      t.timestamps
    end
  end
end
