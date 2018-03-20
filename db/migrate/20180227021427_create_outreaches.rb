class CreateOutreaches < ActiveRecord::Migration[5.0]
  def change
    create_table :outreaches do |t|
      t.string :outreach_text
      t.integer :lead_id

      t.timestamps
    end
  end
end
