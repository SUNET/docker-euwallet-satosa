The procedure to rebuild this is to do:
check out this repo:

    uv lock --upgrade-package openid4v@git+https://github.com/SUNET/openid4v.git#egg=openid4v  #To upgrade a dependency.
    git add uv.lock
    git commit -m "My big change."
    git tag "stable-2" #optionall if this should go to satosa-test-1.sunet.se
    git push --tags origin
