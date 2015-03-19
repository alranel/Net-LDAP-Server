use ExtUtils::MakeMaker;
use 5.006000;
my $mm_ver = $ExtUtils::MakeMaker::VERSION;

WriteMakefile(
    'NAME'		=> 'Net::LDAP::Server',
    'ABSTRACT'	=> 'LDAP server side protocol handling',
    'AUTHOR'	=> 'Alessandro Ranellucci <aar@cpan.org>',
    'VERSION_FROM'	=> 'lib/Net/LDAP/Server.pm',
    'PMLIBDIRS'	=> [ 'lib' ],
    'PREREQ_PM'		=> {
    	Net::LDAP => 0,
    	Convert::ASN1 => 0
    },
    ($mm_ver >= 6.48
        ? (MIN_PERL_VERSION => 5.006)
        : ()
    ),
    'dist'         	=> { COMPRESS => 'gzip', SUFFIX => 'gz' },
    'DISTNAME' => 'Net-LDAP-Server',
    'LICENSE' => 'perl',
    'test' => {
        'TESTS' => 't/*.t'
    },
    'META_MERGE' => {
        resources => {
            repository => 'git://git@github.com:alexrj/Net-LDAP-Server.git',
        },
    },
);
