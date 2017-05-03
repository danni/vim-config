Danni's vimrc
=============

This is Danni's vimrc, it is built on pathogen and git submodules.

Includes config obtained many years ago from Grahame Bowland.

Feel free to clone as .vim and then symlink .vim/vimrc -> .vimrc

Maintaining Plugins
-------------------

To add a plugin:

    git submodule add <url> bundle/<name>

To remove a plugin:

    git submodule deinit -f bundle/<name>
    rm -rf bundle/<name>
