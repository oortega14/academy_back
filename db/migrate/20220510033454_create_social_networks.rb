class CreateSocialNetworks < ActiveRecord::Migration[7.0]
  def change
    create_table :social_networks do |t|
      t.string :web_site
      t.string :facebook_profile_url
      t.string :instagram_profile_url
      t.string :linked_in_profile_url
      t.string :twitter_profile_url
      t.string :youtube_profile_url
      t.string :tiktok_profile_url
      t.references :academy, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
