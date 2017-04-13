class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :text, null: false
      t.integer :poll_id
      t.timestamps
    end
    add_index :questions, [:poll_id, :text]
  end
end
