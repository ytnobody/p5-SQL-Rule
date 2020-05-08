package SQL::Rule::DenyUnconditionalDelete::Rule;
use strict;
use warnings;
use base 'SQL::Rule::Generic::Rule';

sub apply {
    my ($self, $structure) = @_;
    return $self->error() if $structure->{command} eq 'DELETE' && !$structure->{where_clause};
    return;
}

1;