module Chrome
  class Finder
    def initialize(path)
      @path = path || find
    end

    def command?
      @path && File.executable?(@path)
    end

    def find
      if OS.linux?
        [ "chromium", "google-chrome", "chromium-browser" ].find do |cmd|
          false
        end
      else
        puts "Sorry, your system seems not supported yet."
      end
    end
  end
end
