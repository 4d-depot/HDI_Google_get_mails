//%attributes = {}
// Move the selected mail in the trash

var $status : Object
var $permanently : Boolean:=False:C215

CONFIRM:C162("Move this email to the trash?")

If (Bool:C1537(OK))
	
	// Move the selected mail to the trash
	$status:=cs:C1710.NetKit.Google.new(Form:C1466.OAuth2Provider).mail.delete(Form:C1466.mail.id; $permanently)
	
	If ($status.success)
		// remove the mail in the UI
		Form:C1466.mails.remove(Form:C1466.mails.indexOf(Form:C1466.mail))
		ALERT:C41("The message had been moved to the trash")
	Else 
		ALERT:C41("Error: "+$status.statusText)
	End if 
	
End if 