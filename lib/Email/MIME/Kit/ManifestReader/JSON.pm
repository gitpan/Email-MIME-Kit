package Email::MIME::Kit::ManifestReader::JSON;
our $VERSION = '2.091410';

use Moose;
# ABSTRACT: read manifest.json files

with 'Email::MIME::Kit::Role::ManifestReader';
with 'Email::MIME::Kit::Role::ManifestDesugarer';

use JSON;

sub read_manifest {
  my ($self) = @_;

  my $json_ref = $self->kit->kit_reader->get_kit_entry('manifest.json');

  my $content = JSON->new->decode($$json_ref);
}

no Moose;
1;

__END__

=pod

=head1 NAME

Email::MIME::Kit::ManifestReader::JSON - read manifest.json files

=head1 VERSION

version 2.091410

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


