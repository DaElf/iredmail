#!/bin/sh
#(cd fbsd_ports; env FLAVORS=py27 __MAKE_CONF=`pwd`/../fbsd_make.conf BATCH= PACKAGE_BUILDING= make fetch-recursive)
(cd fbsd_ports;  env FLAVORS=py27 WITH_CCACHE_BUILD=yes __MAKE_CONF=`pwd`/../fbsd_make.conf BATCH= PACKAGE_BUILDING= FORCE_PKG_REGISTER= make all)
(cd fbsd_ports;  env FLAVORS=py27 WITH_CCACHE_BUILD=yes __MAKE_CONF=`pwd`/../fbsd_make.conf BATCH= PACKAGE_BUILDING= FORCE_PKG_REGISTER= make package-recursive)
