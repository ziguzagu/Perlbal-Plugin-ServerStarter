use inc::Module::Install;

name 'Perlbal-Plugin-ServerStarter';
all_from 'lib/Perlbal/Plugin/ServerStarter.pm';
readme_from 'lib/Perlbal/Plugin/ServerStarter.pm';
install_script 'start_perlbal';

tests 't/*.t';
author_tests 'xt';

auto_include;
auto_set_repository;

cpanfile;

WriteAll;
