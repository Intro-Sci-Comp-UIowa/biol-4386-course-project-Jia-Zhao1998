# This is done in python in Jupyter lab. This code chunk is to report all of the consensus and 1-bp off motifs in the S288c_genome sacCer1-3 genomic sequence. The output csv files include four variables: "chromosome", "motif", "start position", "end position"

# Find a motif in a seq: Fuzzy search consensus/1 bp off motif 

consensus_motif= "CACGTG" # This is the consensus motif for CgPho4 and ScPho4
data=[]
element=["chromosome", "motif", "start position", "end position"]
seq = ""

# This function is to find any motif and outputs the positions
def find_motif(motif,seq):
    occurrence=0
    while motif in seq:
        mylist = []
        element[1] = motif
        index = seq.find(motif) # Find the first motif
        seq = seq[:index] + seq[index + len(motif):] # Remove the first detected motif
        # Get the original index for the next motif search
        element[2] = index + occurrence * len(motif) + 1 # Python starts with the position 0. Correct it to 1
        element[3] = element[2] + len(motif) - 1
        mylist = mylist + element # mylist includes one piece of information for one motif
        occurrence = occurrence + 1
        data.append(mylist) # The list "data" includes the positions of consensus motif.
    
# This function is to do a fuzzy search of 1 base pair off motif and output positions
my_list = ["C", "A", "T", "G"]
def find_1_bp_off_motif():
    b=[]
    # this for loop aims to create a list of 1-bp off motifs. Starting from "NACGTG" to "CACGTN"
    for i in range(6):
        for j in range(4):
            a= ""
            if my_list[j] == consensus_motif[i]:
                continue
            else:
                a = consensus_motif[:i] + str(my_list[j]) + consensus_motif[i+1:]
                b.append(a) # The list b stores all possible 1-bp off motifs
    for i in range(len(b)):
        find_motif(b[i], seq) # create a list of list to include motif and position information      


# Import the sacCer1 genomic sequences and do a motif search
import os
os.getcwd()
os.chdir("~/Desktop/C16 Nucleosome Occupancy/data")

with open("S288c_sacCer1_genomeseq.csv", 'r') as f:
    for line in f:
        if "chr" in line:
            line = line.split(sep = ",")
            element[0] = line[0]
            seq = line[1]
            find_motif(consensus_motif, seq)
            find_1_bp_off_motif()
        else:
            continue

# Import csv
import csv
with open('sacCer1a.csv', 'w', newline = '') as h:
    writer = csv.writer(h)
    writer.writerows(data)
    
# Import the sacCer2 genomic sequences and do a motif search
with open("S288c_sacCer2_genomeseq.csv", 'r') as d:
    for line in d:
        if "chr" in line:
            line = line.split(sep = ",")
            element[0] = line[0]
            seq = line[1]
            find_motif(consensus_motif, seq)
            find_1_bp_off_motif()
        else:
            continue

# Import csv
import csv
with open('sacCer2a.csv', 'w', newline = '') as m:
    writer = csv.writer(m)
    writer.writerows(data) 


# Import the sacCer3 genomic sequences and do a motif search
with open("S288c_sacCer3_genomeseq.csv", 'r') as k:
    for line in k:
        if "chr" in line:
            line = line.split(sep = ",")
            element[0] = line[0]
            seq = line[1]
            find_motif(consensus_motif, seq)
            find_1_bp_off_motif()
        else:
            continue
# Import csv
import csv
with open('sacCer3a.csv', 'w', newline = '') as n:
    writer = csv.writer(n)
    writer.writerows(data) 
