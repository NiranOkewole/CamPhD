source $(conda info --base)/etc/profile.d/conda.sh 
conda activate ENV

# Pheno
python PRScs.py --ref_dir=/home/SPARKPRSCS/ldblk_1kg_eur --bim_prefix=/home/SPARKPRSCS/alpha_omega_hg19_allchrs --sst_file=/home/SPARKPRSCS/sumstats_pheno_PRSCS --n_gwas=10000 --out_dir=./PRSCSpheno  --phi=1e-2 

# Generate scores 
plink

plink --bfile alpha_omega_hg19_allchrs --score ./PRSCSpheno_final.txt 2 4 6 center --out ./scorepheno 

#Similar for other phenos. 




