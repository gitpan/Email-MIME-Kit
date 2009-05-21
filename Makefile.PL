
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Email-MIME-Kit',
  NAME      => 'Email::MIME::Kit',
  AUTHOR    => 'Ricardo\ Signes\ \<rjbs\@cpan\.org\>',
  ABSTRACT  => 'build messages from templates',
  VERSION   => '2.091410',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.21) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "String::RewritePrefix" => '0',
    "Email::MessageID" => '1.400',
    "Email::MIME::Creator" => '1.455',
    "JSON" => '2',
    "YAML::XS" => '0',
    "Moose" => '0.65',
  },
);
