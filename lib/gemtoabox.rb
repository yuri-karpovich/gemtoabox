require "gemtoabox/version"
require 'fileutils'
require 'tmpdir'

module Gemtoabox

  class Project
    attr_accessor :pdir

    def initialize
      @pdir = Dir.mktmpdir
      FileUtils.mkdir("#{@pdir}/.bundle")
      config_text = "---
BUNDLE_PATH: vendor/bundle
BUNDLE_DISABLE_SHARED_GEMS: '1'"
      File.open("#{@pdir}/.bundle/config", 'w') { |f| f.write(config_text) }
    end

    def add_gemfile(path)
      gemfile_path = path
      gemfile_lock_path = "#{File.dirname(gemfile_path)}/Gemfile.lock"
      raise "Gemfile was not found in #{path}" unless File.exist? gemfile_path
      FileUtils.cp(gemfile_path, "#{self.pdir}/Gemfile")
      FileUtils.cp(gemfile_lock_path, "#{self.pdir}/Gemfile.lock")
    end

    def extract_gems
      Bundler.with_clean_env do
        Dir.chdir "#{self.pdir}"
        system "bundle install"
        system "bundle package"
      end

      "#{self.pdir}/vendor/cache"
    end

    def rm_project
      FileUtils.rm_rf self.pdir
    end
  end

  class GemsUploader

    def self.upload(opts)
      required_options = [:from, :to]
      required_options.each { |i| raise "#{i} parameter is required" unless opts[i] }
      overwrite = opts[:overwrite].to_s == 'true'

      gems_folder = opts[:from]
      host = opts[:to]

      Dir.chdir gems_folder

      command = "gem inabox -g #{host} *.gem"
      command += ' -o' if overwrite
      system command
    end

  end

end
