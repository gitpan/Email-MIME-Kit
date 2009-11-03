
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Email-MIME-Kit',
  NAME      => 'Email::MIME::Kit',
  AUTHOR    => "Ricardo\ Signes\ \<rjbs\@cpan\.org\>",
  ABSTRACT  => "build\ messages\ from\ templates",
  VERSION   => '2.093070',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Email::MIME" => '1.900',
    "Email::MessageID" => '1.400',
    "String::RewritePrefix" => '0',
    "JSON" => '2',
    "Test::Deep" => '0',
    "YAML::XS" => '0',
    "Moose" => '0.65',
  },
  test => {TESTS => 't/*.t'}
);

