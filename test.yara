import "pe"
/*
   Test multi-line comment
*/
// Test single-line comment
rule WildcardExample
{
    meta:
        // Useful meta information examples to add
        description = "Test"
        author = "Test"
        reference = "http://www.infosec-intern.com"
        os = "mswindows"
        filetype = "pe"
        maltype = "trojan"
        date = "2016-06"

    strings:
        $true = true
        $false = false
        $hex_string = { E2 34 ?? C8 A? FB [2-4] }
        $hex_string2 = { F4 23 ( 62 B4 | 56 ) 45 }
        $dstring = "double string" wide nocase fullword
        $reg_ex = /md5: [0-9a-zA-Z]{32}/

    condition:
        $hex_string
        for any of ($a,$b,$c) : ( $ )
        17 or none of them
        filesize < 200MB
        #dstring == 8
        @dstring[1]
}