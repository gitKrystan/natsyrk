class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.text :github_response

      t.timestamps null: false
    end
  end
end
