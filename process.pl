
use strict;

my $saxon   = "java -jar ../../../../../Tools/tei2html/tools/lib/saxon9he.jar "; # (see http://saxon.sourceforge.net/)

print "Create complete XML version of TuzukiJahangiri...\n";

processVolume("1", "TuzukiJahangiri1-0.4.tei");
processVolume("2", "TuzukiJahangiri2-0.3.tei");

system ("$saxon TuzukiJahangiri.xsl TuzukiJahangiri.xsl > TuzukiJahangiri.xml");

system ("perl -S tei2html.pl -h -r TuzukiJahangiri.xml");
system ("perl -S tei2html.pl -e TuzukiJahangiri.xml");


sub processVolume($)
{
    my $volume = shift;
    my $file = shift;
    chdir "Volume $volume";
    system ("perl -S tei2html.pl -x " . $file);
    chdir "..";
}
