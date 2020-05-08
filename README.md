# NAME

SQL::Rule - Rule based tester for SQL

# SYNOPSIS

    use SQL::Rule;
    my $rule = SQL::Rule->new();
    $rule->set_rule('DenyUnconditionalDelete');
    
    my $query = 'DELETE FROM books';
    my $err   = $rule->apply($query); # --> returns a SQL::Rule::DenyUnconditionalDelete::Error instance
    
    $query = 'DELETE FROM books WHERE id=?';
    $err   = $rule->apply($query); # --> returns undef

# DESCRIPTION

SQL::Rule is a SQL tester that uses preset rules for testing SQLs. 

# METHODS

- $rule = SQL::Rule->new($parser);

    Create a SQL::Rule instance

- $rule = $rule->set\_rule($rule\_name);

    Set a preset rule for testing SQL

- $err = $rule->apply($query);

    Test a SQL with rule that specified by set\_rule method. When any error, it returns an instance that is a subclass of SQL::Rule::Generic::Error

# LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

ytnobody <ytnobody@gmail.com>
