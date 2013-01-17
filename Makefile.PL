use ExtUtils::MakeMaker;

my $preop =
    'perldoc -uT $(VERSION_FROM) | tee $(DISTVNAME)/README.pod > README.pod;' .
    'pod2text README.pod | tee $(DISTVNAME)/README > README';

WriteMakefile(
    NAME           => 'Perlbal::Plugin::ServerStarter',
    AUTHOR         => 'Hiroshi Sakai <ziguzagu@cpan.org>',
    LICENSE        => 'perl',
    VERSION_FROM   => 'lib/Perlbal/Plugin/ServerStarter.pm',
    ABSTRACT_FROM  => 'lib/Perlbal/Plugin/ServerStarter.pm',
    PREREQ_PM      => { 'Server::Starter' => 0 },
    BUILD_REQUIRES => {
        'Test::TCP'  => 0,
        'Test::More' => 0.96,
    },
    EXE_FILES => [qw( start_perlbal )],
    dist      => { PREOP => $preop, },
    clean     => { FILES => 'README.pod' },
);

