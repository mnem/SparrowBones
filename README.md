SparrowBones Xcode 4 Template
=============================

This is a simple set of templates for producing Sparrow-Framework based
games on iPhone.

Installation
============

Clone this repository to your Xcode 4 user templates folder. You may
have to create the folder first. These lines should do the trick:

    mkdir -p ~/Library/Developer/Xcode/Templates
    cd ~/Library/Developer/Xcode/Templates
    git clone git://github.com/mnem/SparrowBones.git
    cd SparrowBones
    git submodule update --init

This should leave you with a folder called SparrowBones in your Xcode
templates folder. Next time you create a new project you will have a new
category to choose templates from called SparrowBones.

Using The Template
==================

There are 2 templates provided:

- **Game with Sparrow source copied**. Use this if you want the easiest way
to start a new project. After the wizard you can dive right in. It copies
a version of Sparrow-Framework into the project directory (SHA:
6d7112975f48efc65f8afce69ccf82d301f9b7a3).

- **Game with Sparrow source linked**.  This template requires you to
perform some minor post creation configuration. When you create a new project
the link to Sparrow.xcodeproj will appear in RED. To fix this, follow the
instructions in the README.txt file in the Sparrow group.

Once you've chosen, dive right in. Generally the place to start is in
`<your game name>/<your game name>ViewController.m`. Follow the comments and
you should be sorted.

Updating The Template
=====================

Updating the templates code is easy. It's just a git repository, so this
should work:

    cd ~/Library/Developer/Xcode/Templates/SparrowBones
    git pull origin master
    git submodule update --init

NOTE: This only affects newly created projects. There's no easy way to
update all your existing projects.


mnem

Complaints/compliments: http://noiseandheat.com/
