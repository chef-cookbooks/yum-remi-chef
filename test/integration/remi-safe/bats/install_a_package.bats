@test "verify repository files exist" {
    [ -e "/etc/yum.repos.d/epel.repo" ] || cat /etc/redhat-release | grep ^Fedora
    [ ! -e "/etc/yum.repos.d/remi-debuginfo.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-dev.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php55-debuginfo.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php55.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php56-debuginfo.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php56.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php70-debuginfo.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php70-test-debuginfo.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php70-test.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-php70.repo" ]
    [ -e "/etc/yum.repos.d/remi-safe.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-test-debuginfo.repo" ]
    [ ! -e "/etc/yum.repos.d/remi-test.repo" ]
    [ ! -e "/etc/yum.repos.d/remi.repo" ]
}

@test "install a package" {
    yum install -y php
}

@test "verify expected version" {
    expected_version='NaN'
    if grep -E 'CentOS[^0-9]*6' /etc/redhat-release; then
        expected_version='5.3'
    elif grep -E 'CentOS[^0-9]*7' /etc/redhat-release; then
        expected_version='5.4'
    fi
    php --version | grep "^PHP ${expected_version}"
}