if defined?(ActiveAdmin)
  ActiveAdmin.register Social::InstagramPhoto do
    controller do
      cache_sweeper Social.config.cache_sweeper if Social.config.cache_sweeper
    end

    menu :parent => "Social", :label => "Instagram", :priority => 1
    form do |f|
      f.inputs "Instagram Photos" do
        f.input :offensive
      end

      f.actions
    end

    index do
      column "Image" do |image|
        image_tag image.image_url
      end

      default_actions
    end
  end
end
