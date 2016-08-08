# Git Definitions
## (a brief tutorial)

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?

Version control is a mechanism that tracks and allows us to view the history of revisions to files,
in addition to merge revisions made by different people. It creates a record of revisions
that different users commit and stores a history of a file in question. This is incredibly useful
in software development because it allows developers to roll back to a previous version of a file
with minimal effort when a mistake in code is discovered. Timestamps in git logs also allow
developers to prioritize bug fixes better, as they can identify how long a bug has been in a
piece of software.


* What is a branch and why would you use one?

A branch is a concept that branches (tee-hee!) off of version control. It allows separate simultaneous
copies of files. This is beneficial because it allows changes to code (let's say new features) to be
implemented in these branches without affecting the master copy. New code is likely to have bugs, so
it's a good idea to get it debugged first before adding it to the master copy. Branching enables this--
revisions can be merged into the master branch once developers are satisfied with the content and 
performance of the branch. It's also useful to note that version control (revision tracking) also
applies within branches.

* What is a commit? What makes a good commit message?

A commit is a save-point in git. Git doesn't automatically track revisions - it needs to be told
to do so by using the git commit command. The best commit message is a specific commit message!
Describe the change you're making to the file, so in the event you ever need to search through
the log to catch a mistake, you can find it.

* What is a merge conflict?

Git generally does a good job merging (combining) the revisions from one branch into another branch.
Sometimes, however, it gets confused and requires further input from the user to continue. There can
be many reasons for this -- different users modified the same file, a file was deleted in one branch,
among others. It's up to the developer then to use git's error message to determine the cause of the
merge conflict.