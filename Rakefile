# Rakefile
#
# Simple tasks for managing my .vim files
VIMRC_FILE = 'vimrc'
GVIMRC_FILE = 'gvimrc'

namespace :vim do
  desc 'Install vundle'
  task :install do
    bundle_dir = File.expand_path("~/.vim/bundle")
    vundle_dir = File.join(bundle_dir, "Vundle.vim")
    clone_vundle = "git clone http://github.com/gmarik/vundle.git #{vundle_dir}"
    update_vundle = "git pull"

    unless File.exists?(vundle_dir)
      puts "Cloning the Vundle repo into #{vundle_dir}"
      system(clone_vundle)
    end

    if File.exists?(vundle_dir)
      puts 'Updating the Vundle repo'
      system(update_vundle, chdir: vundle_dir)

      puts 'Install Vim plugins via Vundle'
      system('yes | vim +PluginInstall! +PluginClean! +qall')

      puts 'Cloning YouCompleteMe submodules'
      system('git submodule update --init --recursive',
             chdir: File.join(bundle_dir, 'YouCompleteMe'))
      puts 'Building YouCompleteMe'
      system('./install.sh', chdir: File.join(bundle_dir, 'YouCompleteMe'))
    end
  end

  desc 'Create symlinks'
  task :link do
    FileUtils.ln_s ".vim/#{VIMRC_FILE}", File.expand_path('~/.vimrc'), force: true
    FileUtils.ln_s ".vim/#{GVIMRC_FILE}", File.expand_path('~/.gvimrc'), force: true
  end

end

task all: ["vim:install", "vim:link"]
task default: :all
