# cyrus-sasl-patch

A Patch for cyrus-sasl2 to add a custom auth mechanism.

Credits go to Radu Iulian (underground8).

Description
----------------------------------------
In order to provide a proxying mechanism to SASL-authenticated users, it's
necessary to patch saslauthd. The patch basically consists of adding one
authentication MECHANISM to saslauthd which, in turn, just calls a Perl
script which determines if the authentication was successful.

The patch has been ported to a couple of new versions of cyrus-sasl, and
is currently known to successfully patch cyrus-sasl v2.1.27 (which is,
at the time of this release, the current version which is also offered
via Ubuntu Xenial 16.04 LTS mainline APT repository.

The original sources can be obtained from:
ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-2.1.27.tar.gz

Moreover, there is a build.sh script, which automatically retrieves the
source, patches it, configures it, and build it. However, it does not check
if you have installed all necessary stuff in order to get a successful
build.

Usage
----------------------------------------
Clone this repository to your local machine and run ./build.sh

This will download the cyrus-sasl2 sources, apply the patch and build the deb package.
