HOW TO FIX THE SPARROW PROJECT REFERENCE
========================================

Greetings!

You may notice that the name "Sparrow.xcodeproj" is a broken RED link. This
is because I've had to hack this template together a little because I can't
work out how to tell it to store the project reference relative to your
SPARROW_SRC variable. And you do have one of those, don't you?[*]

THE FIX
=======

To add Sparrow:

1. Select "Sparrow.xcodeproj".
2. Select menu: View -> Utilities -> Show File Inspector (alt-cmd-1).
3. Set Location in the inspector to SPARROW_SRC (or whatever you called it).

To make sure Sparrow builds:

1. Select your project.
2. Select your project target (not the Tests one, if you added unit tests).
3. Select the "Build Phases" tab.
4. Expand "Target Dependencies" and click the + button to add one.
5. Add Sparrow->Sparrow.

Unfortunately, you will have to do this everytime you create a new project.
Hopefully I'll work out how to fix it at some point.





---
[*]
If you don't have a SPARROW_SRC set up in Xcode, you probably haven't
read through the excellent Sparrow-Framework setup instructions. You should
do that now: http://www.sparrow-framework.org/help/gettingstarted/. For
those in a rush, here's the relevant snippet:

    Add a “Source Tree” variable that Xcode can use to dynamically
    find Sparrow:

    o  In the Xcode preferences, tab: “Source Trees”, create a new
       Source Tree variable.
    o  Create SPARROW_SRC and let it point to /path_to_sparrow/sparrow/src/
    o  Be careful: Xcode does not allow any spaces in that path.
