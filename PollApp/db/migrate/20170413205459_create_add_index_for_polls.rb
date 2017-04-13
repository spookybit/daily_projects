class CreateAddIndexForPolls < ActiveRecord::Migration[5.0]
  def change
    add_index :polls, [:title, :author_id]
  end
end
