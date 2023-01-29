function Get-Carspecs {
    param (
        [string]
        [ValidateSet('Base', 'Premium', 'Limited')]    
        $Class
    )
    
    
    $CrossTrekSpecs = [ordered]@{
        
        Class     = $Class
        Year      = '2016'  
        SUV       = 'True'
        AWD       = 'True'
        Bluetooth = 'True'
        
    }
    
    $Premium = @{
    
        'Heated Seats' = 'True'
        'Moon roof'    = 'True'
        'Remote Start' = 'True'
    }

    $Limited = @{
    
        'Leather Seats'         = 'True'
        'NFC'                   = 'True'
        'Power Seats'           = 'True'
        'Heated Steering Wheel' = 'True'
    }




    switch ($Class) {
        "Premium" {  
        
            $CrossTrekSpecs += $Premium
        
        }
        "Limited" {
        
            $CrossTrekSpecs += $Premium
            $CrossTrekSpecs += $Limited
        }
    }

    $CrossTrekSpecs
}