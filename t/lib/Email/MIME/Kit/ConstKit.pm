package Email::MIME::Kit::ConstKit;
our $VERSION = '2.093070';


use Moose;
with 'Email::MIME::Kit::Role::KitReader';

sub get_kit_entry {
  my ($self, $path) = @_;
  return \$path;
}

no Moose;
1;
