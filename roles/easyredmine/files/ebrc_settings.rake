desc <<-END_DESC
Custom Redmine settings for EuPathDB.

Example:
  rake redmine:ebrc_settings RAILS_ENV=production 
END_DESC
namespace :redmine do
  task :ebrc_settings => :environment do

    Setting.ui_theme = 'easy_widescreen'

    EasySetting.where(:name => 'hide_login_quotes').each do |setting|
      setting.value = true
      setting.save
    end

    EasySetting.where(:name => 'show_easy_resource_booking').each do |setting|
      setting.value = false
      setting.save
    end

    EasySetting.where(:name => 'show_personal_statement').each do |setting|
      setting.value = false
      setting.save
    end

    EasySetting.where(:name => :attachment_description).each do |setting|
      setting.value = true
      setting.save
    end
    EasySetting.where(:name => :attachment_description_required).each do |setting|
      setting.value = false
      setting.save
    end

    EasySetting.where(:name => :easy_select_limit).each do |setting|
      setting.value = '10001'
      setting.save
    end

  end
end

