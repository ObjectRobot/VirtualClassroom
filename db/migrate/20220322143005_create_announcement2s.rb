class CreateAnnouncement2s < ActiveRecord::Migration[7.0]
  def change
    create_table :announcement2s do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
