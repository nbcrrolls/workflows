Virtual Screening - 1.0

OVERVIEW: This workflow screens a list of small molecules against a list of protein receptors. Both inputs should be in pdb format. 

REQUIRED SOFTWARE: Kepler 2.4 or above
		   Kepler Trunk verison (OPTIONAL)
		   biokepler 1.0 or above
		   MGLTools 1.5.6

PARAMETERS: Parameter name (Parameter shorthand if running workflow using command prompt)
	Receptor Directory (rd) – This parameter requires the complete path to the directory which contains all the receptors of interest. Receptor directory should be separate from ligand directory. 
	Ligand Directory (ld) – This parameter requires the complete path to the directory which contains all the ligands of interest. Ligand directory should be separate from receptor directory.
	Output Directory (od) – This parameter requires the complete path to the directory where all the outputs from docking will be found and stored in.	Mgltools Directory (mgld) – This should be where the mgltools are installed. This should not be the complete path to where pythonsh file is located or where the prepare_receptor4.py or prepare_ligand4.py is. This should be the path before bin and MGLToolsPckgs are seperated. For example if the path to pythonsh is “/home/users/mgltools/bin/pythonsh”, the value for this parameter should be “/home/users/mgltoos/”
	center_x (center_x) – This defines the center (x-axis) of the grid box.  
	center_y (center_y) – This defines the center (y-axis) of the grid box.
	center_z (center_z) – This defines the center (z-axis) of the grid box.
	size_x (size_x) – This parameter specifies the length of the grid box extended from the x-axis center
	size_y (size_y) – This parameter specifies the length of the grid box extended from the y-axis center
	size_z (size_z) – This parameter specifies the length of the grid box extended from the z-axis center.

USAGE: There are two ways to run this workflow. One is through the graphic interface. After the workflow is opened, users can double click the parameters to change their values and press the play button to start. Another way is to run Kepler through command lines. 

CAUTION: This workflow is built with an opal actor that is not released in Kepler 2.4. It will be released in the later Kepler version. For users who want to use it and have Kepler 2.4 and biokepler 1.0 installed in their computers, they can follow the following instruction (http://www.biokepler.org/biokepler-svn) to switch to Trunk and use the newest version of the opal actor. For users who are not planning to use the NBCR opal server, Kepler 2.4 is sufficient to run the workflow. 