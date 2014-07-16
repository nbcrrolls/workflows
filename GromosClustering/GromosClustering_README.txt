GromosClustering Workflow - 1.0

OVERVIEW: This workflow composes of five main components. 
The first component takes all the trajectories that need to be cluster and compiles them into one big trajectory file. The trajectories of interest must all be in the same folder.
The second component uses the long trajectory generated from the first component and converts it to pdb. Pdb files are the input for gromos clustering. The trajectories will be aligned based on user input.
The third component modifies the pdb files. It deletes the first line of each frame (non-atom information) and changes the ending of each frame from END to ENDMDL. All these modifications are required to prepare gromos clustering input. 
The forth component generates another pdb file for clustering. It creates a pdb file contains all the atom that clustering will be based on. For example, if users want to cluster all the trajectories based on the alpha helix near the protein active site, this component will write a pdb file consists only the alpha helix.
The fifth component is when clustering actually occurs. First, the pdb input files generated from previous steps are zipped as required by the NBCR gromos clustering web server. Then, the zipped files are sent to the server where clustering happens. After clustering is done, outputs are transferred back to local machine. Two files are downloaded: log file which contains clustering information and a tar.gz file which holds all outputs generated from the NBCR gromos clustering web server.

USAGE: There are two ways to run this workflow. One is through the graphic interface. After the workflow is opened, users can double click the parameters to change their values and press the play button to start. Another way is to run Kepler through command lines. It is recommended to run the clustering workflow from command line.
	/PATH/./kepler.sh -runkar -nogui -dd -dp -p -wd -cd -rd -ac -as -f -l -s -cf PATH_TO _KAR/kar_file
If use default values, a user does not need to include the corresponding flags when typing in command prompt.

REQUIRED SOFTWARE: Kepler 2.4 or above
                   AmberTools 12 or 13 (AmberTools 14 is currently under development)

PARAMETERS: dd - Trajectories directory. This should be the complete path to the trajectories directory. 
            dp - Trajectories pattern. Some acceptable variables are .*pdb$$ (all pdb files in the trajectories directory), .*nc$$ (all nc files), .*mdcrd$$ (all mdcrd files), .*dcd$$ (all dcd files), .+size.*$$ (all files that contains size in the middle), and Size.*$$ (all files that contains Size in the begining)
            p - location of the topology file. This should contain the complete path to the topology file. 
            wd - Path of the work directory. This is where all the intermediate files and output files are stored. 
            cd - Name of the trajectory file which will contain all of the input trajectories. Default name is _CLUSTER_CAT_ALL.mdcrd
            rd - residue id. When creating the input for gromos clustering, user can choose to keep only certain trajectory structures. For example, if a user wants to keep the protein and strip everything else in a trajectory, the user will need to specify the protein residue id that are intended to keep. This naming convention follows Amber mask convention. For example, if the protein in the trajectories are residue numbers 1 to 194, users will input :1-194. 
            as - Atom selection. This flag specifies which atoms or residues that clustering will be based on. Default value is all alpha carbons. This flag naming convention follows Amber mask convention. 
            f - first frame. Users can choose to have a set number of frames for gromos clustering. Default value is the first frame.
            l - last frame. Users can choose to have a set number of frames for gromos clustering. Default value is 999999999.
            s - stride. Users can choose to have a set number of frames for gromos clustering. Default value is 1, no stride. 2 will mean every other frame. 
            cf - cutoff. This is the RMSD cutoff for gromos clustering. A very small rmsd cutoff will cause the program to fail. 
            ac - True or False. If true, alignment will be done on alpha carbon. If false, alignment will be done on the atoms selected also for clustering. Default is False.

NOTES: This clustering workflow was built with Kepler actors. Amber tool – cpptraj – is required to run the workflow. Please make sure cpptraj is installed and the path to cpptraj is stored in bash file. Amber13 tools is licensed under GNU (General Public License) and is free to the general public. You can download cpptraj in the Amber website “http://ambermd.org/#AmberTools”. Gromos clustering is done on the NBCR (National Biomedical Computation Resource) web server. More available software provide by NBCR can be found in the following link “http://nbcr-222.ucsd.edu/opal2/dashboard?command=serviceList”. 
BENCHMARK:
# of frames	# of Atoms to cluster		Timescale
3000			194			8.2min
3000			2999			22.9min
