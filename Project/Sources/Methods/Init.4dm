//%attributes = {}
Form:C1466.mail:=New object:C1471

Form:C1466.numberMails:=10

Form:C1466.spinner:=1

ARRAY TEXT:C222(Attachments; 0)

Form:C1466.mails:=New collection:C1472
Form:C1466.labels:=New object:C1471


ShowBoxInfo(False:C215)
OBJECT SET ENABLED:C1123(*; "attachment_DropdownList"; False:C215)
OBJECT SET ENABLED:C1123(*; "attachment_Button"; False:C215)

var $picture : Picture
READ PICTURE FILE:C678(Folder:C1567(fk resources folder:K87:11).file("DeleteRecord.png").platformPath; $picture)

Form:C1466.deletePicture:=$picture

