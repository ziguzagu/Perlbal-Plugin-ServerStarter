use inc::Module::Install;
# metadataes
name 'Perlbal-Plugin-ServerStarter';
all_from 'lib/Perlbal/Plugin/ServerStarter.pm';
readme_from 'lib/Perlbal/Plugin/ServerStarter.pm';
install_script 'start_perlbal';
# dependencies
requires 'Perlbal';
requires 'Server::Starter';
# tests
test_requires 'Test::More', 0.96;
test_requires 'Test::TCP';
tests 't/*.t';
author_tests 'xt';
# misc
auto_include;

WriteAll;
