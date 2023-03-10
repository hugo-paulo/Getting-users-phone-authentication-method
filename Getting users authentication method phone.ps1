
Connect-MgGraph

Select-MgProfile -Name "beta"

$userId = "user obj id"

$userAuthMethod = Get-MgUserAuthenticationMethod -UserId $userId


#https://learn.microsoft.com/en-us/graph/api/resources/authenticationstrengths-overview?view=graph-rest-beta&viewFallbackFrom=graph-rest-1.0
#https://learn.microsoft.com/en-us/graph/api/resources/user?view=graph-rest-1.0

$userAuthMethod = Get-MgUserAuthenticationPhoneMethod -UserId $userId
#https://learn.microsoft.com/en-us/graph/api/authentication-list-phonemethods?view=graph-rest-beta&tabs=powershell (good for a use)

# so can right a script to get all users then use the id to check if the have a phone number set 

# and can use this to set one
$params = @{
	PhoneNumber = "+1 2065555554"
	PhoneType = "mobile"
}

Update-MgUserAuthenticationPhoneMethod -UserId $userId -PhoneAuthenticationMethodId $phoneAuthenticationMethodId -BodyParameter $params

#https://learn.microsoft.com/en-us/graph/api/phoneauthenticationmethod-update?view=graph-rest-beta&tabs=powershell


#use this command to filter user with mobile phone as default MFA method
Get-MgReportAuthenticationMethodUserRegistrationDetail -all


#Link on throttling limits for MS Grah
https://github.com/microsoftgraph/microsoft-graph-docs/blob/main/concepts/throttling-limits.md
