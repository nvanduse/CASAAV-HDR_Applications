#!/bin/bash
#SBATCH --mail-type=ALL					#directs Slurm to send job-related email when an event of the specified type(s) occurs; valid type values include all, begin, end, and fail.
#SBATCH --mail-user=nvanduse@iu.edu		#indicates the email address to which Slurm will send job-related mail		
#SBATCH --time=24:00:00					#requested compute time in hrs:min:seconds
#SBATCH --mem=12G						#memory requested
#SBATCH -A r00226                      #specifies that the job should run in the general partition
#SBATCH --cpus-per-task=1             #number of cores requested. Its confusing but this is cores, not CPUs. Quartz nodes have 2 CPUs with 64 cores each. So the max number you can request here is 128. Sequential parts of the script can only utilize a max of one core, so don't request more than the most parrallelized part of the script. 


#UNZIP THE TRIMMED FILES
gunzip DNA1_GEN00141099_S01_L1-4_R1.fastq.gz 
gunzip DNA2_GEN00141100_S02_L1-4_R1.fastq.gz 
gunzip DNA3_GEN00141101_S03_L1-4_R1.fastq.gz 
gunzip RNA1_GEN00141102_S04_L1-4_R1.fastq.gz 
gunzip RNA2_GEN00141103_S05_L1-4_R1.fastq.gz 
gunzip RNA3_GEN00141104_S06_L1-4_R1.fastq.gz 
gunzip RNA4_GEN00141105_S07_L1-4_R1.fastq.gz 
gunzip RNA5_GEN00141106_S08_L1-4_R1.fastq.gz 
gunzip RNA6_GEN00141107_S09_L1-4_R1.fastq.gz 


# BARCODE COUNTING
# outputs the enhancer/promoter ID and barcode plus the number of times the barcode appeared in the fastq file to txt file.

