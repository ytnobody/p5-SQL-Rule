package SQL::Rule::Generic::Error;
use strict;
use warnings;
use overload '""' => \&to_string;

sub new {
    my ($class) = @_;
    bless {message => $class->message()}, $class;
}

sub message {
    "Undefined error";
}

sub to_string {
    my ($self) = @_;
    $self->{message};
}

1;