 use "C:\Users\obine\Downloads\NGA_2010_GHSP-W1_v03_M_STATA\Post Planting Wave 1\Agriculture\sect11d_plantingw1.dta", clear

*****Quantity of Commercially Priced Fertilizer******


ren s11dq15 qtyfert1
ren s11dq26 qtyfert2

egen totalqty = rowtotal(qtyfert*)
label var totalqty "Total quantity of fertilizer purchased"

ren s11dq9a agencyfree
ren s11dq11 freetransmode


*****Quantity of Free & Left-Over Fertilizer******

ren s11dq4 leftfert
ren s11dq8 freefert


egen totalfree = rowtotal(leftfert freefert)
label var totalfree "Total quantity of free and left-over fertilizer"

******Total Value of fertilizer Purchased*******

ren s11dq18 valfert1
ren s11dq29 valfert2

egen totalval = rowtotal(valfert*)
label var totalval "Total value of purchased fertilizer"


******Price of Commercial Fertilizer******

gen pricefert = totalval/totalqty
label var pricefert "Price of commercial fertilizer"


******Total Transportation Fee******

ren s11dq16 trans1
ren s11dq27 trans2
ren s11dq17 transmode1
ren s11dq28 transmode2

ren s11dq13 agency1
ren s11dq24 agency2

egen totaltrans = rowtotal(trans*)
label var totaltrans "Total cost of transportation"


keep zone state lga sector hhid ea plotid leftfert freefert agencyfree freetransmode s11dq11 qtyfert1 trans1 transmode1 valfert1 agency1 agency2 qtyfert2 trans2 transmode2 valfert2 totalqty totalfree totalval pricefert totaltrans


 
save "C:\Users\obine\OneDrive\Documents\Zoom\fertilizer_dataset.dta", replace

















