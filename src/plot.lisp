;;; -*- Mode: LISP; Base: 10; Syntax: ANSI-Common-lisp; Package: P:ROJECT -*-

;;; Plot data

;;; Let's plot the results of our analysis

;;; Again, we've commented this out because we want the file to be
;;; loaded from the system definition, but not executed.

;;; In one typical workflow, you'd define the plots to run as a separate system, e.g. project/plots in batch mode that would dump them to a directory. 

 (vega:defplot natural-disaster-deaths
   `(:title "Deaths from global natural disasters"
     :width 600
     :height 400
     :data ,(filter-rows disasters '(not (string= entity "All natural disasters")))
     :mark (:type :circle
	    :opacity 0.8
	    :stroke :black
	    :stroke-width 1)
     :encoding (:x (:field :year
		    :type :temporal
		    :axis (:grid :false))
		:y (:field :entity
		    :type :nominal
		    :axis (:title ""))
		:size (:field :deaths
		       :type :quantitative
		       :title "Annual Global Deaths"
		       :legend (:clip-height 30)
		       :scale (:range-max 5000))
		:color (:field :entity
			:type :nominal
			:legend nil))))

;;; If you wanted to view this plot, you could do so with (plot:plot natural-disasters-deaths)
