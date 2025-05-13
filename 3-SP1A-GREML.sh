# Launch conda/GCTA
source $(conda info --base)/etc/profile.d/conda.sh 
conda activate ENV
# gcta 

#First, the factors
#Script 1: h2SNP
# bhv 
gcta64 --reml --grm-bin alpha_omega_hg19_autismonly_chr --pheno bhv.txt --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out bhv --thread-num 10
# cth 
gcta64 --reml --grm-bin alpha_omega_hg19_autismonly_chr --pheno cth.txt --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out cth --thread-num 10
# krp 
gcta64 --reml --grm-bin alpha_omega_hg19_autismonly_chr --pheno krp.txt --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out krp --thread-num 10

# bhv-robust
gcta64 --reml --grm-bin alpha_omega_hg19_autismonly_chr --pheno bhv-rbst.txt --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out bhv-rbst --thread-num 10
# cth-robust 
gcta64 --reml --grm-bin alpha_omega_hg19_autismonly_chr --pheno cth-rbst.txt --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out cth-rbst --thread-num 10
# krp-robust 
gcta64 --reml --grm-bin alpha_omega_hg19_autismonly_chr --pheno krp-rbst.txt --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out krp-rbst --thread-num 10

#Script 2: rG
# bhv-cth 
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno bhv-cth.txt --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out bhv-cth --thread-num 10
# bhv-krp 
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno bhv-krp.txt --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out bhv-krp --thread-num 10
# cth-krp 
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno cth-krp.txt --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out cth-krp --thread-num 10

#And then individual phenotypes
#h2SNP

#rG
# B1. anxscz
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno anxscz_cc.phen --reml-bivar-prevalence 0.2 0.04 --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out GREML3/anxscz3 --thread-num 10
# B2. anxbpd
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno anxbpd_cc.phen --reml-bivar-prevalence 0.2 0.05 --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out GREML3/anxbpd3 --thread-num 10
# B3. anxdep
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno anxdep_cc.phen --reml-bivar-prevalence 0.2 0.11 --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out GREML3/anxdep3 --thread-num 10
# B4. anxadhd
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno anxadhd_cc.phen --reml-bivar-prevalence 0.2 0.28 --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out GREML3/anxadhd3 --thread-num 10
# B5. anxodcd
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno anxodcd_cc.phen --reml-bivar-prevalence 0.2 0.12 --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out GREML3/anxodcd3 --thread-num 10
# B6. sczbpd
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno sczbpd_cc.phen --reml-bivar-prevalence 0.04 0.05 --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out GREML3/sczbpd3 --thread-num 10
# B7. sczdep
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno sczdep_cc.phen --reml-bivar-prevalence 0.04 0.11 --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out GREML3/sczdep3 --thread-num 10
# B8. sczadhd
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno sczadhd_cc.phen --reml-bivar-prevalence 0.04 0.28 --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out GREML3/sczadhd3 --thread-num 10
# B9. sczodcd
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno sczodcd_cc.phen --reml-bivar-prevalence 0.04 0.12 --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out GREML3/sczodcd3 --thread-num 10
# B10. bpdep
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno bpdep_cc.phen --reml-bivar-prevalence 0.05 0.11 --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out GREML3/bpdep3 --thread-num 10
# B11. bpdadhd
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno bpdadhd_cc.phen --reml-bivar-prevalence 0.05 0.28 --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out GREML3/bpdadhd3 --thread-num 10
# B12. bpdodcd
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno bpdodcd_cc.phen --reml-bivar-prevalence 0.05 0.12 --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out GREML3/bpdodcd3 --thread-num 10
# B13. depadhd
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno depadhd_cc.phen --reml-bivar-prevalence 0.11 0.28 --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out GREML3/depadhd3 --thread-num 10
# B14. depodcd
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno depodcd_cc.phen --reml-bivar-prevalence 0.11 0.12 --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out GREML3/depodcd3 --thread-num 10
# B15 adhdxodcd
gcta64 --grm-bin alpha_omega_hg19_autismonly_chr --pheno adhdxodcd_cc.phen --reml-bivar-prevalence 0.28 0.12 --reml-bivar 1 2 --covar SPARK.covar --qcovar SPARKvpc.qcovar --grm-cutoff 0.05 --out GREML3/adhdxodcd3 --thread-num 10
