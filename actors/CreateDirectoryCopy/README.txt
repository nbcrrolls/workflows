CreateDirectoryCopy Workflow - 1.0

OVERVIEW: The workflow is created for data sorting. 

USAGE: There are two ways to run this workflow. One is through the graphic interface. After the workflow is opened, users can double click the parameters to change their values and press the play button to start. Another way is to run Kepler through command lines.

REQUIRED SOFTWARE: Kepler2.4 or above

PARAMETERS:  d – directories where the pdb files are located and where the new directories will be created.
	        p – pattern that the workflow will use to identify all the pdb files. Default is .*pdb$$. It can also be changed to .*mae$$ or .*sdf$$ if .mae extension or .sdf extension are provided instead of .pdb extension.
	        p2 – pattern that will be replaced by an empty string. As a result, only the names of the pdb files are retained for creating directories. Default is .pdb. It can also be changed to .*mae$$ or .*sdf$$ if .mae extension or .sdf extension are provided instead of .pdb extension. 