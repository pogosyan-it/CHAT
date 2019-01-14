#!/usr/bin/env perl

use strict;
use DBI;

my $user = 'root';
my $pass = '2me32jvppn';

my $conn = 'DBI:mysql:gsotldb:10.10.1.2';
my $dbh  = DBI->connect($conn,$user,$pass) || die $!;

my $query = q{select d15_departures.WayBillNum
                FROM d15_departures 
           left join log_edit 
                  on log_edit.FieldID = d15_departures.ID 
           left join hb_employee 
                  on log_edit.SY_MembID = hb_employee.ID 
               WHERE log_edit.lValues like '%WarehousID== 0%' 
                 and log_edit.Created_Time 
             between NOW() - Interval 360 hour 
                 and NOW() - Interval 48 hour 
                 and log_edit.TablID = 15 
                 and d15_departures.SY_Void = 0
              };

my $sth = $dbh->prepare($query) || die $!;
chomp(my $curdate = `date \+\%Y-\%m-\%d`); 
my $filename = "$curdate"."_New_Manifest.txt";

open(OUT, ">$filename") || die $!;
$sth->execute();
while(my $bill_num = $sth->fetchrow) {
   print OUT "$bill_num\n";
}
print OUT "Ervand -servant - pedant\n";
close(OUT);

`echo "TEST 1" | mail -s "Svoi text" -a "$filename" "it\@int.dmcorp.ru"`;

 