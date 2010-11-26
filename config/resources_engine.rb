mount :at => "/qor_admin" do
  theme :tis

  resource_alias :translation, ::Qor::ResourcesEngine::Translation
  resource_list :product, :order, :user, :translation, :diff
  qor_translation

  index_attrs :exclude => [:created_at]
  meta :updated_at, :format => :short

  resource_alias :diff, ::Qor::Publish::Diff
  resource :diff do
    theme :publish
  end


  resource :user do
    write_attrs :name, :password
    index_attrs :name, :updated_at
  end
  resource :product do
    write_attrs :title, :cover, :description, :price
    read_attrs :title, :cover, :price
    meta :cover, :type => :image_with_cropping, :crop => [:thumb, :big], :format => lambda{|p| ("<img src='%s'/>" % p.cover.url(:thumb)).html_safe}

    meta :description, :type => :rich_text_editor, :format => lambda { |p| p.description.html_safe }

  end

  resource :order do
    write_attrs :email, :address, :pay_type, :line_items
    meta :address, :type => :string
    meta :pay_type, :type => :select_one, :collection => Order::PAYMENT_TYPES
    meta :line_items, :type => :collection_edit, :item_attrs => [
      {:name => :product},
      {:name => :quantity},
      {:name => :price},
    ]
  end

end
