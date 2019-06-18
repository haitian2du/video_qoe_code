#!/bin/bash -l
## Nazwa zlecenia
#SBATCH -J test_job
## Liczba alokowanych węzłów
#SBATCH -N 1
## Liczba zadań per węzeł (domyślnie jest to liczba alokowanych rdzeni na węźle)
#SBATCH --ntasks-per-node=1
## Ilość pamięci przypadającej na jeden rdzeń obliczeniowy (domyślnie 5GB na rdzeń)
## SBATCH --mem-per-cpu=1GB
## Maksymalny czas trwania zlecenia (format HH:MM:SS)
#SBATCH --time=01:00:00
## Nazwa grantu do rozliczenia zużycia zasobów
#SBATCH -A videoqoe2
## Specyfikacja partycji
#SBATCH -p plgrid-testing
## Plik ze standardowym wyjściem
#SBATCH --output="test_output.out"
## Plik ze standardowym wyjściem błędów
#SBATCH --error="test_error.err"
 
 
## przejscie do katalogu z ktorego wywolany zostal sbatch
cd $SLURM_SUBMIT_DIR

cd $PLG_GROUPS_STORAGE/plggvideo/vmaf
srun /run_testing VMAF resource/example/example_dataset.py  --cache-result --parallelize 
