use strict;
use warnings;
use Test::More;
use SQL::Rule;

subtest 'deny unconditional delete' => sub {
    my $query = 'DELETE FROM books';
    my $rule  = SQL::Rule->new();
    my $err   = $rule->set_rule('DenyUnconditionalDelete')->apply($query);
    isa_ok($err, 'SQL::Rule::Generic::Error');
    isa_ok($err, 'SQL::Rule::DenyUnconditionalDelete::Error');
    is("$err", 'Query must be contains one or more where clause');
};

subtest 'allow conditional delete' => sub {
    my $query = 'DELETE FROM books WHERE id=?';
    my $rule  = SQL::Rule->new();
    my $err   = $rule->set_rule('DenyUnconditionalDelete')->apply($query);
    is($err, undef);
};

done_testing();