# ref: http://stackoverflow.com/questions/11784109/detecting-operating-systems-in-ruby
require "rbconfig"

module Chrome
  module OS
    def self.os
      @os ||= resolve
    end

    def self.resolve
      host_os = RbConfig::CONFIG["host_os"]
      case host_os
      when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
        :windows
      when /darwin|mac os/
        :macosx
      when /linux/
        :linux
      when /solaris|bsd/
        :unix
      else
        raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
      end
    end

    def self.linux?
      os === :linux
    end
  end
end
