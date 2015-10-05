# vim-LogNav

Despite syntax highlighting makes it easier to browse log files, we usually
read them in black and white due to the time required to write a custom
plugin.

The purpose of [LogNav.vim](https://github.com/mMontu/vim-LogNav/) is to
provide a quick and easy way to setup a simple syntax highlighting, along some
simple features to make it easier to read and browse large log files:

1. display external messages received by the application on a different
   color
2. emphasize the direction (send/receive) of exchanged messages
3. highlight specific events and handlers/threads
4. allow navigation between some configured identifiers, which can be useful
   when several tests/operations are written to the same log file
5. uses colors from the current color scheme in order to reduce the
   configuration effort
6. enables folding of external messages
7. make it easy to execute commands to refresh the log file

## Details ##

Use the `:LogNavSample` command to display a sample log file and understand
what is provided by this plugin.  
The `:LogNavSampleConfig` command shows how the plugin was configured for the
sample log file.


## Installation

If you don't have a preferred installation method, I recommend
installing [pathogen.vim](https://github.com/tpope/vim-pathogen), and
then simply copy and paste:

    cd ~/.vim/bundle
    git clone https://github.com/mMontu/vim-LogNav.git

Once help tags have been generated, you can view the manual with
`:help LogNav`.

