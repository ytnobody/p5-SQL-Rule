package SQL::Rule;
use 5.008001;
use strict;
use warnings;

use Module::Load qw();
use SQL::Parser;

our $VERSION = "0.01";

sub new {
    my ($class, $parser) = @_;
    $parser ||= SQL::Parser->new();

    bless {
        parser => $parser,
        rule   => undef,
    }, $class;
}

sub set_rule {
    my ($self, $rule_name, @options) = @_;

    my $rule_class = sprintf 'SQL::Rule::%s::Rule', $rule_name;
    Module::Load::load($rule_class);

    my $rule = $rule_class->new(@options);
    $self->{rule} = $rule;

    $self;
}

sub apply {
    my ($self, $query) = @_;

    $self->{parser}->parse($query);

    my $err_class = $self->{rule}->apply($self->{parser}->structure);
    if ($err_class) {
        Module::Load::load($err_class);
        $err_class->new();
    }
}

1;
__END__

=encoding utf-8

=head1 NAME

SQL::Rule - Rule based tester for SQL

=head1 SYNOPSIS

    use SQL::Rule;
    my $rule = SQL::Rule->new();
    $rule->set_rule('DenyUnconditionalDelete');
    
    my $query = 'DELETE FROM books';
    my $err   = $rule->apply($query); # --> returns a SQL::Rule::DenyUnconditionalDelete::Error instance
    
    $query = 'DELETE FROM books WHERE id=?';
    $err   = $rule->apply($query); # --> returns undef


=head1 DESCRIPTION

SQL::Rule is a SQL tester that uses preset rules for testing SQLs. 

=head1 METHODS

=over 4

=item $rule = SQL::Rule->new($parser);

Create a SQL::Rule instance

=item $rule = $rule->set_rule($rule_name);

Set a preset rule for testing SQL

=item $err = $rule->apply($query);

Test a SQL with rule that specified by set_rule method. When any error, it returns an instance that is a subclass of SQL::Rule::Generic::Error

=back

=head1 LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

ytnobody E<lt>ytnobody@gmail.comE<gt>

=cut

