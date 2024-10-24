#!/bin/bash
#SBATCH -c 1                   # cores
#SBATCH -t 0-02:00             # Runtime of 6hr, in D-HH:MM format
#SBATCH -p short               # Run in short partition (0-12hrs)
#SBATCH --mem=8G			   # total requested memory split between cores
#SBATCH -o hostname_%j.out         # File to which STDOUT + STDERR will be written, including job ID in filename

#######################################################################################

# Samples S07 and S08 are DNA. S10 and S11 are RNA.

# TRIM OFF ALL BUT THE BARCODES
# Trim off all but the first 34 bp of each read, and then trim off the first 20bp of each read, 
# leaving 14bp centered on a 10bp barcode. Name the trimmed fastq files Crop34HCrop20_XXX.fastq.gz

module load trimmomatic/0.36
java -jar $TRIMMOMATIC/trimmomatic-0.36.jar -threads 4 SE LIB040097_GEN00149940_S07_L1-4_R1.fastq.gz Crop34HCrop20_LIB040097_GEN00149940_S07_L1-4_R1.fastq.gz CROP:34 HEADCROP:20
java -jar $TRIMMOMATIC/trimmomatic-0.36.jar -threads 4 SE LIB040097_GEN00149941_S08_L1-4_R1.fastq.gz Crop34HCrop20_LIB040097_GEN00149941_S08_L1-4_R1.fastq.gz CROP:34 HEADCROP:20
java -jar $TRIMMOMATIC/trimmomatic-0.36.jar -threads 4 SE LIB040097_GEN00149943_S10_L1-4_R1.fastq.gz Crop34HCrop20_LIB040097_GEN00149943_S10_L1-4_R1.fastq.gz CROP:34 HEADCROP:20
java -jar $TRIMMOMATIC/trimmomatic-0.36.jar -threads 4 SE LIB040097_GEN00149944_S11_L1-4_R1.fastq.gz Crop34HCrop20_LIB040097_GEN00149944_S11_L1-4_R1.fastq.gz CROP:34 HEADCROP:20


# UNZIP THE .gz FILES

gunzip Crop34HCrop20_LIB040097_GEN00149940_S07_L1-4_R1.fastq.gz 
gunzip Crop34HCrop20_LIB040097_GEN00149941_S08_L1-4_R1.fastq.gz 
gunzip Crop34HCrop20_LIB040097_GEN00149943_S10_L1-4_R1.fastq.gz 
gunzip Crop34HCrop20_LIB040097_GEN00149944_S11_L1-4_R1.fastq.gz 


# COUNT THE BARCODES FOR EACH FASTQ FILE
# outputs the enhancer/promoter ID and barcode plus the number of times the barcode appeared in the 
# fastq file (the number of lines the barcode sequence occurs in) to a text file (xxx_readcounts.txt).

