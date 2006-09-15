module ::ActionController
  class Base
    unless defined? @@additional_template_roots
      @@additional_template_roots = []
    end
    
    def self.additional_template_roots
      @@additional_template_roots = ::PluginSystem::Instance.started_plugins.load_order.inject([]) do |array, plugin|
        plugin_template_root = File.join(plugin.path_to_gem, 'app', 'views')
        array << plugin_template_root if File.exist?(plugin_template_root)
      end
    end
    
    def additional_template_roots
      self.class.additional_template_roots
    end
  end
  
  module Layout
    module ClassMethods
      private
        alias :railfrog_original_layout_list :layout_list
        def layout_list
          additional_template_roots.inject(railfrog_original_layout_list) do |array, tmpl_root|
            array.concat Dir.glob("#{tmpl_root}/layouts/**/*")
          end
        end
    end
  end
end