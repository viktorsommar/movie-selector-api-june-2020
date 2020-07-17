class CreateWatchlistItems < ActiveRecord::Migration[6.0]
  def change
    create_table :watchlist_items do |t|
      t.watchlist :belongs_to

      t.timestamps
    end
  end
end
