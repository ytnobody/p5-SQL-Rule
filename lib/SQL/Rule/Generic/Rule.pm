package SQL::Rule::Generic::Rule;
use strict;
use warnings;

sub new {
    my ($class, @options) = @_;

    bless {options => [@options]}, $class;
}

sub apply {
    my ($self, $parsed_query) = @_;

    return "SQL::Rule::Generic::Error" unless $parsed_query;
    return;
}

sub error {
    my ($self) = @_;
    
    my $error_class = ref($self);
    $error_class =~ s/::Rule$/::Error/;

    $error_class;
}

1;