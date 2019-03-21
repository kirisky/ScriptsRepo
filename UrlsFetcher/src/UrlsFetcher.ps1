# Set-ExecutionPolicy Bypass -Scope Process -Force

$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession

# CIsForCookie_OPS = "XJKkM@HbJrPxe4RgurjmdgAAAEY"
$cookie = New-Object System.Net.Cookie
$cookie.Name = "CIsForCookie_OPS"
$cookie.value = "XJKkM@HbJrPxe4RgurjmdgAAAEY"
$cookie.Domain = "n5eil01u.ecs.nsidc.org"
$session.Cookies.Add($cookie)

# f5_cspm = 1234
$cookie = New-Object System.Net.Cookie
$cookie.Name = "f5_cspm"
$cookie.Value = 1234
$cookie.Domain = "n5eil01u.ecs.nsidc.org"
$session.Cookies.Add($cookie)

# f5avr0039763557aaaaaaaaaaaaaaaa = "ABOKEECAAPLOEHLBDKDGCDNEDLFHGNDPCGOPENNEFOKBOAIDFMFJNEJIEMEJCPMGFGJCKNGHEFFPIAADJANADJAFAINFCBFIPCJJCBGAOKCMKKGKNOJPDPFFIGOLFKFH"
$cookie = New-Object System.Net.Cookie
$cookie.Name = "f5avr0039763557aaaaaaaaaaaaaaaa"
$cookie.Value = "ABOKEECAAPLOEHLBDKDGCDNEDLFHGNDPCGOPENNEFOKBOAIDFMFJNEJIEMEJCPMGFGJCKNGHEFFPIAADJANADJAFAINFCBFIPCJJCBGAOKCMKKGKNOJPDPFFIGOLFKFH"
$cookie.Domain = "n5eil01u.ecs.nsidc.org"
$session.Cookies.Add($cookie)

$baseUrl = "https://n5eil01u.ecs.nsidc.org/GLAS/GLAH14.034/"

$urlContainer = New-Object System.Collections.ArrayList

for ($year = 3; $year -le 9; $year++)
{
    $yearOfUrl = "200" + $year
    
    for ($month = 1; $month -le 12; $month++)
    {
        if ($month -lt 10)
        {
            $monthOfUrl = $yearOfUrl + (".0" + $month)
        } else {
            $monthOfUrl = $yearOfUrl + ("." + $month)
        }

        for ($day = 1; $day -le 31; $day++)
        {
            if ($day -lt 10)
            {
                $dayOfUrl = $monthOfUrl + (".0" + $day)
            } else {
                $dayOfUrl = $monthOfUrl + ("." + $day)
            }

            $urlContainer.Add($baseUrl + $dayOfUrl + "/");
        }
    }   
}


$urlList = [System.Text.StringBuilder]::new()

for ($i = 0; $i -lt $urlContainer.Count; $i++)
{
    try {
        echo ("Start to visit the directory number " + $i)
        $web = Invoke-WebRequest ($urlContainer[$i]) -WebSession $session -UserAgent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.81 Safari/537.36'
        if ($web.StatusCode -eq 200)
        {
            $NodeList = $web.ParsedHtml.querySelectorAll("#indexlist .indexcolname a")
            for ($j = 2; $j -lt $NodeList.Length; $j++)
            {
                $NodeList.item($j) | ForEach-Object {
                    if ($_.InnerHtml -like '*.H5' -or $_.InnerHtml -like "*.xml")
                    {
                        $urlList.AppendLine($urlContainer[$i] + $_.InnerHtml)
                    }
                }
            }
            # $web.Content | Out-File "./test.html"
        }
    } catch {
        echo ("Directory number " + $i + " is not available!")
    }
}

$urlList.ToString() | Out-File urls.txt




