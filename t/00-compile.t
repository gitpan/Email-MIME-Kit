use strict;
use warnings;

# This test was generated via Dist::Zilla::Plugin::Test::Compile 2.018

use Test::More 0.88;



use Capture::Tiny qw{ capture };

my @module_files = qw(
Email/MIME/Kit.pm
Email/MIME/Kit/Assembler/Standard.pm
Email/MIME/Kit/KitReader/Dir.pm
Email/MIME/Kit/ManifestReader/JSON.pm
Email/MIME/Kit/ManifestReader/YAML.pm
Email/MIME/Kit/Renderer/TestRenderer.pm
Email/MIME/Kit/Role/Assembler.pm
Email/MIME/Kit/Role/Component.pm
Email/MIME/Kit/Role/KitReader.pm
Email/MIME/Kit/Role/ManifestDesugarer.pm
Email/MIME/Kit/Role/ManifestReader.pm
Email/MIME/Kit/Role/Renderer.pm
Email/MIME/Kit/Role/Validator.pm
);

my @scripts = qw(

);

# no fake home requested

my @warnings;
for my $lib (@module_files)
{
    my ($stdout, $stderr, $exit) = capture {
        system($^X, '-Mblib', '-e', qq{require q[$lib]});
    };
    is($?, 0, "$lib loaded ok");
    warn $stderr if $stderr;
    push @warnings, $stderr if $stderr;
}



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};



done_testing;
