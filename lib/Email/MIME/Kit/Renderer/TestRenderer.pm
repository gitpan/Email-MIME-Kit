package Email::MIME::Kit::Renderer::TestRenderer;
{
  $Email::MIME::Kit::Renderer::TestRenderer::VERSION = '2.102012';
}
use Moose;
with 'Email::MIME::Kit::Role::Renderer';
# ABSTRACT:  extremely simple renderer for testing purposes only


sub render {
  my ($self, $content_ref, $stash) = @_;

  my $output = $$content_ref;
  for my $key (sort %$stash) {
    $output =~
      s<\[%\s+\Q$key\E(?:(?:\.(\w+))?\((.*?)\))?\s+%\]>
      [ defined $2
        ? ($1 ? $stash->{$key}->$1(eval $2) : $stash->{$key}->(eval $2))
        : $stash->{$key}
      ]ge;
  }

  return \$output;
}

no Moose;
1;

__END__

=pod

=head1 NAME

Email::MIME::Kit::Renderer::TestRenderer - extremely simple renderer for testing purposes only

=head1 VERSION

version 2.102012

=head1 DESCRIPTION

The test renderer is like a version of Template Toolkit 2 that has had a crayon
shoved up its nose and into its brain.  It can only do a very few things, but
it does them well enough to test simple kits.

Given the following template:

  This will say "I love pie": [% actor %] [% m_obj.verb() %] [% z_by("me") %]

...and the following set of variables:

  {
    actor => 'I',
    m_obj => $object_whose_verb_method_returns_love,
    z_by  => sub { 'me' },
  }

..then it will be a true statement.

In method calls, the parens are B<not> optional.  Anything between them (or
between the parens in a coderef call) is evaluated like perl code.  For
example, this will actually get the OS:

  [% z_by($^O) %]

=head1 WARNING

Seriously, this is horrible code.  If you want, look at it.  It's swell for
testing simple things, but if you use this for real mkits, you're going to be
upset by something horrible soon.

=head1 AUTHOR

Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
