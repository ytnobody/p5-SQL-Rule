requires 'perl', '5.008001';
requires 'Module::Load', '';
requires 'SQL::Parser', '';
requires 'Error', '';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

