  vpn { "access.mikkonen.biz":
    provider            => 'endpoint',
    access_point        => 'access.mikkonen.biz',
    authentication_type => 'securIDKeyFob',
    ensure => absent
  }
