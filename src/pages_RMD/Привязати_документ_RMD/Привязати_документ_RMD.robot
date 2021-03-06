*** Settings ***


*** Variables ***


*** Keywords ***
Заповнити поле "Тип прив'язки"
	[Arguments]  ${type_name}
	${type input}  Set Variable  //div[contains(text(),"Тип")]/..//following-sibling::*//input
	Click Element  ${type input}
	${all types popup locator}  Set Variable  //*[@class="dhxcombolist_material" and not(contains(@style,'display: none'))]
	Wait Until Element Is Visible  ${all types popup locator}
	${all items}  Get Text  ${all types popup locator}
	${item index}  Get Index From List  ${all items.split('\n')}  ${type_name}
	Log Many  ${type_name}  ${all items}
	${item locator}  Set Variable  (//*[@class="dhxcombo_option"])[${item index + 1}]
	Wait Until Element Is Visible  ${item locator}
	Click Element  ${item locator}
	${type is}  Get Element Attribute  //input[@type='text' and @autocomplete]  value
	Run Keyword If  '${type is}' != '${type_name}'
	...  Run Keywords
	...  Capture Page Screenshot							AND
	...  Привязати_документ_RMD.Заповнити поле "Тип прив'язки"  ${type_name}



Заповниит поле "Об'єкт"
	[Arguments]  ${object_name}
	${object input}  Set Variable  (//div[contains(text(),"Об'єкт")]/..//following-sibling::*//*[@data-caption="+ Додати"]//input[@type='text'])[1]
	Click Element  ${object input}
	Дочекатись закінчення загрузки сторінки
	Привязати_документ_RMD.Відкрити сторінку "Конструктор бізнес-процесів"
	Привязати_документ_RMD.Вибрати дані за ознакою  Найменування  ${object_name}


Заповнити поле "Бізнес-процес"
	[Arguments]  ${business_process_name}
	${business process input}  Set Variable  //div[contains(text(),"Бізнес-процес")]/../following-sibling::*//*[@data-caption="+ Додати"]//input[@type='text']
	Click Element  ${business process input}
	Дочекатись закінчення загрузки сторінки
	Привязати_документ_RMD.Відкрити сторінку "Конструктор бізнес-процесів"
	Привязати_документ_RMD.Вибрати дані за ознакою  Найменування  ${business_process_name}


Відкрити сторінку "Конструктор бізнес-процесів"
	elements.Дочекатися відображення елемента на сторінці  //*[@id='HelpF10']
	Click Element  //*[@id='HelpF10']
	Дочекатись закінчення загрузки сторінки
	Page Should Contain Element  //*[@class="float-container-header-text" and contains(.,'Конструктор бізнес-процесів.')]


Вибрати дані за ознакою
	[Arguments]  ${feature}  ${text}
	Привязати_документ_RMD.Знайти дані за ознакою  ${feature}  ${text}
	Click Element  //*[@id="Choice"]|//*[text()='Вибір']
	Дочекатись закінчення загрузки сторінки


Знайти дані за ознакою
	[Arguments]  ${feature}  ${text}
	${feature input locator}  Set Variable
	...  (//*[@class="dhxwin_active menuget"]//input)[count(//div[contains(text(), '${feature}')]/ancestor::td[@draggable]/preceding-sibling::*) + 1]
	Click Element  //*[@title="Фільтр"]/div
	Wait Until Element Is Visible  ${feature input locator}
	Input Text  ${feature input locator}  ${text}
	Press Key  ${feature input locator}  \\13
	Дочекатись закінчення загрузки сторінки
	Click Element  //td[text()='${text}']
	Дочекатись закінчення загрузки сторінки


Вибрати документ за назвою
	[Arguments]  ${doc_name}
	staff_RMD.Знайти дані за ознакою  Короткий  ${doc_name}
	${choose checkbox}  Set Variable  //*[@class="material-icons checkbox-row-icon service"]
	elements.Дочекатися відображення елемента на сторінці  ${choose checkbox}
	Click Element  ${choose checkbox}
	Дочекатись закінчення загрузки сторінки
	Click Element  //*[@id="Choice"]|//*[text()='Вибір']
	Дочекатись закінчення загрузки сторінки



