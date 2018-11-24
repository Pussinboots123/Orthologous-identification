blastall -i otherbird.cds  -d  chicken.cds -F F -p blastn -m 8 -e 1e-5 -o otherbird.m8
perl best.hit.pl  bird.list
