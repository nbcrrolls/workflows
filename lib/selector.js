        $(function(){
            var items = [];
            var $container = $('#container');
            filters = {};

            $container.isotope({
                itemSelector: '.item',
            });

            var $optionSets = $('#options .option-set'),
            $optionLinks = $optionSets.find('a');

            $optionLinks.click(function() {
                var $this = $(this);
                
                if ( $this.hasClass('selected') ) {
                    $this.removeClass('selected');
                } else {
                    $this.addClass('selected');
                }

                var $optionSet = $this.parents('.option-set');
                

                // store filter value in object
                var group = $optionSet.attr('data-filter-group');
                var x = [];
                var optionSetSelected = $optionSet.find('.selected');
                for ( i = 0; i < optionSetSelected.length; i++) {
                    var tmp = $(optionSetSelected[i]).attr('data-filter-value');
                    x.push(tmp);
                }
                filters[ group ] = x.join(', ');

                // convert object into array
                var isoFilters = [];
                for ( var prop in filters ) {
                    if(filters[prop].length > 0) {
                        isoFilters.push( filters[ prop ] )
                    }
                }
                var selector = isoFilters.join(', ');
                $container.isotope({ filter: selector });

                return false;
            });

            // stick items into array declared above as a series of objects
            // we could include more than just the name in here, to build up a bigger search 'index'
            /*
            $('span.workflow-name').each(function(){
                    var tmp = {};
                    tmp.id = $(this).parent().parent().attr('id');
                    tmp.name = ($(this).text().toLowerCase());
                    items.push( tmp );
            });
            */
                
            // User types in search box - call our search function and supply lower-case keyword as argument
            /*
            $('#search').bind('keyup', function() {
                    isotopeSearch( $(this).val().toLowerCase() );
            });
            */
       
            /**
             * Function takes single keyword as argument,
             * checks array of item objects and looks for substring matches between item.name and keyword,
             * if matches are found calls isotope.filter() function on our collection.
             */
             /*
             function isotopeSearch(kwd)
             {
                 // reset results arrays
                 var matches = [];
                 var misses = [];

                 $('.item').removeClass('match miss'); // get rid of any existing classes
                 $('#noMatches').hide(); // ensure this is always hidden when we start a new query

                 if ( (kwd != '') && (kwd.length >= 2) ) { // min 2 chars to execute query:
        
                     // loop through items array     
                     items.forEach(function(item){
                         if ( item.name.indexOf(kwd) !== -1 ) { // keyword matches element
                             matches.push( $('#'+item.id)[0] );
                         } else {
                             misses.push( $('#'+item.id)[0] );
                         }
                     });
        
                     // add appropriate classes and call isotope.filter
                     $(matches).addClass('match');
                     $(misses).addClass('miss');
                     $container.isotope({ filter: $(matches) }); // isotope.filter will take a jQuery object instead of a class name as an argument - sweet!
        
                     if (matches.length == 0) {
                         $('#noMatches').show(); // deal with empty results set
                     }
        
                 } else {
                     // show all if keyword less than 2 chars
                     $container.isotope({ filter: '.item' });
                 }
            } 
            */
        });
