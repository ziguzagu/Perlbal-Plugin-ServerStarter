requires 'Perlbal';
requires 'Server::Starter';

on test => sub {
    requires 'Test::More', '>= 0.96';
    requires 'Test::TCP';
};
