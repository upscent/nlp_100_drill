use Chunk;
use Morph;
use Storable qw( retrieve );

my @text = retrieve "data/53.dat";
foreach my $sentence ( @text ) {
  foreach my $chunk ( @{ $sentence } ) {
    foreach my $src ( @{ $chunk->{srcs} } ) {
      next unless $sentence->[$src]->has_noun && $chunk->has_independent_verb;
      my $moto = $sentence->[$src]->to_text;
      my $saki = $chunk->to_text;
      print "$moto\t$saki\n";
    }
  }
}
