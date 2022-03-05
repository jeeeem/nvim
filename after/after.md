> https://learnvimscriptthehardway.stevelosh.com/chapters/42.html

##### Note about after/

Generally, if you want to add your own plugin, or replace a standard plugin with your own, it would
go into ~/.vim/plugin or ~/.vim/ftplugin. If instead you want to keep the functionality of an existing
plugin but add to it, or change just a few settings made by it, then your plugin would go into ~/.vim/after/plugin
or ~/.vim/after/ftplugin.

##### ~/.vim/colors/

Files inside ~/.vim/colors/ are treated as color schemes. For example: if you run :color mycolors
Vim will look for a file at ~/.vim/colors/mycolors.vim and run it. That file should contain all the
Vimscript commands necessary to generate your color scheme.

We're not going to cover color schemes in this book. If you want to create your own you should copy
an existing scheme and modify it. Remember that :help is your friend.

##### ~/.vim/plugin/

Files inside ~/.vim/plugin/ will each be run once every time Vim starts. These files are meant to contain
code that you always want loaded whenever you start Vim.

##### ~/.vim/ftdetect/

Any files in ~/.vim/ftdetect/ will also be run every time you start Vim.

ftdetect stands for "filetype detection". The files in this directory should set up autocommands that
detect and set the filetype of files, and nothing else. This means they should never be more than one
or two lines long.

##### ~/.vim/ftplugin/

Files in ~/.vim/ftplugin/ are different.

The naming of these files matters! When Vim sets a buffer's filetype to a value it then looks for a
file in ~/.vim/ftplugin/ that matches. For example: if you run set filetype=derp Vim will look
for ~/.vim/ftplugin/derp.vim. If that file exists, it will run it.

Vim also supports directories inside ~/.vim/ftplugin/. To continue our example: set filetype=derp will
also make Vim run any and all _.vim files inside ~/.vim/ftplugin/derp/_. This lets you split up your
plugin's ftplugin files into logical groups.

Because these files are run every time a buffer's filetype is set they must only set buffer-local options!
If they set options globally they would overwrite them for all open buffers!

##### ~/.vim/indent/

Files in ~/.vim/indent/ are a lot like ftplugin files. They get loaded based on their names.

indent files should set options related to indentation for their filetypes, and those options should
be buffer-local.

Yes, you could simply put this code in the ftplugin files, but it's better to separate it out so other
Vim users will understand what you're doing. It's just a convention, but please be a considerate plugin
author and follow it.

##### ~/.vim/compiler/

Files in ~/.vim/compiler/ work exactly like indent files. They should set compiler-related options in
the current buffer based on their names.

Don't worry about what "compiler-related options" means right now. We'll cover that later.

##### ~/.vim/after/

The ~/.vim/after/ directory is a bit of a hack. Files in this directory will be loaded every time Vim
starts, but after the files in ~/.vim/plugin/.

This allows you to override Vim's internal files. In practice you'll rarely need this, so don't worry
about it until you find yourself thinking "Vim itself sets option x, but I want something different".

##### ~/.vim/autoload/

The ~/.vim/autoload/ directory is an incredibly important hack. It sounds a lot more complicated than
it actually is.

In a nutshell: autoload is a way to delay the loading of your plugin's code until it's actually needed.
We'll cover this in more detail later when we refactor our plugin's code to take advantage of it.

##### ~/.vim/doc/

Finally, the ~/.vim/doc/ directory is where you can add documentation for your plugin. Vim has a huge
focus on documentation (as evidenced by all the :help commands we've been running) so it's important
to document your plugins.
