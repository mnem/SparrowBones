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
    git submodule update --init

This should leave you with a folder called SparrowBones in your Xcode
templates folder. Next time you create a new project you will have a new
category to choose templates from called SparrowBones.

Using The Template
==================

The templates always require you to perform a one time bit of configuration
when you create a new project unfortunately. When you create a new project
the link to Sparrow.xcodeproj will appear in RED. To fix this, follow the
instructions in the README.txt file in the Sparrow group.

Once you've done that, dive right in. Generally the place to start is in
`<your game name>/<your game name>ViewController.m`. Follow the comments and you should
be sorted.


mnem

Complaints/compliments: http://noiseandheat.com/
