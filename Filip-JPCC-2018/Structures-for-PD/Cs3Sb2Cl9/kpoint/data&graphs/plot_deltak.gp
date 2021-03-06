set terminal postscript eps enhanced color font 'Verdana,20'
set output "Cs3Sb2Cl9_kp_deltak.eps"
unset key

set grid ytics lc rgb "#bbbbbb" lw 1 lt 0
set grid xtics lc rgb "#bbbbbb" lw 1 lt 0

set xrange [0:0.3]
set yrange [-5:5]
set title "Cs3Sb2Cl9 kpoint"
set xlabel "Delta K(A^-^1)"
set ylabel "Energy Difference/atom(meV)"
f(x)= 3
g(x)= -3

plot "Cs3Sb2Cl9_kp.txt" u (1/$1):(($2+811.74434853)*13.605698066*1000/14) w lp lw 2 pt 2,f(x) lt 2 lc rgb "blue" lw 3, g(x) lt 2 lc rgb "blue" lw 3

