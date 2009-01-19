namespace :radiant do
  namespace :extensions do
    namespace :simple_web_shop do
      
      desc "Runs the migration of the Simple Web Shop extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          SimpleWebShopExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          SimpleWebShopExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Simple Web Shop to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[SimpleWebShopExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(SimpleWebShopExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
