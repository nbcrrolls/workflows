.. highlight:: rest
.. contents::

Workflow documentation requirements
------------------------------------

#. **Required files**

   For hosting the workflow on NBCR website each workflow must have the following files: 
   
   + workflow PNG image 
   + workflow kar file 
   + text file "description" which contains a describing  of the workflow. 
     Please see a  a section describing the file format below and an example *description-template* file.
   + README file with any additional information about the workflow.
     If there are any extra files intended for download with the workflow  
     they must be listed in README. 
   + Optional: any extra files (documentation, examples, etc.) that will
     be distributed with the workflow. Must be listed in README. 

#. **File "description-template" format**

   This file consists of a description of a worflow as  key-value pairs.  Keywords are ordered one per line followed by 
   keyword values.  Values can have multiple lines. The following keywords are required:

   + **Name**  workflow name in upper camel case. No dashed or spaces.
   + **Version**  workflow version
   + **Class**  actor or workflow
   + **Kar**  kar file name
   + **Image** image file name
   + **Tag** a list of tags separated by spaces. A tag can be a software namew used in
     the workflow (for example, Amber) or a generic description of some part of
     the workflow (for example: trajectory, minimization, etc.)
   + **Type**  of a workflow. Valid values are Clustering, Docking, Electrostatic,
     MDsimulation, Utilities. More values will be added when more workflows
     are created.
   + **Director** a kepler director. Valid values: DDF, DDP, PN, SDF. Can be only one director.
   + **Actor** list of actors used in the workflow (names separated bhy spaces). Default value is none
   + **Purpose**  short description of what this workflow does.
   + **Required software** description of the prerequisite software. Can be 1 or more
     lines, one software item per line. If no software is required the value is none.
   + **Parameters** description of worflow parameters, one parameter per paragraph.
     Each description starts with a parameter short name followed by
     the explanation text of wht this parameter does. Note text alignment.
   + **Overview** any addition information about the workflow specifics. Default value is none
   + **Usage** a short description of how to use the workflow

   See an example *description-template* file.


#. **Versioning convention**

   Each workflow must have a unique version number which is a sequence-based identifier
   in the form of **major.minor[.revision]**:

   + **major** number is increased when there are significant jumps in functionality
   + **minor** number is incremented when only minor features or significant fixes have been added 
   + **revision** number is incremented when minor bugs are fixed. 

#. **Naming convention**

   Each workflow name includes a text written as upper **CamelCase** followed
   by a **_** and a version.  For example: LigandSimulation_1.2.3. 
   

#. **Example**

   The workflow for ligand simulation will have the following files:

   + LigandSimulation_1.2.3.kar
   + LigandSimulation_1.2.3.png
   + description
   + README
   + LigandSimulation_1.2.3.notes (optional file)


Workflow distribution requirements
------------------------------------

Workflows are distributed as tar.gz files which must contain : 

+ workflow kar file 
+ README file
+ any optional files (extra documentation or examples) 

Naming convention: WorkflowName_1.2.tar.gz 

File "workflow-list" 
------------------------

This file keeps track of the names for workflows, actors, types and tags.
Please ocnsult this file when creating new workflows and update accordingly
when creating new workflows.

Adding a new workflow
------------------------

+ create a directory either in workflows/ or actors/ 
+ in the *workflow-list*

   - add workflow name 
   - add new tags or types (if any) 
