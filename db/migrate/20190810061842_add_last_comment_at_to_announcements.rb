class AddLastCommentAtToAnnouncements < ActiveRecord::Migration[5.1]
  def change
    add_column :announcements, :last_comment_at, :datetime
  end
end
