use ExtUtils::MakeMaker;

$CVS_VERSION = sprintf '%s', q$Revision: 1.6 $ =~ /: ([0-9.]*)/;

WriteMakefile(
  'NAME'         => 'X::Osd',
  'VERSION_FROM' => 'Osd.pm',      # finds $VERSION
  'LIBS'         => ['-lxosd'],    # e.g., '-lm'
);

sub MY::dist
{
	system "pod2text Osd.pm > README";
	shift->MM::dist;
}
