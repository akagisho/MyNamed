# MyNamed

MyNamed is a prototype of a DNS server powered by perl.

## 1. Setup

Install  dependent modules.

    $ carton install

## 2. Usage

Start server.

    $ PERL5LIB=local/lib/perl5 ./mynamed.pl

Query.

    $ dig -p 5053 @127.0.0.1 example.com. txt
