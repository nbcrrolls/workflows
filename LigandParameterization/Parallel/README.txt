LigandParameterizationParallel Workflow - 1.0

OVERVIEW: This workflow can parameterize multiple small molecules in parallel and outputs ligands parameters in Amber format.

REQUIRED SOFTWARE: AmberTools12 or above
		    Gaussian09
		    Kepler 2.4 or above

PARAMETERS: c – charge of the small molecules. All the small molecules have to have the same charges. Default is 0 which means all the small molecules are neutral.
	d – directory of the small molecule pdb files.
	p – pattern of the pdb files. Default is .*pdb$$ which means all the pdb files in the directory
	p2 – pattern of the pdb file to be replaced by empty string in order to obtain only the ligand name. Default is .pdb which means that LIGAND_NAME.pdb will turn into LIGAND_NAME
	n – the number of pdb that is going to parameterize in a single run. For example, if user has five small molecules in a single directory that need to parameterize, n will be set to five.

USAGE: There are two ways to run this workflow. One is through the graphic interface. After the workflow is opened, users can double click the parameters to change their values and press the play button to start. Another way is to run Kepler through command lines.

CAUTION:There are limitations of this workflow; so far, parallelization is only done on a local machine. Because gaussian09 quantum mechanic calculation requires one process for each small molecule, five small molecules will use five processor. User can only parallelize numbers of small molecules equal to or less than the number of computer processors. The parameter c that indicated charge applies to all small molecule. If user has five ligands and two out of five are negative 1 charged and other three are neutral, user should run them separately in two sub-directories. 