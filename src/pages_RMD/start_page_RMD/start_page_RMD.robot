*** Settings ***
Documentation			Пейджа для стартової сторінки, яка відкривається після авторизації  http://joxi.ru/EA43J8BcwV1032


*** Variables ***


*** Keywords ***
Натиснути "Завдання і документи"
	${tasks and docs btn}  Set Variable  //*[contains(@class,'splitter-panel')]//*[contains(text(),'Завдання і документи')]
	Wait Until Element Is Visible  ${tasks and docs btn}  5
	Click Element  ${tasks and docs btn}
	Дочекатись закінчення загрузки сторінки RMD