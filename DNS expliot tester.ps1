#Unhash install-module and hash Import-module in server 2019
#Install-Module PSWindowsUpdate
Import-Module PSWindowsUpdate
## to get restriction polcey set to unristricted and change back after script is run.
### download PSwindowsupdate module


$winver = (Get-wmiobject -class win32_OperatingSystem| foreach-object -MemberName Caption)

echo "Your Windows Version Is: '$winver'"

if ($winver -eq 'Microsoft Windows 10 pro') {

    Echo "Windows 10 Baby"
    $kb = "KB4565632"

}

elseif ($winver -eq 'Microsoft Windows Server 2012 R2 Standard') {
    echo "Server 2012 R2 Standard"
    $kb = 'KB4565541'
}

elseif ($winver -eq 'Microsoft Windows Server 2016 Standard') {
    echo "Server 2016 Standard"
    $kb = 'KB4565511' 

}

elseif ($winver -eq 'Microsoft Windows Server 2016 Essentials'){
    echo "Server 2016 Essential"
    $kb = 'KB4565511'
}

elseif ($winver -eq 'Microsoft Windows Server 2019 Standard') {
    echo " Server 2019 Standard"
    $kb = 'KB4558998'
}
else {
echo "Script not Suported For your Version of Windows"

}

$result = Get-HotFix | where-object {$_.HotFixID -eq $kb}
    if ($result) {

    echo "KB '$kb'Installed"}

    else {
    echo "'$kb' is not Installed"
    $update = (read-host 'would you like to update y/n') }

        if ($update -eq 'y') {
        #Check & install updates
        echo 'Checking Windows Updates!!!'
        Get-windowsUpdate
        echo 'Installing Windows Updates'
        Install-WindowsUpdate 
        }

      

    


