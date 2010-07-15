
use strict;
use warnings;

BEGIN { require 5.008; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'build messages from templates',
  'AUTHOR' => 'Ricardo Signes <rjbs@cpan.org>',
  'BUILD_REQUIRES' => {
    'Test::Deep' => '0',
    'Test::More' => '0',
    'utf8' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Email-MIME-Kit',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Email::MIME::Kit',
  'PREREQ_PM' => {
    'Email::MIME' => '1.900',
    'Email::MIME::Creator' => '0',
    'Email::MessageID' => '1.400',
    'Encode' => '0',
    'File::Basename' => '0',
    'File::Spec' => '0',
    'JSON' => '2',
    'Moose' => '0.65',
    'Moose::Role' => '0',
    'Moose::Util::TypeConstraints' => '0',
    'String::RewritePrefix' => '0',
    'Test::Deep' => '0',
    'YAML::XS' => '0'
  },
  'VERSION' => '2.101960',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



