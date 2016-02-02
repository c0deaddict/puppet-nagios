define nagios::check::http_url (
  $ensure                   = $::nagios_check_http_url_ensure,
  $host                     = $::nagios::client::host_name,
  $vhost                    = $::nagios::client::host_name,
  $url                      = '/',
  $port                     = 80,
  $extra_args               = '',
  $servicegroups            = $::nagios_check_http_url_servicegroups,
  $check_period             = $::nagios_check_http_url_check_period,
  $contact_groups           = $::nagios::client::service_contact_groups,
  $first_notification_delay = $::nagios::client::first_notification_delay,
  $max_check_attempts       = $::nagios_check_http_url_max_check_attempts,
  $notification_period      = $::nagios_check_http_url_notification_period,
  $use                      = $::nagios::client::service_use,
) {

  nagios::service { "check_http_url_${title}_${host}":
    ensure                   => $ensure,
    check_command            => "check_http_url!${vhost}!${port}!${url}!${extra_args}",
    service_description      => "check_http_url_${title}",
    servicegroups            => $servicegroups,
    check_period             => $check_period,
    contact_groups           => $contact_groups,
    first_notification_delay => $first_notification_delay,
    max_check_attempts       => $max_check_attempts,
    notification_period      => $notification_period,
    use                      => $use,
  }

}
