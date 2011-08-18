skalnik's vim config
====================

Installation
------------

Move your existing vim setup out of the way:

    $ mv ~/.vimrc ~/.vimrc.old; mv ~/.gvimrc ~/.gvimrc.old; \
      mv ~/.vim ~/.vim.old

Clone repo & add link to .vimrc & get vundle

    $ git clone git://github.com/skalnik/vim_config.git ~/.vim
    $ ln -s ~/.vim/vimrc ~/.vimrc
    $ cd ~/.vim && git submodule update --init

Now, within vim, run `:BundleInstall`, which will download all plugins setup in
`vimrc`. To use Command T you will then need to download the submodules & it:

    $ cd ~/.vim/bundle/command-t
    $ git submodule update --init
    $ rake make 
