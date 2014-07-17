MatlabStatistic - 1.0

OVERVIEW: This workflow analysis docking results and determine which set of receptors can best distinguish binders from non-binders. For more information about this actor/workflow, please refer back to “Progress towards automated Kepler scientific workflows for computer-aided drug discovery and molecular simulations” section 3.7

REQUIRED SOFTWARE: Kepler 2.4 or above
		   MATLAB R2013b or above
   		   MATLAB Parallelizing license (OPTIONAL)

PARAMETERS: Parameter name (Parameter shorthand if running workflow using command prompt)
	    directory (d) - This is the directory where the input CSV file should be located and output files will be saved. The two CSV files should be in this user specific directory. 
	    Number of Receptor (n) - User specifies the number of ensemble receptor structures. For example, if user wants the best two ensemble receptor structures out of the eight structures they used for virtual screening, they will specify 2 for this parameter. 
            high (high) - this is the name for the CSV file that contains 999999 to represent non-binding events.
            zero (zero) - this is the name for the CSV file that contains 0 to represent non-binding events. 

USAGE: There are two ways to run this workflow. One is through the graphic interface. After the workflow is opened, users can double click the parameters to change their values and press the play button to start. Another way is to run Kepler through command lines.

NOTES: The CSV files can be created with the help of SCHRODINGER GLIDE docking program. The first column should be the ligand ID and second column will should be 1 or 0 for each ligand. 1 represent binders and 0 are for non-binders. The output log file will inform user which set of ensembles can best distinguish binders from non-binders. 

CAUTION: This workflow is very memory intensive. It may take up all the RAM memory a user has on their computer. MATLAB Parallelizing license is optional. If a user does not have the MATLAB Parallelizing license, the workflow is defaulted to run in serial. However, there will be a huge speed up if matlab can split the calculation and run them simultaneously.