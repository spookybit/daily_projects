class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.integer :answer_id, null: false
      t.integer :question_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :responses, [:answer_id, :question_id, :user_id]
  end
end
