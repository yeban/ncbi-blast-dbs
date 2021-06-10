## Fast download BLAST databases from NCBI

Database files (volumes) are downloaded in parallel: number of threads to use
is determined automatically. MD5 checksum is verified and the database volume
extracted upon download.  Database volumes are not downloaded in a particular
order. The volumes are updated if a newer version is available on the server,
or re-downloaded if corrupt. Aborted downloads are safely resumed.

`ncbi-blast-dbs` is faster than NCBI's `update_blastdb.pl`. But unlike
`update_blastdb.pl`, which is a pure Perl script, `ncbi-blast-dbs` delegates
download and checksum verification to `wget` and `md5sum` / `md5` and is thus
not as universal.

### Installation

    gem install ncbi-blast-dbs

### Usage

#### List available BLAST databases

    ncbi-blast-dbs

#### Download all volumes of a BLAST database

    ncbi-blast-dbs nt nr

Databases are downloaded one after the other. Volumes of each database are
downloaded in parallel. Downloads are placed in the current directory.

NCBI expects users to submit their email address when downloading data from
their FTP server. To comply with that, download as:

    email="my email address here" ncbi-blast-dbs nr
