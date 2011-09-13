SparrowBones Xcode 4 Template
=============================

These are simple templates for producing Sparrow-Framework based games
on iOS.

Installation
============

Run this command in a terminal to clone things to the right place:

    curl -fsSL https://raw.github.com/gist/1214364/install_sparrowbones.sh | bash -s

The sensibly paranoid may want to know what that does. It fetches a gist and
sends it to a command shell. Here's the script: [https://gist.github.com/1214364]()

It makes sure your Xcode template folder exists, clones SparrowBones into
it, and finally it sets up the submodules (currently Sparrow is the only
submodule).

This should leave you with a folder called SparrowBones in your Xcode
templates folder. Next time you create a new project you will have a new
template category under iOS called SparrowBones.

Using The Template
==================

There are 2 templates provided:

- **Game with Sparrow source copied**. Use this if you want the easiest way
to start a new project. After the wizard you can dive right in. It copies
a version of Sparrow-Framework into the project directory (current SHA:
[6d7112975f48efc65f8afce69ccf82d301f9b7a3](https://github.com/PrimaryFeather/Sparrow-Framework/tree/6d7112975f48efc65f8afce69ccf82d301f9b7a3)).

- **Game with Sparrow source linked**.  This template requires you to
perform some minor post creation configuration. When you create a new project
the link to Sparrow.xcodeproj will appear in RED. To fix this, follow the
instructions in the README.txt file in the Sparrow group.

Once you've chosen, the place to start is in
`<your game name>/<your game name>ViewController.m`. Follow the comments and
you should be sorted.

Updating The Template
=====================

Updating the templates code is easy. It's just a git repository, so this
should work:

    cd $HOME/Library/Developer/Xcode/Templates/SparrowBones
    git pull origin master
    git submodule update --init

NOTE: This only affects newly created projects. There's no easy way to
update all your existing projects.


mnem

Complaints/compliments: http://noiseandheat.com/
