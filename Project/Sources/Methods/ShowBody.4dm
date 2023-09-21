//%attributes = {}
#DECLARE($mail : Object)
// Display the email body
// $mail: mail object return by gmail

var $subPart : Object
var $body:="<html></html>"

If ($mail#Null:C1517)
	
	For each ($subPart; $mail.bodyStructure.subParts)
		If (($subPart.type="text/plain") || ($subpart.type="text/html"))
			$body:=$mail.bodyValues[$subPart.partId].value
			If ($subpart.type="text/html")
				break
			End if 
		End if 
		
	End for each 
	
	WA SET PAGE CONTENT:C1037(*; "web area"; $body; "file:///")
	
End if 