echo "counting barcodes..."
for j in *.fastq; do
	i=${j%.fastq}
	paste <(echo "01_0400-CAGCTTTTGG") <(grep -c 'CAGCTTTTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "02_0400-TGCAGGTTCG") <(grep -c 'TGCAGGTTCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "03_0400-GTGGAGTACT") <(grep -c 'GTGGAGTACT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "04_0400-TTTCCGCCGG") <(grep -c 'TTTCCGCCGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "05_0400-TGGCCGCTGA") <(grep -c 'TGGCCGCTGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "06_0400-CTACAGACTC") <(grep -c 'CTACAGACTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "07_0400-GTGTACGTTC") <(grep -c 'GTGTACGTTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "08_0400-ACCAACTTGG") <(grep -c 'ACCAACTTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "09_0400-TCAAGGTTTG") <(grep -c 'TCAAGGTTTG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "10_0400-ATCCGCACCA") <(grep -c 'ATCCGCACCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "11_0400-CTAGTTAGGA") <(grep -c 'CTAGTTAGGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "12_0400-GATGGGTGAA") <(grep -c 'GATGGGTGAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "13_0400-AAAGATGGAC") <(grep -c 'AAAGATGGAC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "14_0400-GTTAGTAACG") <(grep -c 'GTTAGTAACG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "15_0400-CTGGGTAGTC") <(grep -c 'CTGGGTAGTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "16_0400-GGGGAGATCT") <(grep -c 'GGGGAGATCT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "17_0400-TACTCTTAAA") <(grep -c 'TACTCTTAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "18_0400-AGGGTTGTCA") <(grep -c 'AGGGTTGTCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "19_0400-GGTTGAACGA") <(grep -c 'GGTTGAACGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "20_0400-TCAAGCATGA") <(grep -c 'TCAAGCATGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "21_0400-CACACGTCAA") <(grep -c 'CACACGTCAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "22_0400-AATCTTACTT") <(grep -c 'AATCTTACTT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "23_0400-CAAGACCCAC") <(grep -c 'CAAGACCCAC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "24_0400-GCATAAAAAA") <(grep -c 'GCATAAAAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "25_0400-TAACATCGAG") <(grep -c 'TAACATCGAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "26_0400-TCGCAAAGGG") <(grep -c 'TCGCAAAGGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "27_0400-GCGAATGATC") <(grep -c 'GCGAATGATC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "28_0400-CGCCAATGCA") <(grep -c 'CGCCAATGCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "29_0400-TCACGTCCTA") <(grep -c 'TCACGTCCTA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "30_0400-GCAGGTCTGG") <(grep -c 'GCAGGTCTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "31_0400-TAGCCCCCGT") <(grep -c 'TAGCCCCCGT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "32_0400-TTTCCTCAAA") <(grep -c 'TTTCCTCAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "33_0400-GAGCTCCCAG") <(grep -c 'GAGCTCCCAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "34_0400-GAACCCTTAA") <(grep -c 'GAACCCTTAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "35_0400-TGACCAAATT") <(grep -c 'TGACCAAATT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "36_0400-TACTTGAAGT") <(grep -c 'TACTTGAAGT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "37_0400-ATGCGTTGAA") <(grep -c 'ATGCGTTGAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "38_0400-AGCCGTGCCG") <(grep -c 'AGCCGTGCCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "39_0400-TACATTACCA") <(grep -c 'TACATTACCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "40_0400-ATCGTGTTAT") <(grep -c 'ATCGTGTTAT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "41_0400-AACATCTACC") <(grep -c 'AACATCTACC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "42_0400-AGTGAATAGC") <(grep -c 'AGTGAATAGC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "43_0400-CGGACAGTCG") <(grep -c 'CGGACAGTCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "44_0400-CAGGAGAATG") <(grep -c 'CAGGAGAATG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "45_0400-AAGTTATGCT") <(grep -c 'AAGTTATGCT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "46_0400-TGGGTTCTAG") <(grep -c 'TGGGTTCTAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "47_0400-TGGCAACTCA") <(grep -c 'TGGCAACTCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "48_0400-TCTTACAGCG") <(grep -c 'TCTTACAGCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "49_0400-GGGGCACGCG") <(grep -c 'GGGGCACGCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "50_0400-GGAGTATAAA") <(grep -c 'GGAGTATAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "ES1_0400-GTGGTATGTG") <(grep -c 'GTGGTATGTG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "ES2_0400-GTTCTTCTGC") <(grep -c 'GTTCTTCTGC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "ES3_0400-ATTCTCTGCA") <(grep -c 'ATTCTCTGCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "ES4_0400-GCTATGTAGG") <(grep -c 'GCTATGTAGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "ES5_0400-AGACGCTAGA") <(grep -c 'AGACGCTAGA' ${i}.fastq) >> ${i}_readcounts.txt

done
echo "barcode counting finished"

# combine readcounts into a single table in Excel

# Normalize sequencing depth by calculating reads per million (RPM)

# Calculate activity as (RNA RPM/DNA RPM)

# Normalized activity can be calculated by multiplying all activity data by an adjustment factor, 
# such that the average of the endothelial enhancer group (enhancers#26-50) = 1.
