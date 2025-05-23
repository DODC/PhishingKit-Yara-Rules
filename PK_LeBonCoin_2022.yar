rule PK_LeBonCoin_2022 : LeBonCoin
{
    meta:
        description = "Phishing Kit impersonating Le Bon Coin"
        licence = "AGPL-3.0"
        author = "Thomas Damonneville"
        reference = ""
        date = "2024-10-25"
        comment = "Phishing Kit - LeBonCoin - 'Mirrored from ... Tue, 16 Feb 2022 23:04:58 GMT'"

    strings:
        // the zipfile working on
        $zip_file = { 50 4b 03 04 }
        // specific directory found in PhishingKit
        $spec_dir = "assets"
        // specific file found in PhishingKit
        $spec_file = "info-bancaire.php"
        $spec_file2 = "virement.php"
        $spec_file3 = "access-mail.php"
        $spec_file4 = "page.c9a650b6b85d7c2bdddc.css"
        $spec_file5 = "lbclogo.svg"

    condition:
        // look for the ZIP header
        uint32(0) == 0x04034b50 and
        // make sure we have a local file header
        $zip_file and
        all of ($spec_dir*) and 
        // check for file
        all of ($spec_file*)
}
