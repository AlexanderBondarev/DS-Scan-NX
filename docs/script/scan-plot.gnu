
#set terminal png size 900,600 enhanced font "Helvetica,14"
set terminal svg size 900,600 font "Helvetica,14"
set pal gray

set termoption dash
set xtics in scale 0.3
set ytics in scale 0.3
set dashtype 2 (6.0,2.0)
set dashtype 3 (2.0,2.0)

set linestyle 1 lt 1 lw 2.5 lc rgb "#000000" dashtype 1
set linestyle 2 lt 2 lw 2 lc rgb "#000000" dashtype 2
set linestyle 3 lt 3 lw 2 lc rgb "#000000" dashtype 3
set linestyle 4 lt 4 lw 2 lc rgb "#909090" dashtype 1
set linestyle 5 lt 5 lw 2 lc rgb "#909090" dashtype 2
set linestyle 6 lt 7 lw 2 lc rgb "#909090" dashtype 3
set linestyle 7 lt 1 lw 2 lc rgb "#909090" dashtype 1


#set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "TD spectr" 
set xlabel "d(C^{2}-H), Å" font "Helvetica-Bold,14"
set ylabel "E, kJ/mol" font "Helvetica-Bold,14"
set bars small
set xrange [8.9:1.3]


set output "scan.svg"
#set ylabel "E, kJ/mol" font "Helvetica-Bold,14"
unset key
unset label
plot "scan.csv" using 2:5 with lines linestyle 1
#plot "scan.csv" using 2:5 with lines linestyle 3 ti "E, kJ/mol"

set output "scan-eh.svg"
#set ylabel "E, eh" font "Helvetica-Bold,14"
plot "scan.csv" using 2:3 with lines linestyle 1
#plot "scan.csv" using 2:3 with lines linestyle 3 ti "E, eh"
quit
