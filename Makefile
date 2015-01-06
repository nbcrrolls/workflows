# Makefile for creating workflows html distribution. 
# Target html: creates html files for workflows and actors
#              from present workflwos and actors raw files
#              the results are in workflows/
#              to view/debug simply open worflows/index.html
#              in your browser
#
# Target distro: creates tar file workflows.tar.gz of all html and supported js libraries
#                The file is untarred on NBCR web server in /var/www/html

# directory name  for html distro
NAME = workflows

# directory with supporting js and css code
LIB  = lib

html:
	@echo "Creating workflow/ structure and html files"
	bin/makeHTML
	cp -p -r $(LIB) $(NAME)

distro:	html
	tar czvf $(NAME).tar.gz  $(NAME)
	@echo
	@echo "Created distro $(NAME).tar.gz"
	@echo "Untar $(NAME).tar.gz on webserver in /var/www/html"

clean:
	rm -rf $(NAME) $(NAME).tar.gz
