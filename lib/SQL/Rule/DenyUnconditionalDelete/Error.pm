package SQL::Rule::DenyUnconditionalDelete::Error;
use strict;
use warnings;
use base 'SQL::Rule::Generic::Error';

sub message {
    "Query must be contains one or more where clause";
}

1;