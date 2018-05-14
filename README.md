Danni's vimrc
=============

This is Danni's vimrc, it is built on pathogen and git submodules.

Includes config obtained many years ago from Grahame Bowland.

Installing
----------

    git clone https://github.com/danni/vim-config .vim
    git submodule update --init bundle/

Maintaining Plugins
-------------------

To add a plugin:

    git submodule add <url> bundle/<name>

To remove a plugin:

    git submodule deinit -f bundle/<name>
    rm -rf bundle/<name>
