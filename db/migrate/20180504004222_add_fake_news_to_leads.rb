class AddFakeNewsToLeads < ActiveRecord::Migration[5.0]
  def change
    add_column :leads, :fake_news, :string
  end
end
