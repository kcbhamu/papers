#!/bin/tcsh
#$ -l qname=parallel.q
#$ -l h_rt=24:00:00
#$ -N cui4
#$ -o jobtest.out
#$ -e jobtest.err
#$ -cwd
#$ -pe orte 24
#$ -j y
#$ -R y
#$ -l h_vmem=2.875G
#$ -V



module purge
module load  fft/fftw-3.3.4_intel15
module load  mpi/openmpi-1.10.2_intel15
module load  intel/ics-2015-3-187



set MPIRUN = "/share/apps/mpi/openmpi-1.10.2/bin/mpirun --mca btl self,openib,sm,tcp"
set PW = /home/ted/codes/espresso-5.4.0/bin/pw.x
set NSLOTS = 24



foreach NLINE ( `seq 1 15` )
cp cui4-scf.in cui4-scf-${NLINE}.in
head -${NLINE} cui41_kp.txt | tail -1 >> cui4-scf-${NLINE}.in
$MPIRUN -np $NSLOTS $PW < cui4-scf-${NLINE}.in > cui4-scf-${NLINE}.out
end
