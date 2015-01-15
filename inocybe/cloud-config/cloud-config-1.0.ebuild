# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

SLOT="0"

DESCRIPTION="A classical example to use when starting on something new."
HOMEPAGE="http://wiki.gentoo.org/index.php?title=Basic_guide_to_write_Gentoo_Ebuilds"
inherit toolchain-funcs systemd

LICENSE="MIT"
#KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-usr"

if [[ "${PV}" == 9999 ]]; then
    KEYWORDS="~amd64"
else
    #CROS_WORKON_COMMIT="49e0dff2b8529801beb09164729caf96a5b93ef0" # v0.4.6
    KEYWORDS="amd64"
fi

src_unpack() {
	mkdir cloud-config-1.0
}

src_install() {
	insinto /usr/share/oem/
	doins "${FILESDIR}"/cloud-config.yml

	insinto /usr/share/coreos/
        doins "${FILESDIR}"/update.conf
}