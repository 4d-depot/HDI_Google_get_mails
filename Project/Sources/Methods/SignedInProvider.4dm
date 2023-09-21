//%attributes = {}
#DECLARE : cs:C1710.NetKit.OAuth2Provider
// Returns the object that contains all the information for the OAuth2 connection 

var $param : Object

$param:=New object:C1471()
$param.name:="Google"
$param.permission:="signedIn"
$param.clientId:="770693288208-qe3655ljq7lvk30m9b5kc5ccoa7u78qa.apps.googleusercontent.com"
$param.clientSecret:="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"
$param.redirectURI:="http://127.0.0.1:50993/authorize/"
$param.scope:="https://www.googleapis.com/auth/gmail.modify"

// Successful authentication page
$param.authenticationPage:=Folder:C1567(fk web root folder:K87:15).file("authentication.htm")
// Error authentication page
$param.authenticationErrorPage:=Folder:C1567(fk web root folder:K87:15).file("error.htm")

// Create new OAuth2 object
return cs:C1710.NetKit.OAuth2Provider.new($param)