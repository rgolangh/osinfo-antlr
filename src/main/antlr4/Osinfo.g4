grammar Osinfo;

parse : line* EOF;

line : COMMENT
     | osRecord
     | NEWLINE ;

COMMENT :  '#' ~('\r' | '\n')* NEWLINE;
osRecord : OS DOT UNIQUE_OS_ID DOT attribute DOT pair NEWLINE;
OS : 'os' ;

attribute : 'id'
          | 'name'
          | devices
          | resources
          | general;

devices: 'devices' DOT  device_typs ;
device_typs : 'audio'
            | 'cdInterface'
            | 'disk'
            | 'diskInterfaces'
            | 'display'
            | 'maxPciDevices'
            | 'network'
            | 'watchdog' ;

resources : 'resources' DOT ('minimum' | 'maximum' ) DOT resource_type;
resource_type : RAM | DISK_SIZE | NUMBER_OF_CPUS ;
general: 'bus'
       | 'cpuArchitecture'
       | 'derivedFrom'
       | 'description'
       | 'family'
       | 'isTimezoneTypeInteger'
       | 'productKey'
       | 'resources'
       | 'sysprepPath' ;

pair : 'value' (DOT VERSION)? WS* '=' WS* VALUE ;

DOT : '.' ;
UNIQUE_OS_ID: [a-z0-9]+ ;
INT : [0-9] ;
VERSION : [3][\.][0-5] ;
VALUE :~('\r'|'\n')+ ;

DERIVED_FROM : 'derivedFrom';
CPU_ARCHITECTURE : 'cpuArchitecture';
BUS : 'bus';
SYSPREP_PATH : 'sysprepPath';
PRODUCT_KEY : 'productKey';

AUDIO : 'audio';
CD : 'cdInterface';
DISK : 'disk';
DISK_INTERFACE : 'diskInterfaces';
DISPLAY : 'display';
MAX_PCI_DEVICES : 'maxPciDevices';
NETWORK : 'network';
WATCHDOG : 'watchdog';

RAM: 'ram';
DISK_SIZE: 'diskSize';
NUMBER_OF_CPUS: 'numberOsCpus';

NEWLINE : '\r'? '\n' | '\r' ;
WS : [ \t\r\n]+ -> skip ;
