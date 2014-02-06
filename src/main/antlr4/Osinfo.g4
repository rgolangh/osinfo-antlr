grammar Osinfo;

parse : line* EOF ;

line :  COMMENT | EOL | os_record ;

COMMENT : '#' .*? EOL;
os_record : 'os' DOT UNIQUE_OS_NAME DOT attribute DOT key_value EOL;
attribute : ID
          | NAME
          | devices
          | resources
          | plainAttributes;

devices: 'devices' DOT  devices_types ;
devices_types : 'audio' | 'cdInterface' | 'disk' | 'diskInterfaces' | 'display' | 'maxPciDevices' | 'network' | 'watchdog' ;
resources : 'resources' DOT ('minimum' | 'maximum' ) DOT resource_type ;
resource_type : RAM | DISK_SIZE | NUMBER_OF_CPUS ;
plainAttributes: 'bus' | 'cpuArchitecture' | 'derivedFrom' | 'description' | 'family' | 'isTimezoneTypeInteger' | 'name' | 'productKey' | 'resources' | 'sysprepPath' ;
key_value : 'value' (DOT VERSION)? '=' VALUE ;

EOL: '\n' ;
DOT : [\.] ;
UNIQUE_OS_NAME: [a-z0-9_]+ ;
INT : [0-9]+ ;
VERSION : [3][\.][0-5] ;
VALUE : (.)+?  ;
ID : 'id' ;
NAME : 'name' ;

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