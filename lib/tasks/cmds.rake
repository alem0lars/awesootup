require 'pathname'
require 'monadic'


namespace :cmds do

  desc "Generate the CTags"
  task :ctags do
    FileUtils.cd(Rails.root) do
      puts `ctags -R --exclude=.git --exclude=log *`
    end
  end

  namespace :deps do

    desc "Start the dependencies"
    task :start do
      get_deps_names.each do |dep_name|
        exec_cmd(find_cmd(:start, dep_name))
      end
    end

    desc "Stop the dependencies"
    task :stop do
      get_deps_names.each do |dep_name|
        exec_cmd(find_cmd(:stop, dep_name))
      end
    end

    # try some common methods to handle the dependency, otherwise fail
    def find_cmd(exec_t, dep_name)
      cmd = nil

      Either.chain do

        bind -> { # == Method: init.d daemons ================================
          match = %w[
            /etc/init.d
            /etc/rc.d
          ].select { |dir| File.directory?(dir) }

          return true if match.empty? # method is invalid => continue

          initd_dir = Pathname.new match.first

          dae_pth = initd_dir.join(dep_name)

          if dae_pth.exist? # -- exact match ---------------------------------
            (cmd = get_dae_cmd(dae_pth, exec_t)) if dae_pth.executable_real?
            return false # found => stop
          else # -- fuzzy search inside the initd_dir ------------------------
            initd_dir.entries.each do |entry|
              if entry.to_s =~ /^#{dep_name}(.+)/
                dae_pth = initd_dir.join(entry)
                if dae_pth.exist? && dae_pth.executable_real? # found!
                  cmd = get_dae_cmd(dae_pth, exec_t)
                  return false # found => stop
                end
              end
            end
            return true # not found => continue
          end
        }

      end

      cmd # return
    end

    def exec_cmd(cmd)
      sh(cmd, verbose: false)
    rescue
      puts "Failed to execute the command #{cmd}"
    end

    def get_dae_cmd(dae_pth, exec_t)
      "sudo #{dae_pth} #{exec_t}"
    end

    def get_deps_names
      %w(redis postgresql)
    end

    def dep_failure(action, dep_name)
      puts "Failed to #{action} the dependency #{dep_name}"
    end

  end

end
