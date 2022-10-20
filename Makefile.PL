use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Schema data plugin with default theme for application Commons vote.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.05;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'Schema-Data-Commons-Vote-Plugin-DefaultTheme';
perl_version 5.006002;
readme_from 'DefaultTheme.pm';
recursive_author_tests('xt');
requires 'Activity::Commons::Vote::Load' => 0;
requires 'Readonly' => 0;
requires 'Schema::Data::Plugin' => 0;
resources 'bugtracker' => 'https://github.com/commons-vote/Schema-Data-Commons-Vote-Plugin-DefaultTheme/issues';
resources 'homepage' => 'https://github.com/commons-vote/Schema-Data-Commons-Vote-DefaultTheme';
resources 'repository' => 'git://github.com/commons-vote/Schema-Data-Commons-Vote-DefaultTheme';
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
