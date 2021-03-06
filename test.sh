#!/bin/bash

PERL_CPANM_HOME="`pwd`/thirdparty" \
PERL_CPANM_OPT='--notest --local-lib '"`pwd`/thirdparty" \
perl ./thirdparty/bin/cpanm Devel::Cover::Report::Coveralls

# Fail on a test line that dies so we can notice it
set -e

perl -I./thirdparty/lib/perl5 \
  -MDevel::Cover=+ignore,thirdparty ./t/znapzend.t ./bin/znapzend || test $? == 1
perl -I./thirdparty/lib/perl5 \
  -MDevel::Cover=+ignore,thirdparty ./t/znapzend-daemonize.t ./bin/znapzend || test $? == 1
perl -I./thirdparty/lib/perl5 \
  -MDevel::Cover=+ignore,thirdparty ./t/znapzendzetup.t ./bin/znapzend || test $? == 1
perl -I./thirdparty/lib/perl5 \
  -MDevel::Cover=+ignore,thirdparty ./t/znapzendztatz.t ./bin/znapzend || test $? == 1
perl -I./thirdparty/lib/perl5 \
  -MDevel::Cover=+ignore,thirdparty ./t/autoscrub.t ./bin/znapzend || test $? == 1
