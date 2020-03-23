# gb_submission
#####README file for the script gb_submission_X.X.pl ###################################
########################################################################################
#################################################################################################################################################################################
NB: Take into account that GenBank declare that now is phasing out Sequin software and is suggesting to use, for submissions, online alternatives like  Bankit, Submission Portal, or tbl2asn. Descriptions of these tools can be found here: https://www.ncbi.nlm.nih.gov/genbank/submit/
Consider that the file format created with this script could not be the same as requested in these different submission systems.
#################################################################################################################################################################################

This script allows you to create automatically the fasta files in the format needed to submit sequences to GenBank through Sequin.

Example of the format:
>ACP1430 [org=Pelomedusa subrufa] [lineage= Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Testudines; Pleurodira; Pelomedusidae; Pelomedusa] [country=Madagascar: Isalo: Zahavola] [specimen voucher=MRSN R3737]
GTACCGCCCTTAGCCTCCTCATTCGAACTGAACTTAATCAACCTGGAAATCTCCTAGGTAGCGACCAAACCTACAACGTTATCGTCACAGCCCATGCATTCATCATAATCTTCTTTATAGTAATACCAGTTATGATTGGAGGATTCGGAAACTGATTAATCCCTTTAATAATCGGAGCTCCAGACATAGCATTCCCACGCCTAAACAACATGAGCTTCTGACTATTACCCCCATCATTAATTCTCATACTTGCCTCCTCTACAATTGAAGCAGGGGCGGGAACAGGTTGAACAGTCTACCCCCCTTTAGCAGGCAACCTCGCCCATGCTGGTGCATCCGTGGACCTAGCCATCTTCTCCTTACATCTAGCAGGAGCATCCTCCATCCTAGGAGCCATTAATTTCATCACTACAGTAATTAACATAAAAACTCCAAACATATCCTTCCTTGACATACCACTATTTGTTTGATCTGTACTAATTACAGCTGTCTTATTACTCTTATCTCTCCCAGTACTTGCAGCAGGTATTACTATACTCCTAACAGACCGAAACCTAAACACAACATTCTTTGACCCTTCAGGGGGAGGAGACCCAATCCTATATCAACATCTATTCTG





The input file needs is a .txt file (exported from excel, for example) with the following fields in the following order:(remember that the headers of the columns has to be eliminated)

EXTRACT_ID	GENUS	SPECIES	COUNTRY	LOCALITY	VOUCHER		SEQ(in a single line)
ACP1430	Pelomedusa	subrufa Madagascar	Isalo: Zahavola	MRSN R3737	GTACCGCCCTTAGCCTCCTCATTCGAACTGAACTTAATCAACCTGGAAATCTCCTAGGTAGCGACCAAACCTACAACGTTAT

NB: If you use the script created by Antonio Munoz tabfromfasta.pl most of the fields will be already putted into the table.

NB: The column COUNTRY has to include ALWAYS only the country (Madagascar for example). In the column LOCALITY you can include also the region name before the locality name, if you wish. In the example above, in the LOCALITY column is Isalo: (region or main area) Zahavola (specific locality). In case the specific locality is not known introduce alway the region name (otherwise there will be in the output file only an empty space with ":" after the Country name).

Outputs generated:

"FILE_NAME_gb_submission.fasta" = output file with the sequences in GB_submission format
"FILE_NAME_gb_submission_not_processed.txt" = output file with the sequences that the script couldn't process because is missing the corresponding lineage descriptor to the genus.

Comment:
In order to work the script has to set, at the beginning, different variable for each lineage descriptor [lineage= Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Testudines; Pleurodira; Pelomedusidae; Pelomedusa].
At the moment, many lineages descriptors (for Madagascar species) are already included in the script but, in case you are working with species that are NOT only in Madagascar, most likely the corresponding lineage descriptor is missing. If the script doesn't "recognise" one or more genus you will find all the informations in the output .txt file called "FILE_NAME_gb_submission_not_processed.txt"

When this happens, you need by yourself add the new lineage descriptor in the script. To do so follow these few steps:

1) Go in NCBI and copy the lineage (or lineages) that you need in a txt file putting each different lineage in signal lines
example:
Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Dicroglossidae; Dicroglossinae; Hoplobatrachus
Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Hyloidea; Bufonidae; Duttaphrynus

2) open this script (gb_submission_X.X.pl) as a text file
3) add the new lineage (or lineages) at the beginning (or at the end, is the same) of the list of lineages you can already found in there, following this format:

$tx{genus}="lineage descriptor";

Note: the variable name has to keep it as it is now ($tx), this CANNOT change.
Note: the "genus" between {} has to be written the same as the genus at the end of the lineage descriptor. If they are different the script cannot recognise it. So please double check for typos or misspellings.

example:
$tx{Hoplobatrachus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Dicroglossidae; Dicroglossinae; Hoplobatrachus";
