# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'
my $CVS_VERSION = sprintf '%s', q$Revision: 1.3 $ =~ /: ([0-9.]*)/;
######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..6\n"; }
END { print "not ok 1\n" unless $loaded; }
use X::Osd;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):
my $osd;

my $test_count = 2;
my $usleep     = 400;

eval {
    $osd =
      X::Osd->new("-*-lucidatypewriter-medium-r-normal-*-*-250-*-*-*-*-*-*",
                  "Green", 3, XOSD_top, 1, 2);
};

print(($@ ? 'not ok' : 'ok'), ' ', ($test_count++), "\n");

eval {
    $osd->set_offset(30);
};
print(($@ ? 'not ok' : 'ok'), ' ', ($test_count++), "\n");

eval {
    $osd->string(0, 'Hello World!');
    sleep 1;
};

print(($@ ? 'not ok' : 'ok'), ' ', ($test_count++), "\n");

eval {
    foreach my $num (0 .. 10)
    {
        $osd->slider(0, ($num * 10));
        delay();
    }
    sleep 1;
};

print(($@ ? 'not ok' : 'ok'), ' ', ($test_count++), "\n");

eval {
    foreach my $num (0 .. 10)
    {
        $osd->percentage(0, ($num * 10));
        delay();
    }
    sleep 1;
};

print(($@ ? 'not ok' : 'ok'), ' ', ($test_count++), "\n");



sub delay
{
    select(undef, undef, undef, 0.25);
}
