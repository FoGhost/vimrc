desc "deploy vimrc"
task :deploy do
  # Bundle and scripts
  system 'git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle'
  system 'cp .vimrc .gvimrc ~/'
  system 'vim +BundleInstall +qa'
end

namespace :push do
  desc "Push local vim config file to github."
  task :config do
    system "cp ~/.vimrc ~/.gvimrc ."
    system "git add .vimrc .gvimrc"
    system "git commit -m 'Rake: update vim config file.'"
    system "git push"
  end
end