echo "counting barcodes..."
for j in *.fastq; do
	i=${j%.fastq}
	paste <(echo "TnT200_TACGGCCTAG-01_CAGCTTTTGG") <(grep -c 'TACGGCCTAGGCGATCGCCAGCTTTTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-02_TGCAGGTTCG") <(grep -c 'TACGGCCTAGGCGATCGCTGCAGGTTCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-03_GTGGAGTACT") <(grep -c 'TACGGCCTAGGCGATCGCGTGGAGTACT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-04_TTTCCGCCGG") <(grep -c 'TACGGCCTAGGCGATCGCTTTCCGCCGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-05_TGGCCGCTGA") <(grep -c 'TACGGCCTAGGCGATCGCTGGCCGCTGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-06_CTACAGACTC") <(grep -c 'TACGGCCTAGGCGATCGCCTACAGACTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-07_GTGTACGTTC") <(grep -c 'TACGGCCTAGGCGATCGCGTGTACGTTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-08_ACCAACTTGG") <(grep -c 'TACGGCCTAGGCGATCGCACCAACTTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-09_TCAAGGTTTG") <(grep -c 'TACGGCCTAGGCGATCGCTCAAGGTTTG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-10_ATCCGCACCA") <(grep -c 'TACGGCCTAGGCGATCGCATCCGCACCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-11_CTAGTTAGGA") <(grep -c 'TACGGCCTAGGCGATCGCCTAGTTAGGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-12_GATGGGTGAA") <(grep -c 'TACGGCCTAGGCGATCGCGATGGGTGAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-13_AAAGATGGAC") <(grep -c 'TACGGCCTAGGCGATCGCAAAGATGGAC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-14_GTTAGTAACG") <(grep -c 'TACGGCCTAGGCGATCGCGTTAGTAACG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-15_CTGGGTAGTC") <(grep -c 'TACGGCCTAGGCGATCGCCTGGGTAGTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-16_GGGGAGATCT") <(grep -c 'TACGGCCTAGGCGATCGCGGGGAGATCT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-17_TACTCTTAAA") <(grep -c 'TACGGCCTAGGCGATCGCTACTCTTAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-18_AGGGTTGTCA") <(grep -c 'TACGGCCTAGGCGATCGCAGGGTTGTCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-19_GGTTGAACGA") <(grep -c 'TACGGCCTAGGCGATCGCGGTTGAACGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-20_TCAAGCATGA") <(grep -c 'TACGGCCTAGGCGATCGCTCAAGCATGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-21_CACACGTCAA") <(grep -c 'TACGGCCTAGGCGATCGCCACACGTCAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-22_AATCTTACTT") <(grep -c 'TACGGCCTAGGCGATCGCAATCTTACTT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-23_CAAGACCCAC") <(grep -c 'TACGGCCTAGGCGATCGCCAAGACCCAC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-24_GCATAAAAAA") <(grep -c 'TACGGCCTAGGCGATCGCGCATAAAAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-25_TAACATCGAG") <(grep -c 'TACGGCCTAGGCGATCGCTAACATCGAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-26_TCGCAAAGGG") <(grep -c 'TACGGCCTAGGCGATCGCTCGCAAAGGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-27_GCGAATGATC") <(grep -c 'TACGGCCTAGGCGATCGCGCGAATGATC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-28_CGCCAATGCA") <(grep -c 'TACGGCCTAGGCGATCGCCGCCAATGCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-29_TCACGTCCTA") <(grep -c 'TACGGCCTAGGCGATCGCTCACGTCCTA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-30_GCAGGTCTGG") <(grep -c 'TACGGCCTAGGCGATCGCGCAGGTCTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-31_TAGCCCCCGT") <(grep -c 'TACGGCCTAGGCGATCGCTAGCCCCCGT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-32_TTTCCTCAAA") <(grep -c 'TACGGCCTAGGCGATCGCTTTCCTCAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-33_GAGCTCCCAG") <(grep -c 'TACGGCCTAGGCGATCGCGAGCTCCCAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-34_GAACCCTTAA") <(grep -c 'TACGGCCTAGGCGATCGCGAACCCTTAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-35_TGACCAAATT") <(grep -c 'TACGGCCTAGGCGATCGCTGACCAAATT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-36_TACTTGAAGT") <(grep -c 'TACGGCCTAGGCGATCGCTACTTGAAGT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-37_ATGCGTTGAA") <(grep -c 'TACGGCCTAGGCGATCGCATGCGTTGAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-38_AGCCGTGCCG") <(grep -c 'TACGGCCTAGGCGATCGCAGCCGTGCCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-39_TACATTACCA") <(grep -c 'TACGGCCTAGGCGATCGCTACATTACCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-40_ATCGTGTTAT") <(grep -c 'TACGGCCTAGGCGATCGCATCGTGTTAT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-41_AACATCTACC") <(grep -c 'TACGGCCTAGGCGATCGCAACATCTACC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-42_AGTGAATAGC") <(grep -c 'TACGGCCTAGGCGATCGCAGTGAATAGC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-43_CGGACAGTCG") <(grep -c 'TACGGCCTAGGCGATCGCCGGACAGTCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-44_CAGGAGAATG") <(grep -c 'TACGGCCTAGGCGATCGCCAGGAGAATG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-45_AAGTTATGCT") <(grep -c 'TACGGCCTAGGCGATCGCAAGTTATGCT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-46_TGGGTTCTAG") <(grep -c 'TACGGCCTAGGCGATCGCTGGGTTCTAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-47_TGGCAACTCA") <(grep -c 'TACGGCCTAGGCGATCGCTGGCAACTCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-48_TCTTACAGCG") <(grep -c 'TACGGCCTAGGCGATCGCTCTTACAGCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-49_GGGGCACGCG") <(grep -c 'TACGGCCTAGGCGATCGCGGGGCACGCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnT200_TACGGCCTAG-50_GGAGTATAAA") <(grep -c 'TACGGCCTAGGCGATCGCGGAGTATAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-01_CAGCTTTTGG") <(grep -c 'TCCTAAATAAGCGATCGCCAGCTTTTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-02_TGCAGGTTCG") <(grep -c 'TCCTAAATAAGCGATCGCTGCAGGTTCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-03_GTGGAGTACT") <(grep -c 'TCCTAAATAAGCGATCGCGTGGAGTACT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-04_TTTCCGCCGG") <(grep -c 'TCCTAAATAAGCGATCGCTTTCCGCCGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-05_TGGCCGCTGA") <(grep -c 'TCCTAAATAAGCGATCGCTGGCCGCTGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-06_CTACAGACTC") <(grep -c 'TCCTAAATAAGCGATCGCCTACAGACTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-07_GTGTACGTTC") <(grep -c 'TCCTAAATAAGCGATCGCGTGTACGTTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-08_ACCAACTTGG") <(grep -c 'TCCTAAATAAGCGATCGCACCAACTTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-09_TCAAGGTTTG") <(grep -c 'TCCTAAATAAGCGATCGCTCAAGGTTTG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-10_ATCCGCACCA") <(grep -c 'TCCTAAATAAGCGATCGCATCCGCACCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-11_CTAGTTAGGA") <(grep -c 'TCCTAAATAAGCGATCGCCTAGTTAGGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-12_GATGGGTGAA") <(grep -c 'TCCTAAATAAGCGATCGCGATGGGTGAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-13_AAAGATGGAC") <(grep -c 'TCCTAAATAAGCGATCGCAAAGATGGAC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-14_GTTAGTAACG") <(grep -c 'TCCTAAATAAGCGATCGCGTTAGTAACG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-15_CTGGGTAGTC") <(grep -c 'TCCTAAATAAGCGATCGCCTGGGTAGTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-16_GGGGAGATCT") <(grep -c 'TCCTAAATAAGCGATCGCGGGGAGATCT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-17_TACTCTTAAA") <(grep -c 'TCCTAAATAAGCGATCGCTACTCTTAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-18_AGGGTTGTCA") <(grep -c 'TCCTAAATAAGCGATCGCAGGGTTGTCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-19_GGTTGAACGA") <(grep -c 'TCCTAAATAAGCGATCGCGGTTGAACGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-20_TCAAGCATGA") <(grep -c 'TCCTAAATAAGCGATCGCTCAAGCATGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-21_CACACGTCAA") <(grep -c 'TCCTAAATAAGCGATCGCCACACGTCAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-22_AATCTTACTT") <(grep -c 'TCCTAAATAAGCGATCGCAATCTTACTT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-23_CAAGACCCAC") <(grep -c 'TCCTAAATAAGCGATCGCCAAGACCCAC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-24_GCATAAAAAA") <(grep -c 'TCCTAAATAAGCGATCGCGCATAAAAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-25_TAACATCGAG") <(grep -c 'TCCTAAATAAGCGATCGCTAACATCGAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-26_TCGCAAAGGG") <(grep -c 'TCCTAAATAAGCGATCGCTCGCAAAGGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-27_GCGAATGATC") <(grep -c 'TCCTAAATAAGCGATCGCGCGAATGATC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-28_CGCCAATGCA") <(grep -c 'TCCTAAATAAGCGATCGCCGCCAATGCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-29_TCACGTCCTA") <(grep -c 'TCCTAAATAAGCGATCGCTCACGTCCTA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-30_GCAGGTCTGG") <(grep -c 'TCCTAAATAAGCGATCGCGCAGGTCTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-31_TAGCCCCCGT") <(grep -c 'TCCTAAATAAGCGATCGCTAGCCCCCGT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-32_TTTCCTCAAA") <(grep -c 'TCCTAAATAAGCGATCGCTTTCCTCAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-33_GAGCTCCCAG") <(grep -c 'TCCTAAATAAGCGATCGCGAGCTCCCAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-34_GAACCCTTAA") <(grep -c 'TCCTAAATAAGCGATCGCGAACCCTTAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-35_TGACCAAATT") <(grep -c 'TCCTAAATAAGCGATCGCTGACCAAATT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-36_TACTTGAAGT") <(grep -c 'TCCTAAATAAGCGATCGCTACTTGAAGT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-37_ATGCGTTGAA") <(grep -c 'TCCTAAATAAGCGATCGCATGCGTTGAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-38_AGCCGTGCCG") <(grep -c 'TCCTAAATAAGCGATCGCAGCCGTGCCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-39_TACATTACCA") <(grep -c 'TCCTAAATAAGCGATCGCTACATTACCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-40_ATCGTGTTAT") <(grep -c 'TCCTAAATAAGCGATCGCATCGTGTTAT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-41_AACATCTACC") <(grep -c 'TCCTAAATAAGCGATCGCAACATCTACC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-42_AGTGAATAGC") <(grep -c 'TCCTAAATAAGCGATCGCAGTGAATAGC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-43_CGGACAGTCG") <(grep -c 'TCCTAAATAAGCGATCGCCGGACAGTCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-44_CAGGAGAATG") <(grep -c 'TCCTAAATAAGCGATCGCCAGGAGAATG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-45_AAGTTATGCT") <(grep -c 'TCCTAAATAAGCGATCGCAAGTTATGCT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-46_TGGGTTCTAG") <(grep -c 'TCCTAAATAAGCGATCGCTGGGTTCTAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-47_TGGCAACTCA") <(grep -c 'TCCTAAATAAGCGATCGCTGGCAACTCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-48_TCTTACAGCG") <(grep -c 'TCCTAAATAAGCGATCGCTCTTACAGCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-49_GGGGCACGCG") <(grep -c 'TCCTAAATAAGCGATCGCGGGGCACGCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "TnnI1_TCCTAAATAA-50_GGAGTATAAA") <(grep -c 'TCCTAAATAAGCGATCGCGGAGTATAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-01_CAGCTTTTGG") <(grep -c 'TATTCACGAAGCGATCGCCAGCTTTTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-02_TGCAGGTTCG") <(grep -c 'TATTCACGAAGCGATCGCTGCAGGTTCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-03_GTGGAGTACT") <(grep -c 'TATTCACGAAGCGATCGCGTGGAGTACT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-04_TTTCCGCCGG") <(grep -c 'TATTCACGAAGCGATCGCTTTCCGCCGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-05_TGGCCGCTGA") <(grep -c 'TATTCACGAAGCGATCGCTGGCCGCTGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-06_CTACAGACTC") <(grep -c 'TATTCACGAAGCGATCGCCTACAGACTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-07_GTGTACGTTC") <(grep -c 'TATTCACGAAGCGATCGCGTGTACGTTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-08_ACCAACTTGG") <(grep -c 'TATTCACGAAGCGATCGCACCAACTTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-09_TCAAGGTTTG") <(grep -c 'TATTCACGAAGCGATCGCTCAAGGTTTG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-10_ATCCGCACCA") <(grep -c 'TATTCACGAAGCGATCGCATCCGCACCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-11_CTAGTTAGGA") <(grep -c 'TATTCACGAAGCGATCGCCTAGTTAGGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-12_GATGGGTGAA") <(grep -c 'TATTCACGAAGCGATCGCGATGGGTGAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-13_AAAGATGGAC") <(grep -c 'TATTCACGAAGCGATCGCAAAGATGGAC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-14_GTTAGTAACG") <(grep -c 'TATTCACGAAGCGATCGCGTTAGTAACG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-15_CTGGGTAGTC") <(grep -c 'TATTCACGAAGCGATCGCCTGGGTAGTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-16_GGGGAGATCT") <(grep -c 'TATTCACGAAGCGATCGCGGGGAGATCT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-17_TACTCTTAAA") <(grep -c 'TATTCACGAAGCGATCGCTACTCTTAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-18_AGGGTTGTCA") <(grep -c 'TATTCACGAAGCGATCGCAGGGTTGTCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-19_GGTTGAACGA") <(grep -c 'TATTCACGAAGCGATCGCGGTTGAACGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-20_TCAAGCATGA") <(grep -c 'TATTCACGAAGCGATCGCTCAAGCATGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-21_CACACGTCAA") <(grep -c 'TATTCACGAAGCGATCGCCACACGTCAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-22_AATCTTACTT") <(grep -c 'TATTCACGAAGCGATCGCAATCTTACTT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-23_CAAGACCCAC") <(grep -c 'TATTCACGAAGCGATCGCCAAGACCCAC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-24_GCATAAAAAA") <(grep -c 'TATTCACGAAGCGATCGCGCATAAAAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-25_TAACATCGAG") <(grep -c 'TATTCACGAAGCGATCGCTAACATCGAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-26_TCGCAAAGGG") <(grep -c 'TATTCACGAAGCGATCGCTCGCAAAGGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-27_GCGAATGATC") <(grep -c 'TATTCACGAAGCGATCGCGCGAATGATC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-28_CGCCAATGCA") <(grep -c 'TATTCACGAAGCGATCGCCGCCAATGCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-29_TCACGTCCTA") <(grep -c 'TATTCACGAAGCGATCGCTCACGTCCTA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-30_GCAGGTCTGG") <(grep -c 'TATTCACGAAGCGATCGCGCAGGTCTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-31_TAGCCCCCGT") <(grep -c 'TATTCACGAAGCGATCGCTAGCCCCCGT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-32_TTTCCTCAAA") <(grep -c 'TATTCACGAAGCGATCGCTTTCCTCAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-33_GAGCTCCCAG") <(grep -c 'TATTCACGAAGCGATCGCGAGCTCCCAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-34_GAACCCTTAA") <(grep -c 'TATTCACGAAGCGATCGCGAACCCTTAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-35_TGACCAAATT") <(grep -c 'TATTCACGAAGCGATCGCTGACCAAATT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-36_TACTTGAAGT") <(grep -c 'TATTCACGAAGCGATCGCTACTTGAAGT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-37_ATGCGTTGAA") <(grep -c 'TATTCACGAAGCGATCGCATGCGTTGAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-38_AGCCGTGCCG") <(grep -c 'TATTCACGAAGCGATCGCAGCCGTGCCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-39_TACATTACCA") <(grep -c 'TATTCACGAAGCGATCGCTACATTACCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-40_ATCGTGTTAT") <(grep -c 'TATTCACGAAGCGATCGCATCGTGTTAT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-41_AACATCTACC") <(grep -c 'TATTCACGAAGCGATCGCAACATCTACC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-42_AGTGAATAGC") <(grep -c 'TATTCACGAAGCGATCGCAGTGAATAGC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-43_CGGACAGTCG") <(grep -c 'TATTCACGAAGCGATCGCCGGACAGTCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-44_CAGGAGAATG") <(grep -c 'TATTCACGAAGCGATCGCCAGGAGAATG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-45_AAGTTATGCT") <(grep -c 'TATTCACGAAGCGATCGCAAGTTATGCT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-46_TGGGTTCTAG") <(grep -c 'TATTCACGAAGCGATCGCTGGGTTCTAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-47_TGGCAACTCA") <(grep -c 'TATTCACGAAGCGATCGCTGGCAACTCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-48_TCTTACAGCG") <(grep -c 'TATTCACGAAGCGATCGCTCTTACAGCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-49_GGGGCACGCG") <(grep -c 'TATTCACGAAGCGATCGCGGGGCACGCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Actn2_TATTCACGAA-50_GGAGTATAAA") <(grep -c 'TATTCACGAAGCGATCGCGGAGTATAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-01_CAGCTTTTGG") <(grep -c 'ATACACTGCGGCGATCGCCAGCTTTTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-02_TGCAGGTTCG") <(grep -c 'ATACACTGCGGCGATCGCTGCAGGTTCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-03_GTGGAGTACT") <(grep -c 'ATACACTGCGGCGATCGCGTGGAGTACT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-04_TTTCCGCCGG") <(grep -c 'ATACACTGCGGCGATCGCTTTCCGCCGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-05_TGGCCGCTGA") <(grep -c 'ATACACTGCGGCGATCGCTGGCCGCTGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-06_CTACAGACTC") <(grep -c 'ATACACTGCGGCGATCGCCTACAGACTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-07_GTGTACGTTC") <(grep -c 'ATACACTGCGGCGATCGCGTGTACGTTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-08_ACCAACTTGG") <(grep -c 'ATACACTGCGGCGATCGCACCAACTTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-09_TCAAGGTTTG") <(grep -c 'ATACACTGCGGCGATCGCTCAAGGTTTG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-10_ATCCGCACCA") <(grep -c 'ATACACTGCGGCGATCGCATCCGCACCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-11_CTAGTTAGGA") <(grep -c 'ATACACTGCGGCGATCGCCTAGTTAGGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-12_GATGGGTGAA") <(grep -c 'ATACACTGCGGCGATCGCGATGGGTGAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-13_AAAGATGGAC") <(grep -c 'ATACACTGCGGCGATCGCAAAGATGGAC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-14_GTTAGTAACG") <(grep -c 'ATACACTGCGGCGATCGCGTTAGTAACG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-15_CTGGGTAGTC") <(grep -c 'ATACACTGCGGCGATCGCCTGGGTAGTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-16_GGGGAGATCT") <(grep -c 'ATACACTGCGGCGATCGCGGGGAGATCT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-17_TACTCTTAAA") <(grep -c 'ATACACTGCGGCGATCGCTACTCTTAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-18_AGGGTTGTCA") <(grep -c 'ATACACTGCGGCGATCGCAGGGTTGTCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-19_GGTTGAACGA") <(grep -c 'ATACACTGCGGCGATCGCGGTTGAACGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-20_TCAAGCATGA") <(grep -c 'ATACACTGCGGCGATCGCTCAAGCATGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-21_CACACGTCAA") <(grep -c 'ATACACTGCGGCGATCGCCACACGTCAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-22_AATCTTACTT") <(grep -c 'ATACACTGCGGCGATCGCAATCTTACTT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-23_CAAGACCCAC") <(grep -c 'ATACACTGCGGCGATCGCCAAGACCCAC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-24_GCATAAAAAA") <(grep -c 'ATACACTGCGGCGATCGCGCATAAAAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-25_TAACATCGAG") <(grep -c 'ATACACTGCGGCGATCGCTAACATCGAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-26_TCGCAAAGGG") <(grep -c 'ATACACTGCGGCGATCGCTCGCAAAGGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-27_GCGAATGATC") <(grep -c 'ATACACTGCGGCGATCGCGCGAATGATC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-28_CGCCAATGCA") <(grep -c 'ATACACTGCGGCGATCGCCGCCAATGCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-29_TCACGTCCTA") <(grep -c 'ATACACTGCGGCGATCGCTCACGTCCTA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-30_GCAGGTCTGG") <(grep -c 'ATACACTGCGGCGATCGCGCAGGTCTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-31_TAGCCCCCGT") <(grep -c 'ATACACTGCGGCGATCGCTAGCCCCCGT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-32_TTTCCTCAAA") <(grep -c 'ATACACTGCGGCGATCGCTTTCCTCAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-33_GAGCTCCCAG") <(grep -c 'ATACACTGCGGCGATCGCGAGCTCCCAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-34_GAACCCTTAA") <(grep -c 'ATACACTGCGGCGATCGCGAACCCTTAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-35_TGACCAAATT") <(grep -c 'ATACACTGCGGCGATCGCTGACCAAATT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-36_TACTTGAAGT") <(grep -c 'ATACACTGCGGCGATCGCTACTTGAAGT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-37_ATGCGTTGAA") <(grep -c 'ATACACTGCGGCGATCGCATGCGTTGAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-38_AGCCGTGCCG") <(grep -c 'ATACACTGCGGCGATCGCAGCCGTGCCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-39_TACATTACCA") <(grep -c 'ATACACTGCGGCGATCGCTACATTACCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-40_ATCGTGTTAT") <(grep -c 'ATACACTGCGGCGATCGCATCGTGTTAT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-41_AACATCTACC") <(grep -c 'ATACACTGCGGCGATCGCAACATCTACC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-42_AGTGAATAGC") <(grep -c 'ATACACTGCGGCGATCGCAGTGAATAGC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-43_CGGACAGTCG") <(grep -c 'ATACACTGCGGCGATCGCCGGACAGTCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-44_CAGGAGAATG") <(grep -c 'ATACACTGCGGCGATCGCCAGGAGAATG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-45_AAGTTATGCT") <(grep -c 'ATACACTGCGGCGATCGCAAGTTATGCT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-46_TGGGTTCTAG") <(grep -c 'ATACACTGCGGCGATCGCTGGGTTCTAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-47_TGGCAACTCA") <(grep -c 'ATACACTGCGGCGATCGCTGGCAACTCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-48_TCTTACAGCG") <(grep -c 'ATACACTGCGGCGATCGCTCTTACAGCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-49_GGGGCACGCG") <(grep -c 'ATACACTGCGGCGATCGCGGGGCACGCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Rho_ATACACTGCG-50_GGAGTATAAA") <(grep -c 'ATACACTGCGGCGATCGCGGAGTATAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-01_CAGCTTTTGG") <(grep -c 'TAAATACTGTGCGATCGCCAGCTTTTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-02_TGCAGGTTCG") <(grep -c 'TAAATACTGTGCGATCGCTGCAGGTTCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-03_GTGGAGTACT") <(grep -c 'TAAATACTGTGCGATCGCGTGGAGTACT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-04_TTTCCGCCGG") <(grep -c 'TAAATACTGTGCGATCGCTTTCCGCCGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-05_TGGCCGCTGA") <(grep -c 'TAAATACTGTGCGATCGCTGGCCGCTGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-06_CTACAGACTC") <(grep -c 'TAAATACTGTGCGATCGCCTACAGACTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-07_GTGTACGTTC") <(grep -c 'TAAATACTGTGCGATCGCGTGTACGTTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-08_ACCAACTTGG") <(grep -c 'TAAATACTGTGCGATCGCACCAACTTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-09_TCAAGGTTTG") <(grep -c 'TAAATACTGTGCGATCGCTCAAGGTTTG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-10_ATCCGCACCA") <(grep -c 'TAAATACTGTGCGATCGCATCCGCACCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-11_CTAGTTAGGA") <(grep -c 'TAAATACTGTGCGATCGCCTAGTTAGGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-12_GATGGGTGAA") <(grep -c 'TAAATACTGTGCGATCGCGATGGGTGAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-13_AAAGATGGAC") <(grep -c 'TAAATACTGTGCGATCGCAAAGATGGAC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-14_GTTAGTAACG") <(grep -c 'TAAATACTGTGCGATCGCGTTAGTAACG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-15_CTGGGTAGTC") <(grep -c 'TAAATACTGTGCGATCGCCTGGGTAGTC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-16_GGGGAGATCT") <(grep -c 'TAAATACTGTGCGATCGCGGGGAGATCT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-17_TACTCTTAAA") <(grep -c 'TAAATACTGTGCGATCGCTACTCTTAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-18_AGGGTTGTCA") <(grep -c 'TAAATACTGTGCGATCGCAGGGTTGTCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-19_GGTTGAACGA") <(grep -c 'TAAATACTGTGCGATCGCGGTTGAACGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-20_TCAAGCATGA") <(grep -c 'TAAATACTGTGCGATCGCTCAAGCATGA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-21_CACACGTCAA") <(grep -c 'TAAATACTGTGCGATCGCCACACGTCAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-22_AATCTTACTT") <(grep -c 'TAAATACTGTGCGATCGCAATCTTACTT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-23_CAAGACCCAC") <(grep -c 'TAAATACTGTGCGATCGCCAAGACCCAC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-24_GCATAAAAAA") <(grep -c 'TAAATACTGTGCGATCGCGCATAAAAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-25_TAACATCGAG") <(grep -c 'TAAATACTGTGCGATCGCTAACATCGAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-26_TCGCAAAGGG") <(grep -c 'TAAATACTGTGCGATCGCTCGCAAAGGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-27_GCGAATGATC") <(grep -c 'TAAATACTGTGCGATCGCGCGAATGATC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-28_CGCCAATGCA") <(grep -c 'TAAATACTGTGCGATCGCCGCCAATGCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-29_TCACGTCCTA") <(grep -c 'TAAATACTGTGCGATCGCTCACGTCCTA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-30_GCAGGTCTGG") <(grep -c 'TAAATACTGTGCGATCGCGCAGGTCTGG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-31_TAGCCCCCGT") <(grep -c 'TAAATACTGTGCGATCGCTAGCCCCCGT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-32_TTTCCTCAAA") <(grep -c 'TAAATACTGTGCGATCGCTTTCCTCAAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-33_GAGCTCCCAG") <(grep -c 'TAAATACTGTGCGATCGCGAGCTCCCAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-34_GAACCCTTAA") <(grep -c 'TAAATACTGTGCGATCGCGAACCCTTAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-35_TGACCAAATT") <(grep -c 'TAAATACTGTGCGATCGCTGACCAAATT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-36_TACTTGAAGT") <(grep -c 'TAAATACTGTGCGATCGCTACTTGAAGT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-37_ATGCGTTGAA") <(grep -c 'TAAATACTGTGCGATCGCATGCGTTGAA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-38_AGCCGTGCCG") <(grep -c 'TAAATACTGTGCGATCGCAGCCGTGCCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-39_TACATTACCA") <(grep -c 'TAAATACTGTGCGATCGCTACATTACCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-40_ATCGTGTTAT") <(grep -c 'TAAATACTGTGCGATCGCATCGTGTTAT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-41_AACATCTACC") <(grep -c 'TAAATACTGTGCGATCGCAACATCTACC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-42_AGTGAATAGC") <(grep -c 'TAAATACTGTGCGATCGCAGTGAATAGC' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-43_CGGACAGTCG") <(grep -c 'TAAATACTGTGCGATCGCCGGACAGTCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-44_CAGGAGAATG") <(grep -c 'TAAATACTGTGCGATCGCCAGGAGAATG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-45_AAGTTATGCT") <(grep -c 'TAAATACTGTGCGATCGCAAGTTATGCT' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-46_TGGGTTCTAG") <(grep -c 'TAAATACTGTGCGATCGCTGGGTTCTAG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-47_TGGCAACTCA") <(grep -c 'TAAATACTGTGCGATCGCTGGCAACTCA' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-48_TCTTACAGCG") <(grep -c 'TAAATACTGTGCGATCGCTCTTACAGCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-49_GGGGCACGCG") <(grep -c 'TAAATACTGTGCGATCGCGGGGCACGCG' ${i}.fastq) >> ${i}_readcounts.txt
	paste <(echo "Mlc2v_TAAATACTGT-50_GGAGTATAAA") <(grep -c 'TAAATACTGTGCGATCGCGGAGTATAAA' ${i}.fastq) >> ${i}_readcounts.txt
done
echo "barcode count finished"


#COMBINE SGRNA COUNTS INTO ONE TABLE CALLED "readcount_table.txt"

paste *_readcounts.txt >> readcount_table.txt          # Combine all the gRNA count files into one
ls *_readcounts.txt > filenames_for_header.txt         # Create a list of filenames, stored in a txt file

# Transpose the list of filenames so they're all on one line, and add tab-separated "Annotation" and "barcode" before each filename
header_line=""                               # Initialize the header line
while IFS= read -r item
do
    # use the tab escape sequence (\t) for separation
    header_line="${header_line}\tAnnotation (promoter_barcode-enhancer_barcode)\t$item"
done < filenames_for_header.txt

# Insert the header line as a new line at the top of the output file
echo -e "$header_line" | cat - readcount_table.txt > temp && mv temp readcount_table.txt

#fix header line alignment
sed -i '1 s/^\t//' readcount_table.txt     # an extra tab is entered at the start of the header line, which makes it not line up right. This command will replace the first tab character (denoted by ^\t) with an empty string (//) in the first line of the file (denoted by 1). The -i option specifies that the file should be edited in place.

rm filenames_for_header.txt    # Remove the temporary file that was used to generate the header line

##################################################################################################################################
#Switch to Python for easier manipulation of the data table
module load python/3.11.4                

python3 - <<'PYTHON_SCRIPT'
import pandas as pd
import os
import numpy as np


#############
# 1) Read the readcount_table.txt into pandas and remove duplicate columns --> save as csv. Will be input for subsequent steps.

data = pd.read_csv("readcount_table.txt", delimiter="\t")                           # Read in the table
data.columns = data.columns.str.split('.').str[0]                                   # remove text from column headers that comes after the "."
data = data.loc[:, ~data.columns.duplicated()]                                      # deduplicate (will remove duplicated annotation columns)
data.to_csv("readcount_table.csv", index=False)                                     # Save the DataFrame to a CSV file

#############
# 2) Normalize the counts to counts-per-million (CPM)

data = pd.read_csv("readcount_table.csv")                                           # Read in the de-duplicated table
data_columns = data.columns[1:]                                                     # Exclude the first column (Annotation)
cpm_data = data.copy()

for col in data_columns:
    cpm_data[col] = (data[col] / data[col].sum()) * 1_000_000

cpm_data.to_csv("readcount_table_CPM.csv", index=False)                             # Save the CPM table to a CSV file

PYTHON_SCRIPT

