rule PK_PayPal_system : Paypal
{
    meta:
        description = "Phishing Kit impersonating Paypal"
        licence = "AGPL-3.0"
        author = "Thomas 'tAd' Damonneville"
        reference = ""
        date = "2024-11-26"
        comment = "Phishing Kit - Paypal - 'Victim System'"

    strings:
        // the zipfile working on
        $zip_file = { 50 4b 03 04 }
        // specific directory found in PhishingKit
        $spec_dir = "GO"
        $spec_dir2 = "IMGG"
        $spec_dir3 = "store"
        // specific file found in PhishingKit
        $spec_file = "action1.php"
        $spec_file2 = "xppx.css"
        $spec_file3 = "tg.php"
	    $spec_file4 = "actionsss.php"
        $spec_file5 = "pp_favicon_x.ico"

    condition:
        // look for the ZIP header
        uint32(0) == 0x04034b50 and
        // make sure we have a local file header
        $zip_file and
        // check for file
        all of ($spec_file*) and 
	    all of ($spec_dir*)
}
