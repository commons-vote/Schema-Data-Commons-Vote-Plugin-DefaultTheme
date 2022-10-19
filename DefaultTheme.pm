package Schema::Data::Commons::Vote::Plugin::DefaultTheme;

use base qw(Schema::Data::Plugin);
use strict;
use warnings;

use Activity::Commons::Vote::Load;
use Backend::DB::Commons::Vote;
use Error::Pure qw(err);
use Readonly;
use Unicode::UTF8 qw(decode_utf8);

Readonly::Array our @COMMONS_IMAGES => (
	'Wehranlage Grosshesselohe XL.jpg',
	'Oberaargletscher from Oberaar, 2010 07.JPG',
	decode_utf8('Weil am Rhein - Dreiländerbrücke10.jpg'),
	'Hoodoos in the Bryce Canyon National Park.jpg',
	'Elisabethkirche Schneeberg color corr.jpg',
	'Metz Porte des Allemands R07.jpg',
	'Chevaux estive Pyrenees.jpg',
	'Madinat Jumeirah-Dubai3303.JPG',
	'QC - Ufer Sankt Lorenzstrom bei Kamouraska.jpg',
	'Great Fountain Geyser Sunset.jpg',
	'Pontederia cordata 4 PP.jpg',
	'Colosseo di Roma panoramic.jpg',
	decode_utf8('Lac du Milieu de Bastan Hautes Pyrénées 02 BLS.JPG'),
	'Rock face, Ruby Beach, Olympic National Park, Washington State, 1992.JPG',
	'NGC 2683 Spiral galaxy.jpg',
	'Durdle Door Overview.jpg',
	'Crepuscular rays at Sunset near Waterberg Plateau.jpg',
	'2012-03-14 21-42-55-file-etoiles-14f-2min-3d.jpg',
	decode_utf8('Laufener Hütte (Juni 2012).JPG'),
	'Salar de Atacama.jpg',
	'Hohenschwangau - Schloss Neuschwanstein1.jpg',
	'Lanzarote 3 Luc Viatour.jpg',
	decode_utf8('Autignac, Hérault 01.jpg'),
	'13-09-29-nordfriesisches-wattenmeer-RalfR-05.jpg',
	'NGC6960.jpg',
	decode_utf8('Eesti põhjarannik.jpg'),
	'View to Geiranger from Flydalsjuvet, 2013 June.jpg',
	'Sunrise at viru bog.jpg',
	'Heart and Soul nebulae.jpg',
	decode_utf8('Albarracín, Teruel, España, 2014-01-10, DD 051.JPG'),
	'Spaso-Kamenny Monastery 2013.jpg',
	'Valley View Yosemite August 2013 002.jpg',
	'Hellamaa panoraam.jpg',
	decode_utf8('Amanecer en Huitzila, México, 2013-10-10, DD 01.JPG'),
);

our $VERSION = 0.01;

sub load {
	my ($self, $variables_hr) = @_;

	my $backend = Backend::DB::Commons::Vote->new(
		'schema' => $self->{'schema'},
	);

	my $creator = $backend->fetch_person({
		'email' => $variables_hr->{'creator_email'},
		'name' => $variables_hr->{'creator_name'},
		'wm_username' => $variables_hr->{'creator_wm_username'},
	});

	if (! defined $creator) {
		err 'No creator.';
	}

	my $load = Activity::Commons::Vote::Load->new(
		'backend' => $backend,
		'creator' => $creator,
		'verbose_cb' => $self->{'verbose_cb'},
	);

	foreach my $commons_image (@COMMONS_IMAGES) {
		$load->load_commons_image($commons_image);
	}

	return;
}

sub supported_versions {
	my $self = shift;

	return (
		'0.01',
	);
}

1;

__END__
