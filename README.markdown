skalnik's vim config
====================

Installation
------------

Move your existing vim setup out of the way:

    $ mv ~/.vimrc ~/.vimrc.old; mv ~/.gvimrc ~/.gvimrc.old; \
      mv ~/.vim ~/.vim.old

Clone the repo, add link to .vimrc, & setup vundle:

    $ git clone git://github.com/skalnik/vim_config.git ~/.vim
    $ ln -s ~/.vim/vimrc ~/.vimrc
    $ cd ~/.vim && git submodule update --init
    $ mvim -u vundle.vim +BundleInstall +q +q

To use Command T you will then need to download the submodules & compile it:

    $ cd ~/.vim/bundle/command-t
    $ git submodule update --init
    $ rake make 
