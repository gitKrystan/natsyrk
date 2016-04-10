class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :github_response

      t.timestamps null: false
    end
  end
end
