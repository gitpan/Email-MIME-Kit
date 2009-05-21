package Email::MIME::Kit::Validator::Simplest;
our $VERSION = '2.091410';

use Moose;
with 'Email::MIME::Kit::Role::Validator';

use File::Spec;

has required_fields => (
  reader => 'required_fields',
  writer => '_set_required_fields',
  isa    => 'ArrayRef',
  auto_deref => 1,
);

sub validate {
  my ($self, $stash) = @_;
  
  for my $name ($self->required_fields) {
    confess "required field <$name> not provided" if ! exists $stash->{$name};
  }
}

1;
