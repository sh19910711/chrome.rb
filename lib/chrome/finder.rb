module Chrome
  class Finder
    def initialize(path)
      @path = path || find
    end

    def command?
      @path && File.executable?(@path)
    end

    def find
      [ "chromium", "google-chrome", "chromium-browser" ].find do |cmd|
        p "cmd: #{cmd}"
        false
      end
    end
  end
end
