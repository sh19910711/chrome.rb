module Chrome
  class Finder
    def initialize(path)
      @path = path || find
    end

    def command?(path)
      File.executable?(path)
    end

    def find
      if OS.linux?
        binaries = [
          "chromium",
          "google-chrome",
          "chromium-browser",
        ]
        binaries.find {|cmd| command? cmd }
      else
        puts "Sorry, your system seems not supported yet."
      end
    end
  end
end
