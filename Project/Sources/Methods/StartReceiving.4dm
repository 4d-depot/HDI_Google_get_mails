//%attributes = {}
// Start receiving of the mail list according to the number of mail defined by Form.numberMails
var $listID : Integer
var $param : Object

ARRAY LONGINT:C221($arr; 0)

If (Is a list:C621(Form:C1466.labels.listRef))
	$listID:=Selected list items:C379(Form:C1466.labels.listRef; $arr; *)
	
	// Search the label information of the selected label
	Form:C1466.currentlabel:=Form:C1466.labels.search($listID)
	
	If (Form:C1466.currentlabel#Null:C1517)
		
		If (Form:C1466.currentlabel.id="TRASH")
			OBJECT SET VISIBLE:C603(*; "Column3"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "Column3"; True:C214)
		End if 
		
		// Reset the mail list
		Form:C1466.mails:=New collection:C1472
		
		// Reset the body
		Form:C1466.textBody:=""
		WA SET PAGE CONTENT:C1037(*; "web area"; "<html></html>"; "file:///")
		
		OBJECT SET VISIBLE:C603(*; "Spinner"; True:C214)
		
		// getMails paramters
		$param:=New object:C1471()
		// label containing the emails
		$param.labelIds:=[Form:C1466.currentlabel.id]
		// Number emails returned by the server
		$param.top:=Form:C1466.numberMails
		
		// Start the downoad of the emails
		CALL WORKER:C1389("myWorker"; Formula:C1597(GetMails); Form:C1466.OAuth2Provider; $param; Current form window:C827)
	End if 
End if 