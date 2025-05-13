# Launch conda/GCTA
source $(conda info --base)/etc/profile.d/conda.sh 
conda activate ldsc

#1. Create sumstat files. 
########################################################################################################################################
#2. Munge 
#A1. bhv
munge_sumstats.py --sumstats SPARKSUMSTAT2/LDSCbhv --out SPARKSUMSTAT2/MUNGEbhv --merge-alleles w_hm3.snplist --chunksize 500000
#A2. cth
munge_sumstats.py --sumstats SPARKSUMSTAT2/LDSCcth --out SPARKSUMSTAT2/MUNGEcth --merge-alleles w_hm3.snplist --chunksize 500000
#A3. krp
munge_sumstats.py --sumstats SPARKSUMSTAT2/LDSCkrp --out SPARKSUMSTAT2/MUNGEkrp --merge-alleles w_hm3.snplist --chunksize 500000

#B1. LDSCadhd to MUNGE
munge_sumstats.py --sumstats SPARKSUMSTAT2/LDSCadhd --out SPARKSUMSTAT2/MUNGEadhd --merge-alleles w_hm3.snplist --chunksize 500000
#B2. LDSCanx to MUNGE
munge_sumstats.py --sumstats SPARKSUMSTAT2/LDSCanx --out SPARKSUMSTAT2/MUNGEanx --merge-alleles w_hm3.snplist --chunksize 500000
#B3. LDSCbipd to MUNGE
munge_sumstats.py --sumstats SPARKSUMSTAT2/LDSCbipd --out SPARKSUMSTAT2/MUNGEbipd --merge-alleles w_hm3.snplist --chunksize 500000
#B4. LDSCdep to MUNGE
munge_sumstats.py --sumstats SPARKSUMSTAT2/LDSCdep --out SPARKSUMSTAT2/MUNGEdep --merge-alleles w_hm3.snplist --chunksize 500000
#B5. LDSCodcd to MUNGE
munge_sumstats.py --sumstats SPARKSUMSTAT2/LDSCdbd --out SPARKSUMSTAT2/MUNGEdbd --merge-alleles w_hm3.snplist --chunksize 500000
#B6. LDSCscz to MUNGE
munge_sumstats.py --sumstats SPARKSUMSTAT2/LDSCscz --out SPARKSUMSTAT2/MUNGEscz --merge-alleles w_hm3.snplist --chunksize 500000

#C1. LDSCiDBD to MUNGE  
#munge_sumstats.py --sumstats SPARKSUMSTAT2/LDSCiDBD --out SPARKSUMSTAT2/MUNGEiDBD --merge-alleles w_hm3.snplist --chunksize 500000
munge_sumstats.py --sumstats SPARKSUMSTAT2/LDSCiDBD --out SPARKSUMSTAT2/MUNGEiDBD --merge-alleles w_hm3.snplist --a1-inc --chunksize 500000
#C2. LDSCiADHD to MUNGE
munge_sumstats.py --sumstats SPARKSUMSTAT2/LDSCiADHD --out SPARKSUMSTAT2/MUNGEiADHD --merge-alleles w_hm3.snplist --a1-inc --chunksize 500000

###########################################################################################################################################
#3. Genetic Correlation (this also gives h2snp, which you can convert to liability scale with prevalence)
# A1. bhv-cth
ldsc.py --rg SPARKSUMSTAT2/MUNGEbhv.sumstats.gz,SPARKSUMSTAT2/MUNGEcth.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/bhv_cth 
# A2. bhv-krp
ldsc.py --rg SPARKSUMSTAT2/MUNGEbhv.sumstats.gz,SPARKSUMSTAT2/MUNGEkrp.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/bhv_krp
# A3. cth-krp
ldsc.py --rg SPARKSUMSTAT2/MUNGEcth.sumstats.gz,SPARKSUMSTAT2/MUNGEkrp.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/cth_krp

# CHECK: PREVALENCE NOT REQUIRED FOR RG. 
# B1. anxscz
ldsc.py --rg SPARKSUMSTAT2/MUNGEanx.sumstats.gz,SPARKSUMSTAT2/MUNGEscz.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/anx_scz
# B2. anxbpd
ldsc.py --rg SPARKSUMSTAT2/MUNGEanx.sumstats.gz,SPARKSUMSTAT2/MUNGEbipd.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/anx_bipd
# B3. anxdep
ldsc.py --rg SPARKSUMSTAT2/MUNGEanx.sumstats.gz,SPARKSUMSTAT2/MUNGEdep.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/anx_dep
# B4. anxadhd
ldsc.py --rg SPARKSUMSTAT2/MUNGEanx.sumstats.gz,SPARKSUMSTAT2/MUNGEadhd.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/anx_adhd
# B5. anxodcd
ldsc.py --rg SPARKSUMSTAT2/MUNGEanx.sumstats.gz,SPARKSUMSTAT2/MUNGEdbd.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/anx_dbd
# B6. sczbpd
ldsc.py --rg SPARKSUMSTAT2/MUNGEscz.sumstats.gz,SPARKSUMSTAT2/MUNGEbipd.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/scz_bipd
# B7. sczdep
ldsc.py --rg SPARKSUMSTAT2/MUNGEscz.sumstats.gz,SPARKSUMSTAT2/MUNGEdep.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/scz_dep
# B8. sczadhd
ldsc.py --rg SPARKSUMSTAT2/MUNGEscz.sumstats.gz,SPARKSUMSTAT2/MUNGEadhd.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/scz_adhd
# B9. sczodcd
ldsc.py --rg SPARKSUMSTAT2/MUNGEscz.sumstats.gz,SPARKSUMSTAT2/MUNGEdbd.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/scz_dbd
# B10. bpdep
ldsc.py --rg SPARKSUMSTAT2/MUNGEbipd.sumstats.gz,SPARKSUMSTAT2/MUNGEdep.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/bipd_dep
# B11. bpdadhd
ldsc.py --rg SPARKSUMSTAT2/MUNGEbipd.sumstats.gz,SPARKSUMSTAT2/MUNGEadhd.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/bipd_adhd
# B12. bpdodcd
ldsc.py --rg SPARKSUMSTAT2/MUNGEbipd.sumstats.gz,SPARKSUMSTAT2/MUNGEdbd.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/bipd_dbd
# B13. depadhd
ldsc.py --rg SPARKSUMSTAT2/MUNGEdep.sumstats.gz,SPARKSUMSTAT2/MUNGEadhd.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/dep_adhd
# B14. depodcd
ldsc.py --rg SPARKSUMSTAT2/MUNGEdep.sumstats.gz,SPARKSUMSTAT2/MUNGEdbd.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/dep_dbd
# B15 adhdxodcd
ldsc.py --rg SPARKSUMSTAT2/MUNGEadhd.sumstats.gz,SPARKSUMSTAT2/MUNGEdbd.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/adhd_dbd 

#C2. MUNGEdbd and MUNGEiDBD
ldsc.py --rg SPARKSUMSTAT2/MUNGEdbd.sumstats.gz,SPARKSUMSTAT2/MUNGEiDBD.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/dbd_idbd 
#C3. MUNGEadhd and MUNGEiADHD
ldsc.py --rg SPARKSUMSTAT2/MUNGEadhd.sumstats.gz,SPARKSUMSTAT2/MUNGEiADHD.sumstats.gz --ref-ld-chr eur_w_ld_chr/ --w-ld-chr eur_w_ld_chr/ --out SPARKSUMSTAT2/adhd_iadhd 

#####################################################################################################################################




 