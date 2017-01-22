capture log close
log using "king_assignment2.log", replace

// Assignment 2
// Robb King
// January 22. 2017

clear

capture

use mroz, clear

//Create macros for both the dependent and independent variables
local y hours

local y2 wage

local family faminc kidslt6 kidsge6

local husband hushrs husage huseduc huswage

local qualifications age educ motheduc fatheduc

//Create summary table for the dependent and indpendent variables
summarize `y' `family' `husband' `qualifications'

estpost summarize `y' `family' `husband' `qualifications'

eststo sumstat

esttab sumstat using summary_table.rtf, replace

//Run regressions for each macro with indpendent variables against the dependent variable "hours"
reg `y' `family'

reg `y' `husband'

reg `y' `qualifications' 

reg `y' `family' `husband' `qualifications'

//Run regression for each macro with independent variables against alternative dependent variable "wage"
reg `y2' `family'

reg `y2' `husband'

reg `y2' `qualifications' 

reg `y2' `family' `husband' `qualifications'

log close

exit

/* COMMENT: 
(This comment is based upon my understanding that every individual observed within the dataset
is a woman.) The regression results show that family characteristics and the labor force characteristics 
of a woman's husband can significantly impact the amount of hours worked and the money earned by a woman.
Women who have children are more likely to work less hours and make less money--especially if the child(ren) is 
less than six years of age. Hours worked and money made by women decreases with every additional hour worked by their husbands.
However, hours worked and money made by women increases with every additional unit of education.





