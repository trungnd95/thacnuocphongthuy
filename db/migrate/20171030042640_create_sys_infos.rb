class CreateSysInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :sys_infos do |t|
      t.string :hotline
      t.string :address
      t.text :about_us
      t.string :facebook_page_url
      t.string :email

      t.timestamps
    end
  end
end
