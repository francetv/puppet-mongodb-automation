#!/usr/bin/perl
use warnings;
use strict;
use Daemon::Control;
my $process=2;
exit Daemon::Control->new(
name        => "MMS agent",
lsb_start   => '$syslog $remote_fs',
lsb_stop    => '$syslog',
scan_name   => 'qr|/mongodb-mms-automation-agent|',
lsb_sdesc   => 'Controleur MMS-automation',
lsb_desc    => 'Controleur MMS-automation-2',
user        => 'mms',
group       => 'mms',
path        => '/opt/mms-automation',
directory   => '/opt/mms-automation',
program     => '/opt/mms-automation/mongodb-mms-automation-agent',
program_args => [ '> /dev/null 2>&1' ],
pid_file    => '/tmp/mms_automation.pid',
stderr_file => '/tmp/mms_automation.out',
stdout_file => '/tmp/mms_automation.out',
fork        => $process,
)->run;
