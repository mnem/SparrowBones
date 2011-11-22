SparrowBones Xcode 4 Template
=============================

These are simple templates for producing Sparrow-Framework based games
on iOS.

NOTE: At the moment, Starling doesn't compile if ARC (Automatic reference
counting) is enabled, so if you are using Xcode 4.2, make sure you uncheck
the 'Use Automatic Reference Counting' checkbox when creating a new project.

Requirements
============

The templates should work with Xcode 4.1 and 4.2. I *think* they work with
Xcode 4.0 as well, but unfortunately I don't have an installation to test
on. If you use Xcode 4.0, and it works, please send me a message to let
me know :)

Installation
============

After cloning this repository and updating the submodules, run the 
installation script in the root of the repository:

    git clone git://github.com/mnem/SparrowBones.git
    cd SparrowBones
    git submodule update --init
    ./install.rb

It makes sure your Xcode template folder exists, tries to work out which
version of Xcode you have, and then creates a symlink in the Xcode templates
directory to the appropriate folder in the repository, 4.1 or 4.2.

Using The Template
==================

There are 2 templates provided:

- **Game with Sparrow source copied**. Use this if you want the easiest way
to start a new project. After the wizard you can dive right in. It copies
a version of Sparrow-Framework into the project directory (current SHA:
[12d37ca](https://github.com/PrimaryFeather/Sparrow-Framework/tree/12d37ca)).

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

    cd SparrowBones
    git pull origin master
    git submodule update --init

NOTE: This only affects newly created projects. There's no easy way to
update all your existing projects.


mnem

Complaints/compliments: http://noiseandheat.com/
