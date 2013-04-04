if defined?(ActiveAdmin)
  ActiveAdmin.register Social::TwitterUser do
    controller do
      cache_sweeper Social.config.cache_sweeper if Social.config.cache_sweeper
    end

    menu :parent => "Social", :label => "Twitter", :priority => 1
    form do |f|
      f.inputs "Twitter Accounts" do
        f.input :username
      end

      f.actions
    end

    index do
      column :username

      default_actions
    end
  end
end
