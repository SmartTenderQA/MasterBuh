*** Keywords ***
Пошук по полю в основному вікні
    [Arguments]  ${field}  ${value}
    ${input}  Set Variable
    ...  (//*[@class="hdr"]//td/input)[count(//*[@data-placeid="DOG"]//div[contains(text(), '${field}')]/ancestor::td[1]/preceding-sibling::*)]
    Input Text  ${input}  ${value}
    Press Key  ${input}  \\13


Активувати вкладку
    [Arguments]  ${title}
    ${status}  Run Keyword And Return Status  Element Should Be Visible  //*[contains(@class,"active-tab")]//td[.="${title}"]
    Run Keyword If  '${status}' == 'False'  Run Keywords
    ...  elements.Дочекатися відображення елемента на сторінці  //td[.="${title}"]  AND
    ...  Click Element  //td[.="${title}"]  AND
    ...  elements.Дочекатися відображення елемента на сторінці  //*[contains(@class,"active-tab")]//td[.="${title}"]


Вибрати рядок "В разрезе аналитик" за номером
    [Arguments]  ${i}
    ${row}  Set Variable  //*[@id="MainSted2PageControl_SPEC_CC"]//tr[contains(@class,"Row")]
    Click Element  (${row})[${i}]
    elements.Дочекатися відображення елемента на сторінці  (${row})[${i}][contains(@class,"selected")]