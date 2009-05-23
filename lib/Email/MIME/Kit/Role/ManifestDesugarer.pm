package Email::MIME::Kit::Role::ManifestDesugarer;
our $VERSION = '2.091430';

use Moose::Role;
# ABSTRACT: helper for desugaring manifests


my $ct_desugar;
$ct_desugar = sub {
  my ($self, $content) = @_;

  for my $thing (qw(alternatives attachments)) {
    for my $part (@{ $content->{ $thing } }) {
      my $headers = $part->{header} ||= [];
      if (my $type = delete $part->{type}) {
        confess "specified both type and content_type attribute"
          if $part->{attributes}{content_type};

        $part->{attributes}{content_type} = $type;
      }

      $self->$ct_desugar($part);
    }
  }
};

around read_manifest => sub {
  my ($orig, $self, @args) = @_;
  my $content = $self->$orig(@args);

  $self->$ct_desugar($content);

  return $content;
};

no Moose::Role;
1;

__END__

=pod

=head1 NAME

Email::MIME::Kit::Role::ManifestDesugarer - helper for desugaring manifests

=head1 VERSION

version 2.091430

=head1 IMPLEMENTING

This role also performs L<Email::MIME::Kit::Role::Component>.

This is a role more likely to be consumed than implemented.  It wraps C<around>
the C<read_manifest> method in the consuming class, and "desugars" the contents
of the loaded manifest before returning it.

At present, desugaring is what allows the C<type> attribute in attachments and
alternatives to be given instead of a C<content_type> entry in the
C<attributes> entry.  In other words, desugaring turns:

    {
      header => [ ... ],
      type   => 'text/plain',
    }

Into:

    {
      header => [ ... ],
      attributes => { content_type => 'text/plain' },
    }

More behavior may be added to the desugarer later.

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


