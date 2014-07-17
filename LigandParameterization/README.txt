LigandParameterizationSerial Workflow - 1.0

OVERVIEW: This workflow parameterizes one ligand in a serial fashion. Output are ligand parameters written in Amber formats.

REQUIRED SOFTWARE: AmberTools12 or above
		    Gaussian09
		    Kepler 2.4 or above

PARAMETERS: c – overall charge of the small ligand. Default is 0 which means the small molecule is neutral.
	    l – Ligand name
            d – Directory where the small molecule pdb is located and where all the sequential jobs will be executed.

USAGE: There are two ways to run this workflow. One is through the graphic interface. After the workflow is opened, users can double click the parameters to change their values and press the play button to start. Another way is to run Kepler through command lines. 

CAUTION: It is highly recommended that users check the source codes under String Constant before running the workflow to ensure that the commands to execute tleap are suitable for user’s systems.
