class HomeRouteGenerator < Rails::Generator::Base
  
  default_options :author => nil
  
  attr_reader :name, :application
  
  def initialize(runtime_args, runtime_options = {})
    super
    usage if args.empty?
    @name = args.shift
    @application = File.basename(destination_root)
    extract_options
  end

  def manifest
    record do |m|
      # Ensure appropriate folder(s) exists
      m.directory 'config'

      # Create stubs
      m.file "config/routes.rb",  "config/routes.rb"
      
      m.dependency :controller, %w[home index], :force => true
    end
  end

  protected
    def banner
      <<-EOS
Creates a 'home' controller, and default routes file 
that makes home#index the root page of the application.

USAGE: #{$0} #{spec.name} ."
EOS
    end

    def add_options!(opts)
      # opts.separator ''
      # opts.separator 'Options:'
      # For each option below, place the default
      # at the top of the file next to "default_options"
      # opts.on("-a", "--author=\"Your Name\"", String,
      #         "Some comment about this option",
      #         "Default: none") { |options[:author]| }
      # opts.on("-v", "--version", "Show the #{File.basename($0)} version number and quit.")
    end
    
    def extract_options
      # for each option, extract it into a local variable (and create an "attr_reader :author" at the top)
      # Templates can access these value via the attr_reader-generated methods, but not the
      # raw instance variable value.
      # @author = options[:author]
    end
end