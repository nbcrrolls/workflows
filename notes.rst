.. highlight:: rest
.. contents::

Detatch subdirectory into a new repo 
-------------------------------------

This repo was created from the documentation/workflows 
This process requires git v >=1.7.11

#. Prepare old repo

     cd nbcrrolls/documentation
     git status
     git push
     git subtree split -P workflows -b workflows-only

#. Create new repo locally
     cd ..
     mkdir workflows
     cd workflows
     git init
     git pull ../documentation workflows-only

#. Link new repo to Github

     git remote add origin https://github.com/nbcrrolls/workflows.git
     git push -u origin master
