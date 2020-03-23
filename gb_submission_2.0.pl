#!/usr/bin/perl

### 02-03-2018
##### Perl SCRIPT to generate automatically the fasta files in the format needed to submit sequences to GenBank through Sequin.
## From an idea of Angelica Crottini, developped by Walter Cocca 

## Reading INPUT file 
$tx{Hoplobatrachus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Dicroglossidae; Dicroglossinae; Hoplobatrachus";
$tx{Duttaphrynus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Hyloidea; Bufonidae; Duttaphrynus";
$tx{Ptychadena}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Ptychadenidae; Ptychadena";
$tx{Heterixalus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Microhyloidea; Hyperoliidae; Heterixalus";
$tx{Dyscophus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Microhyloidea; Microhylidae; Dyscophinae; Dyscophus";
$tx{Scaphiophryne}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Microhyloidea; Microhylidae; Scaphiophryninae; Scaphiophryne";
$tx{Paradoxophyla}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Microhyloidea; Microhylidae; Scaphiophryninae; Paradoxophyla";
$tx{Stumpffia}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Microhyloidea; Microhylidae; Cophylinae; Stumpffia";
$tx{Anilany}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Microhyloidea; Microhylidae; Cophylinae; Anilany";
$tx{Anodonthyla}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Microhyloidea; Microhylidae; Cophylinae; Anodonthyla";
$tx{Cophyla}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Microhyloidea; Microhylidae; Cophylinae; Cophyla";
$tx{Madecassophryne}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Microhyloidea; Microhylidae; Cophylinae; Madecassophryne";
$tx{Platypelis}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Microhyloidea; Microhylidae; Cophylinae; Platypelis";
$tx{Plethodontohyla}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Microhyloidea; Microhylidae; Cophylinae; Plethodontohyla";
$tx{Rhombophryne}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Microhyloidea; Microhylidae; Cophylinae; Rhombophryne";
$tx{Laliostoma}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Mantellidae; Laliostominae; Laliostoma";
$tx{Aglyptodactylus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Mantellidae; Laliostominae; Aglyptodactylus";
$tx{Boophis}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Mantellidae; Boophinae; Boophis; Boophis";
$tx{Sahona}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Mantellidae; Boophinae; Boophis; Sahona";
$tx{Blommersia}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Mantellidae; Mantellinae; Blommersia";
$tx{Boehmantis}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Mantellidae; Mantellinae; Boehmantis";
$tx{Gephyromantis}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Mantellidae; Mantellinae; Gephyromantis";
$tx{Guibemantis}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Mantellidae; Mantellinae; Guibemantis";
$tx{Mantella}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Mantellidae; Mantellinae; Mantella";
$tx{Mantidactylus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Mantellidae; Mantellinae; Mantidactylus";
$tx{Spinomantis}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Mantellidae; Mantellinae; Spinomantis";
$tx{Tsingymantis}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Mantellidae; Mantellinae; Tsingymantis";
$tx{Wakea}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Amphibia; Batrachia; Anura; Neobatrachia; Ranoidea; Mantellidae; Mantellinae; Wakea";
$tx{Acrantophis}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Bifurcata; Unidentata; Episquamata; Toxicofera; Serpentes; Henophidia; Boidae; Boinae; Acrantophis";
$tx{Zonosaurus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Scincomorpha; Scincoidea; Gerrhosauridae; Zonosaurus";
$tx{Tracheloptychus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Scincomorpha; Scincoidea; Gerrhosauridae; Tracheloptychus";
$tx{Oplurus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Iguania; Iguanidae; Oplurinae; Oplurus";
$tx{Chalarodon}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Iguania; Iguanidae; Oplurinae; Chalarodon";
$tx{Madascincus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Scincomorpha; Scincoidea; Scincidae; Madascincus";
$tx{Amphiglossus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Scincomorpha; Scincoidea; Scincidae; Amphiglossus";
$tx{Lycodryas}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Serpentes; Colubroidea; Colubridae; Pseudoxyrhophiinae; Lycodryas";
$tx{Madagascarophis}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Serpentes; Colubroidea; Colubridae; Pseudoxyrhophiinae; Madagascarophis";
$tx{Liopholidophis}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Serpentes; Colubroidea; Colubridae; Pseudoxyrhophiinae; Liopholidophis";
$tx{Lycodryas}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Serpentes; Colubroidea; Colubridae; Pseudoxyrhophiinae; Lycodryas";
$tx{Mimophis}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Serpentes; Colubroidea; Colubridae; Psammophiinae; Mimophis";
$tx{Mabuya}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Scincomorpha; Scincoidea; Scincidae; Mabuya";
$tx{Calumma}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Iguania; Acrodonta; Chamaeleonidae; Calumma";
$tx{Furcifer}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Iguania; Acrodonta; Chamaeleonidae; Furcifer";
$tx{Brookesia}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Iguania; Acrodonta; Chamaeleonidae; Brookesia";
$tx{Pelomedusa}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Testudines; Pleurodira; Pelomedusidae; Pelomedusa";
$tx{Pelusios}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Testudines; Pleurodira; Pelomedusidae; Pelusios";
$tx{Erymnochelys}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Testudines; Pleurodira; Podocnemididae; Erymnochelys";
$tx{Astrochelys}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Testudines; Cryptodira; Testudinoidea; Testudinidae; Astrochelys";
$tx{Pyxis}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Testudines; Cryptodira; Testudinoidea; Testudinidae; Pyxis";
$tx{Phelsuma}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Gekkota; Gekkonidae; Gekkoninae; Phelsuma";
$tx{Microscalabotes}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Gekkota; Gekkonidae; Gekkoninae; Microscalabotes";
$tx{Lygodactylus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Gekkota; Gekkonidae; Gekkoninae; Lygodactylus";
$tx{Blaesodactylus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Gekkota; Gekkonidae; Gekkoninae; Blaesodactylus";
$tx{Paroedura}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Gekkota; Gekkonidae; Gekkoninae; Paroedura";
$tx{Uroplatus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Gekkota; Gekkonidae; Gekkoninae; Uroplatus";
$tx{Hemidactylus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Scleroglossa; Gekkota; Gekkonidae; Gekkoninae; Hemidactylus";
$tx{Crocodylus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Archosauria; Crocodylidae; Crocodylinae; Crocodylus";
$tx{Trachylepis}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Bifurcata; Unidentata; Scinciformata; Scincidae; Mabuyinae; Trachylepis";
$tx{Dromicodryas}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Bifurcata; Unidentata; Episquamata; Toxicofera; Serpentes; Colubroidea; Lamprophiidae; Pseudoxyrhophiinae; Dromicodryas";
$tx{Ithycyphus}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Bifurcata; Unidentata; Episquamata; Toxicofera; Serpentes; Colubroidea; Lamprophiidae; Pseudoxyrhophiinae; Ithycyphus";
$tx{Leioheterodon}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Bifurcata; Unidentata; Episquamata; Toxicofera; Serpentes; Colubroidea; Lamprophiidae; Pseudoxyrhophiinae; Leioheterodon";
$tx{Thamnosophis}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Bifurcata; Unidentata; Episquamata; Toxicofera; Serpentes; Colubroidea; Lamprophiidae; Pseudoxyrhophiinae; Thamnosophis";
$tx{Liophidium}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Bifurcata; Unidentata; Episquamata; Toxicofera; Serpentes; Colubroidea; Lamprophiidae; Pseudoxyrhophiinae; Liophidium";
$tx{Iberolacerta}="Eukaryota; Metazoa; Chordata; Craniata; Vertebrata; Euteleostomi; Lepidosauria; Squamata; Bifurcata; Unidentata; Episquamata; Laterata; Lacertibaenia; Lacertidae; Iberolacerta";

if (!$ARGV[0]){
#  print "Please introduce the name of the input file.\n";
  print "insert input file name:\n";
   $file=<STDIN>;
    chomp $file;
} else {              
  $file=$ARGV[0];
  chomp $file;
}
print "Reading file $file\n";
open (input,$file);
($name,$extension)=split(/\./,$file);   #Once we have $file from any of the ways, we remove the extension to create the output only with one extension
open (output, ">$name"."_gb_submission.fasta");
open (output2, ">$name"."_gb_submission_not_processed.txt");
while (<input>){
  chomp $_;
  ($id,$genus2,$sp,$country,$locality,$voucher,$seq)=split(/\t/,$_);
  if ($tx{$genus2}){
    print output ">$id "."[org=$genus2 $sp] "."[lineage= $tx{$genus2}] "."[country=$country: $locality] "."[specimen voucher=$voucher]\n"."$seq\n";
  } else {
    print output2 ">$id "."$genus2 $sp "."- This sample doesn't have a corresponding lineage in the reference list. Please check if these genus need to be added\n";
  }
}
close (output);
close (output2);
close (input);





