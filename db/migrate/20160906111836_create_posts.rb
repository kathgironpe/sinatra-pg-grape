class CreatePosts < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :posts, id: :uuid do |t|
      t.text :title
      t.text :body
      t.boolean :published, default: true
      t.timestamps
    end
  end
end
