class CreateBoardPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :board_posts do |t|
      t.integer :board_id
      t.integer :post_id

      t.timestamps
    end
  end
end
