*** Settings ***
Library                                SeleniumLibrary

*** Variables ***
${url}                                  https://blogdoagi.com.br/

*** Keywords ***
Abrir o navegador
    Open Browser                        browser=chrome
    Maximize Browser Window
Fechar o navegador
    Close Browser
Acessar a home page do site blogdoagi.com.br
    Go To                               url=${URL}
    Wait Until Page Contains Element    locator=//div[contains(@id,'site-branding')]
    Title Should Be                     title=Blog do Agi
Acionar o ícone lupa
    Wait Until Page Contains Element    locator=//button[@id='search-open']
    Click Button                        locator=//button[@id='search-open']
Validar apresentação do campo de Pesquisa e o botão de pesquisar
    Wait Until Page Contains Element    locator=//div[@class='desktop-search'][contains(.,'Pesquisar por:')]
    Page Should Contain Element         locator=(//input[contains(@type,'submit')])[1]
Digitar o texto "Letras Financeiras Públicas" no campo pesquisar
    Input Text                          locator=(//input[contains(@type,'search')])[1]    text=Letras Financeiras Públicas
    Click Element                       locator=(//input[contains(@type,'submit')])[1]
Validar se o texto é apresentado na página
    Wait Until Page Contains            text=Letras Financeiras Públicas

