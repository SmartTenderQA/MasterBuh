*** Settings ***


*** Variables ***
${add doc popup}				//*[@id="TBCASE____SHIFT-F7popup-menu"]


*** Keywords ***
Відкрити випадаючий список "Додати документ"
	${add doc btn}  Set Variable  //div[@title='Додати документ (Shift+F7)']
	Wait Until Page Contains Element  ${add doc btn}
	Click Element  ${add doc btn}
	Wait Until Element Is Visible  ${add doc popup}


Вибрати тип документа за назвою
	[Arguments]  ${doc_type}
	Wait Until Element Is Visible  ${add doc popup}
	Click Element  ${add doc popup}//*[contains(text(),'${doc_type}')]
	Дочекатись закінчення загрузки сторінки RMD


Натиснути
	[Arguments]  ${text}
	${locator}  Set Variable  //*[contains(@title,'${text}')]//*[@class="split-button-container"]
	Click Element  ${locator}
	Дочекатись закінчення загрузки сторінки RMD


Відкрити папку завдань і документів за назвою
	[Arguments]  ${folder_name}
	${locator}  Set Variable  //*[@title='${folder_name}']
	Wait Until Element Is Visible  ${locator}  3
	Click Element  ${locator}
	Дочекатись закінчення загрузки сторінки RMD


Відкрити документ за змістом
	[Arguments]  ${text}
	${locator}  Set Variable
	...  //*[@class="objbox selectable objbox-scrollable"]//table[@class="obj"]/tbody/tr[contains(.,"${text}")]
	Wait Until Element Is Visible  ${locator}  3
	Click Element  ${locator}
	Click Element  ${locator}
	Дочекатись закінчення загрузки сторінки RMD


Заповнити поле зауваження
	[Arguments]  ${text}
	${remark window locator}  Set Variable  //*[@class="dhxwin_active menuget"]
	Wait Until Keyword Succeeds  5s  1s  Element Should Be Visible  ${remark window locator}
	Page Should Contain Element  ${remark window locator}//*[contains(@class,'header-text') and text()='Зауваження']
	Select Frame  ${remark window locator}//iframe
	Wait Until Keyword Succeeds  30  5  tasks_RMD.Ввести текст зауваження  ${text}
	Unselect Frame


Ввести текст зауваження
	[Arguments]  ${text}
	Click Element  //body
	Input Text  //body  ${text}
	${got text}  Get Text  //body
	Should Be Equal As Strings  ${got text}  ${text}


В панелі інструментів для фрейма документа натиснути
	[Arguments]  ${btn_name}
	${panel locator}  Set Variable  //*[@class="frame-header"]
	Wait Until Element Is Visible  ${panel locator}
	Click Element  ${panel locator}//*[contains(text(),'${btn_name}')]/..
	Дочекатись закінчення загрузки сторінки RMD