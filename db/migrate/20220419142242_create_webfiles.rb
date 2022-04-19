class CreateWebfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :webfiles do |t|
      t.string :title
      t.string :download

      t.timestamps
    end
  end
end
