class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.citext :keyword, null: false
      t.references :user, null: false

      t.timestamps
    end

    add_index "histories", ["keyword", "user_id"], name: "index_histories_on_keyword_and_user", unique: true, using: :btree
  end
end
