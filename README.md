## Fast download BLAST databases from NCBI

Database files (volumes) are downloaded in parallel: number of threads to use
is determined automatically. MD5 checksum is verified and the database files
extracted upon download. Database volumes are not downloaded in a particular
order. Downloads are incremental, that is it will only download new data,
provided the `.tar.gz` files have not been deleted.

It is faster than NCBI's `update_blastdb.pl`. But unlike `update_blastdb.pl`,
which is a pure Perl script, it delegates download and checksum verification
to `wget` and `md5sum` and is thus not as universal.

### Installation

    gem install ncbi-blast-dbs

### Usage

#### List available BLAST databases

    ncbi-blast-dbs

#### Download all volumes of a BLAST database

    ncbi-blast-dbs nr

NCBI expects users to submit their email address when downloading data from
their FTP server. To comply with that, download as:

    email="my email address here" ncbi-blast-dbs nr
