# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby25 ruby26 ruby27"
RUBY_FAKEGEM_EXTRAINSTALL="app"

inherit ruby-fakegem

DESCRIPTION="Framework to provide an easy way to implement CMS Scanners"
HOMEPAGE="https://github.com/wpscanteam/CMSScanner"

KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0"

ruby_add_rdepend "
	dev-ruby/get_process_mem
	>=dev-ruby/nokogiri-1.10.8
	=dev-ruby/opt_parse_validator-1.8*
	>=dev-ruby/public_suffix-4.0.3:4
	>=dev-ruby/ruby-progressbar-1.10.0
	>=dev-ruby/sys-proctable-1.2.2
	dev-ruby/typhoeus:1
	=dev-ruby/xmlrpc-0.3*
	>=dev-ruby/yajl-ruby-1.4.1
"

each_ruby_prepare() {
	#relax deps
	sed -i -e '/typhoeus/,/Gem::Dependency/ s:~>:>=:' ../metadata || die
}
