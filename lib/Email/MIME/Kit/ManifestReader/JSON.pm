package Email::MIME::Kit::ManifestReader::JSON;
# ABSTRACT: read manifest.json files
$Email::MIME::Kit::ManifestReader::JSON::VERSION = '3.000001';
use Moose;

with 'Email::MIME::Kit::Role::ManifestReader';
with 'Email::MIME::Kit::Role::ManifestDesugarer';

use JSON;

sub read_manifest {
  my ($self) = @_;

  my $json_ref = $self->kit->kit_reader->get_kit_entry('manifest.json');

  # We do not touch ->utf8 because we're reading the octets, and not decoding
  # them. -- rjbs, 2014-11-20
  my $content = JSON->new->decode($$json_ref);
}

no Moose;
1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Email::MIME::Kit::ManifestReader::JSON - read manifest.json files

=head1 VERSION

version 3.000001

=head1 AUTHOR

Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
