class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
    	t.string :site_url
    	t.string :picture_url
        t.string :orig_pic_url
        t.string :classes
        t.string :ids
        t.string :container
    	t.string :domain
    	t.string :title
    	t.string :icon_url
    	t.string :language
    	t.string :new

    	t.timestamps null: false
    end
  end
end