# -*- coding: utf-8 -*-
@jira.QANOV-1244
Feature: In-app onboarding

  Actions Before the Feature:
    Given in-app messages is "enabled"

  Actions After the Feature:
    Given in-app messages is "disabled"


  @jira.QANOV-27037 @android @automation.pending_env @har @ios @jira.cv.11.14 @manual @mobile @netcracker @o2uk @sanity
  Scenario: MyO2 user can see the In-app onboarding on the first login
    other_affected_versions="2020-43"
    internal_checkpoint="To test on PROD env."
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
     Then the "In App Message" page is displayed
      And the "Welcome to My O2" header is displayed
      And the "welcome" textfield with "Great to have you on board. Let's take a look at all the things you're going to love about the app." text is displayed
      And the "card_button" button with "Next" text is displayed
      And the "close_button" button is displayed

  @jira.QANOV-27038 @android @ios @jira.cv.11.14 @live @manual @mobile @netcracker @next @o2uk @regression
  Scenario: Onboarding works after deleting the user from Profile for MyO2
    other_affected_versions="2020-43"
    internal_checkpoint="To test on PROD env. Provisioning of the user after deletion can take a while, around 4 or 5 hours"
    Given user is in the "Security And Privacy" page
     When clicks on the "delete_account_entrypoint" entrypoint
      And the "Delete Account" page is displayed
      And clicks on the "delete_my_my_o2_account_button" button
      And the "Deletion Reason" page is displayed
      And clicks on the "other_reason_checkbox" button
      And clicks on the "confirm_deletion_button" button
      And the "Account Deletion Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Splash Screen" page is displayed
      And logs in the application
     Then the "In App Message" page is displayed
      And the "card_title" textfield with "Welcome to My O2" text is displayed
      And the "card_description" textfield with "Great to have you on board. Let's take a look at all the things you're going to love about the app." text is displayed
      And the "next_card_button" button with "Next" text is displayed
      And the "close_button" button is displayed

  @jira.<jira_id> @android @automation.pending_env @ios @jira.cv.11.14 @jira.link.depends_on.QANOV-27037
  @jira.link.depends_on.QANOV-27038 @manual @mobile @o2uk @regression
  Scenario Outline: MyO2 user can continue In-app onboarding from the first card to the second
    other_affected_versions="2020-43"
    internal_checkpoint="To test on PROD env."
    Given user has a "<account_type>" account type
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
     Then the "<card_title>" header is displayed
      And the "card_image" image is displayed
      And the "card_description" textfield with "<card_description>" text is displayed
      And the "next_card_button" button with "Next" text is displayed
      And the "close_button" button is displayed

    Examples:
          | account_type | card_title              | card_description                                                                                  | jira_id     |
          | PAYM         | Your own digital helper | Meet Aura, your new personal assistant. Need a hand? Just say the words and Aura's got your back. | QANOV-27039 |
          | prepay       | Easy top-ups            | Low on credit? No need to pop to the shops. The quickest and easiest way to top up is right here. | QANOV-27040 |

  @jira.<jira_id> @android @automation.pending_env @ios @jira.cv.11.14 @jira.link.depends_on.QANOV-27037
  @jira.link.depends_on.QANOV-27038 @manual @mobile @o2uk @regression
  Scenario Outline: MyO2 user can continue In-app onboarding from the second card to the third
    other_affected_versions="2020-43"
    internal_checkpoint="To test on PROD env."
    Given user has a "<account_type>" account type
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
     Then the "<card_title>" header is displayed
      And the "card_image" image is displayed
      And the "card_description" textfield with "<card_description>" text is displayed
      And the "next_card_button" button with "Next" text is displayed
      And the "close_button" button is displayed

    Examples:
          | account_type | card_title                | card_description                                                                                    | jira_id     |
          | PAYM         | Gel all the info you need | Check your data, see your bill, and much more. With everything in one place, it couldn't be easier. | QANOV-27041 |
          | prepay       | Stay one step ahead       | Find your minutes, texts, and data usage all in one handy place. So you won't get caught short.     | QANOV-27042 |

  @jira.<jira_id> @android @automation.pending_env @ios @jira.cv.11.14 @jira.link.depends_on.QANOV-27037
  @jira.link.depends_on.QANOV-27038 @manual @mobile @o2uk @regression
  Scenario Outline: MyO2 user can continue In-app onboarding from the third card to the fourth
    other_affected_versions="2020-43"
    internal_checkpoint="To test on PROD env."
    Given user has a "<account_type>" account type
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
     Then the "Anytime, anywhere" header is displayed
      And the "card_image" image is displayed
      And the "card_description" textfield with "<card_description>" text is displayed
      And the "next_card_button" button with "Next" text is displayed
      And the "close_button" button is displayed

    Examples:
          | account_type | card_description                                                                                     | jira_id     |
          | PAYM         | Fancy a change? Upgrade, add Bolt Ons, or switch tariffs, whether you're on the move or on the sofa. | QANOV-27043 |
          | prepay       | Fancy a change? Switch bundles or move to Pay Monthly, whether you're on the move or on the sofa.    | QANOV-27044 |

  @jira.<jira_id> @android @automation.pending_env @ios @jira.cv.11.14 @jira.link.depends_on.QANOV-27037
  @jira.link.depends_on.QANOV-27038 @manual @mobile @o2uk @regression
  Scenario Outline: MyO2 user can continue In-app onboarding from the fourth card to the fifth
    other_affected_versions="2020-43"
    internal_checkpoint="To test on PROD env."
    Given user has a "<account_type>" account type
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
     Then the "Don't miss out" header is displayed
      And the "card_image" image is displayed
      And the "card_description" textfield with "<card_description>" text is displayed
      And the "close_card_button" button with "Get started" text is displayed
      And the "close_button" button is displayed

    Examples:
          | account_type | card_description                                                                                     | jira_id     |
          | PAYM         | You'll even find exclusive perks, with new offers added every week. And don't forget your Extras.    | QANOV-27045 |
          | prepay       | To top it all off, we'll give you exclusive deals and perks, with new offers being added every week. | QANOV-27046 |

  @jira.QANOV-27047 @android @automation.pending_env @har @ios @jira.cv.11.14 @jira.link.depends_on.QANOV-27037
  @jira.link.depends_on.QANOV-27038 @manual @mobile @o2uk @smoke
  Scenario: MyO2 user can complete the In-app onboarding and is redirected to the Account tab
    other_affected_versions="2020-43"
    internal_checkpoint="To test on PROD env."
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "close_card_button" button
     Then the "Account" page is displayed

  @jira.QANOV-27048 @android @automation.pending_env @ios @jira.cv.11.14 @jira.link.depends_on.QANOV-27037
  @jira.link.depends_on.QANOV-27038 @jira.link.depends_on.QANOV-27039 @jira.link.depends_on.QANOV-27040
  @jira.link.depends_on.QANOV-27041 @jira.link.depends_on.QANOV-27042 @jira.link.depends_on.QANOV-27043
  @jira.link.depends_on.QANOV-27044 @jira.link.depends_on.QANOV-27045 @jira.link.depends_on.QANOV-27046 @manual @mobile
  @o2uk @regression
  Scenario: MyO2 user can close the In-app message onboarding
    other_affected_versions="2020-43"
    internal_checkpoint="To test on PROD env."
    Given user has a "postpay" account type
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "close_button" button
     Then the "Account" page is displayed

  @jira.<jira_id> @android @automatic @ber @har @ios @jira.cv.11.11 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.QANOV-21791 @mobile @qa @sanity @vivobr
  Scenario Outline: Meu Vivo <account_type> user can see the onboarding In-app message on the first login
    Given user has a "<account_type>" account type
      And user has "<plans>" plans
      And user has never logged in the app
     When logs in the application for first time
     Then the "In App Message" page is displayed
      And the "card_title" textfield with "<title>" text is displayed
      And the "card_description" textfield with "<description>" text is displayed
      And the "card_button" button with "Seguinte" text is displayed
      And the "close_button" button is displayed
      And clicks on the "close_button" button
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | account_type | plans | detects                | title                               | description                                                                 | jira_id     |
          | convergente  | any   | IOS-6403               | Reunimos seus planos em un só lugar | Aqui você pode gerenciar tudo de um jeito ainda mais fáil e intuitivo.      | QANOV-1252  |
          | legacy       | 1     | IOS-6403:ACCOUNT-14628 | Tudo que seu plano oferece          | Você consulta os detalhes e benefícios do seu plano de forma fácil e rápida | QANOV-44664 |

  @jira.<jira_id> @<impeded> @android @automation.pending_env @ios @jira.cv.11.11 @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @regression @vivobr
  Scenario Outline: Meu Vivo <account_type> user can continue In-app onboarding from the first card to the second
    Given user has a "<account_type>" account type
      And user does not have a "prepay" account type
      And user has "<plans>" plans
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
     Then the "<header>" header is displayed
      And the "card_description" textfield with "<description>" text is displayed
      And the "next_card_button" button with "Seguinte" text is displayed
      And the "close_button" button is displayed

    Examples:
          | account_type | header                   | description                                                                                                                                  | plans | impeded        | jira_id     |
          | beatrix      | Seu plano mais intuitivo | É só tocar no gráfico e você confere tudo sobre o consumo do seu plano                                                                       | any   |                | QANOV-1253  |
          | legacy       | Benefícios e muito mais  | No Vivo Valoriza você resgata aperitivos em restaurantes, descontos pra comprar vinhos, vouchers pra loja online da Vivo e ofertas especiais | 1     | impeded_legacy | QANOV-44665 |

  @jira.QANOV-44666 @android @automation.pending_env @ios @jira.cv.11.11 @jira.link.parent_test_plan.QANOV-21791 @manual
  @mobile @regression @vivobr
  Scenario: Meu Vivo legacy prepay user can continue In-app onboarding from the first card to the second
    Given user has a "legacy prepay" account type
      And user has "1" plans
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
     Then the "Seu plano em tempo real" header is displayed
      And the "card_description" textfield with "Você pode acessar os detalhes do seu plano, da sua conta, dos seus benefícios e promoções. Tudo em tempo real" text is displayed
      And the "next_card_button" button with "Seguinte" text is displayed
      And the "close_button" button is displayed

  @jira.<jira_id> @<impeded> @android @automation.pending_env @ios @jira.cv.11.11 @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @regression @vivobr
  Scenario Outline: Meu Vivo <account_type> user can continue In-app onboarding from the second card to the third
    Given user has a "<account_type>" account type
      And user does not have a "prepay" account type
      And user has "<plans>" plans
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
     Then the "<header>" header is displayed
      And the "card_description" textfield with "<description>" text is displayed
      And the "next_card_button" button with "Seguinte" text is displayed
      And the "close_button" button is displayed

    Examples:
          | account_type | header                  | description                                                                                                   | plans | impeded        | jira_id     |
          | beatrix      | Suas contas em detalhes | Você pode usar o código de barras pra pagar e também navega entre suas últimas contas                         | any   |                | QANOV-1254  |
          | legacy       | Seu plano em tempo real | Você pode acessar os detalhes do seu plano, da sua conta, dos seus benefícios e promoções. Tudo em tempo real | 1     | impeded_legacy | QANOV-44667 |

  @jira.QANOV-44668 @android @automation.pending_env @ios @jira.cv.11.11 @jira.link.parent_test_plan.QANOV-21791 @manual
  @mobile @regression @vivobr
  Scenario: Meu Vivo legacy prepay user can continue In-app onboarding from the second card to the third
    Given user has a "legacy prepay" account type
      And user has "1" plans
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
     Then the "Mais internet" header is displayed
      And the "card_description" textfield with "Dá pra colocar mais internet no seu plano sempre que quiser" text is displayed
      And the "next_card_button" button with "Seguinte" text is displayed
      And the "close_button" button is displayed

  @jira.<jira_id> @<impeded> @android @automation.pending_env @ios @jira.cv.11.11 @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @regression @vivobr
  Scenario Outline: Meu Vivo <account_type> user can continue In-app onboarding from the third card to the fourth
    Given user has a "<account_type>" account type
      And user does not have a "prepay" account type
      And user has "<plans>" plans
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
     Then the "<header>" header is displayed
      And the "card_description" textfield with "<description>" text is displayed
      And the "next_card_button" button with "Seguinte" text is displayed
      And the "close_button" button is displayed

    Examples:
          | account_type | header                 | description                                                             | plans | impeded        | jira_id     |
          | beatrix      | Destaque pra Meus apps | Dá pra ver os apps já inclusos no seu plano e como gerenciar todos eles | any   |                | QANOV-1255  |
          | legacy       | Mais internet          | Dá pra colocar mais internet no seu plano sempre que quiser             | 1     | impeded_legacy | QANOV-44669 |

  @jira.QANOV-44670 @android @automation.pending_env @ios @jira.cv.11.11 @jira.link.parent_test_plan.QANOV-21791 @manual
  @mobile @regression @vivobr
  Scenario: Meu Vivo legacy prepay user can continue In-app onboarding from the third card to the fourth
    Given user has a "legacy prepay" account type
      And user has "1" plans
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
     Then the "E ainda tem a Aura!" header is displayed
      And the "card_description" textfield with "Use o comando de voz para tirar dúvidas e conversar sobre seus serviços com a Aura, a inteligência artificial da Vivo." text is displayed
      And the "close_card_button" button with "Ok, entendi" text is displayed
      And the "close_button" button is displayed

  @jira.QANOV-44671 @android @automation.pending_env @ios @jira.cv.11.11 @jira.link.parent_test_plan.QANOV-21791 @manual
  @mobile @regression @vivobr
  Scenario: Meu Vivo legacy prepay user can complete the In-app onboarding and is redirected to the Explore tab
    Given user has a "legacy prepay" account type
      And user has "1" plans
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "close_card_button" button
     Then the "Explore" page is displayed
      And a "non_numeric" red badge is not displayed in the "navigation_tab_bar.aura_tab" button

  @jira.<jira_id> @<impeded> @android @automation.pending_env @ios @jira.cv.11.11 @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @regression @vivobr
  Scenario Outline: Meu Vivo <account_type> user can continue In-app onboarding from the fourth card to the fifth
    Given user has a "<account_type>" account type
      And user does not have a "prepay" account type
      And user has "<plans>" plans
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
     Then the "<header>" header is displayed
      And the "card_description" textfield with "<description>" text is displayed
      And the "<button_name>" button with "<button_text>" text is displayed
      And the "close_button" button is displayed

    Examples:
          | account_type | header                  | description                                                                                                | button_name       | button_text | plans | impeded        | jira_id     |
          | beatrix      | Benefícios e muito mais | No Vivo Valoriza você resgata descontos, ofertas especiais em parceiros e vouchers pra loja online da Vivo | close_card_button | Ok, entendi | any   |                | QANOV-1256  |
          | legacy       | Mais Controle           | Também dá pra ver sua conta e já fazer o pagamento, ou analisar os detalhes e as contas mais antigas       | next_card_button  | Seguinte    | 1     | impeded_legacy | QANOV-44672 |

  @jira.QANOV-1259 @android @automation.pending_env @ios @jira.cv.11.11 @jira.link.parent_test_plan.QANOV-21791 @manual
  @mobile @smoke @vivobr
  Scenario: Meu Vivo beatrix user can complete the In-app onboarding and is redirected to the Explore tab
    Given user has a "beatrix" account type
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "close_card_button" button
     Then the "Explore" page is displayed
      And a "non_numeric" red badge is not displayed in the "navigation_tab_bar.aura_tab" button

  @jira.QANOV-44673 @android @automation.pending_env @impeded_legacy @ios @jira.cv.11.11
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr
  Scenario: Meu Vivo legacy user can continue In-app onboarding from the fifth card to the sixth
    Given user has a "legacy" account type
      And user does not have a "prepay" account type
      And user has "1" plans
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
     Then the "E ainda tem a Aura!" header is displayed
      And the "card_description" textfield with "Use o comando de voz para tirar dúvidas e conversar sobre seus serviços com a Aura, a inteligência artificial da Vivo." text is displayed
      And the "close_card_button" button with "Ok, entendi" text is displayed
      And the "close_button" button is displayed

  @jira.QANOV-44674 @android @automation.pending_env @impeded_legacy @ios @jira.cv.11.11
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr
  Scenario: Meu Vivo legacy user can complete the In-app onboarding and is redirected to the Explore tab
    Given user has a "legacy" account type
      And user does not have a "prepay" account type
      And user has "1" plans
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "next_card_button" button
      And clicks on the "close_card_button" button
     Then the "Explore" page is displayed
      And a "non_numeric" red badge is not displayed in the "navigation_tab_bar.aura_tab" button

  @jira.QANOV-1260 @android @automation.pending_env @ios @jira.cv.11.11 @jira.link.parent_test_plan.QANOV-21791 @manual
  @mobile @regression @vivobr
  Scenario: Meu Vivo user can close the In-app message onboarding
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "close_button" button
     Then the "Explore" page is displayed
      And a "non_numeric" red badge is not displayed in the "navigation_tab_bar.aura_tab" button

  @jira.QANOV-38880 @android @automation.pending_env @ios @jira.cv.11.15 @manual @mobile @moves @regression
  Scenario: Moves user can continue In-app onboarding from the first card to the second
    other_affected_versions="2020-48"
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And swipes the screen in "left" direction
     Then the "Ofertas, concursos y promociones exclusivas" header is displayed
      And the "card_description" textfield with "Descubre desde Explora todos los beneficios que tienes por ser cliente de Movistar" text is displayed
      And the "card_image" image is displayed
      And the "next_card_button" button is not displayed
      And the "close_button" button is displayed

  @jira.<jira_id> @android @automation.pending_env @ios @jira.cv.11.15 @manual @mobile @moves @regression
  Scenario Outline: Moves <account_type> user can continue In-app onboarding from the second card to the third
    other_affected_versions="2020-48"
    Given user has a "<account_type>" account type
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And swipes the screen in "left" direction
      And swipes the screen in "left" direction
     Then the "Solucionamos tus problemas" header is displayed
      And the "card_description" textfield with "<description>" text is displayed
      And the "card_image" image is displayed
      And the "next_card_button" button is not displayed
      And the "close_button" button is displayed

    Examples:
          | account_type | description                                                                                                                              | jira_id     |
          | legado       | Si algo no funciona bien o tienes dudas, en la sección de Soporte estamos disponibles las 24h del día                                    | QANOV-38881 |
          | telco        | Si algo no funciona bien, tienes dudas o quieres pedir una cita en tiendas, en la sección de Soporte estamos disponibles las 24h del día | QANOV-47908 |

  @jira.<jira_id> @android @automation.pending_env @ios @jira.cv.11.15 @manual @mobile @moves @regression
  Scenario Outline: Moves <account_type> user can continue In-app onboarding from the third card to the fourth
    other_affected_versions="2020-48"
    Given user has a "<account_type>" account type
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And swipes the screen in "left" direction
      And swipes the screen in "left" direction
      And swipes the screen in "left" direction
     Then the "<header>" header is displayed
      And the "card_description" textfield with "<description>" text is displayed
      And the "card_image" image is displayed
      And the "close_card_button" button with "Empezar" text is displayed
      And the "close_button" button is displayed

    Examples:
          | account_type | header                        | description                                                                                                                          | jira_id     |
          | legado       | Datos personales              | Revisa tus mensajes desde la campana o configura tus preferencias de privacidad fácilmente desde el Perfil                           | QANOV-38882 |
          | telco        | Gestiona tu perfil fácilmente | Desde la App también puedes revisar tus notificaciones, hacer seguimiento de los pedidos o configurar las preferencias de privacidad | QANOV-47909 |

  @jira.QANOV-38883 @android @automation.pending_env @har @ios @jira.cv.11.15 @manual @mobile @moves @smoke
  Scenario: Moves user can complete the In-app onboarding and is redirected to the Account tab
    other_affected_versions="2020-48"
    Given user has a "telco" account type
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And swipes the screen in "left" direction
      And swipes the screen in "left" direction
      And swipes the screen in "left" direction
      And clicks on the "close_card_button" button
     Then the "Account" page is displayed
      And a "non_numeric" red badge is not displayed in the "navigation_tab_bar.aura_tab" button

  @jira.<jira_id> @android @automation.pending_env @ios @jira.cv.11.15 @jira.link.depends_on.QANOV-38879
  @jira.link.depends_on.QANOV-38880 @jira.link.depends_on.QANOV-38881 @jira.link.depends_on.QANOV-38882 @manual @mobile
  @moves @regression
  Scenario Outline: Moves <account_type> user can close the In-app message onboarding
    other_affected_versions="2020-48"
    Given user has a "<account_type>" account type
      And user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "close_button" button
     Then the "<page_name>" page is displayed

    Examples:
          | account_type | page_name | jira_id     |
          | legado       | Account   | QANOV-38884 |
          | telco        | Start     | QANOV-95448 |

  @jira.<jira_id> @<product> @android @automation.pending_api @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: <product> in-app onboarding works after deleting the user via FSM
    Given user is in the "Account" page
     When user is deleted via FSM
      And the "Splash Screen" page is displayed
      And logs in the application
     Then the "In App Message" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | o2uk    | 12.0   | QANOV-47915  |
          | moves   | 12.0   | QANOV-47916  |
          | blaude  | 14.1   | QANOV-311496 |
          | o2de    | Future | QANOV-311497 |
          | o2es    | Future | QANOV-416952 |

    @old_app
    Examples:
          | product | cv   | jira_id     |
          | vivobr  | 12.0 | QANOV-47914 |

  @jira.<jira_id> @<product> @android @automation.pending_api @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: <product> in-app onboarding works after deleting the user via FSM
    Given user is in the "Assinatura" page
     When user is deleted via FSM
      And the "Splash Screen" page is displayed
      And logs in the application
     Then the "In App Message" page is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 12.0 | QANOV-599487 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can complete in-app onboarding process after sending the app to background
    Given user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And I run the app in the background for "3" seconds
     Then the "In App Message" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 12.0   | QANOV-47917  |
          | o2uk    | 12.0   | QANOV-47918  |
          | moves   | 12.0   | QANOV-47919  |
          | blaude  | 14.1   | QANOV-311498 |
          | o2de    | Future | QANOV-311499 |
          | o2es    | Future | QANOV-416953 |

  @jira.<jira_id> @<product> @android @automation.pending_env @har @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user can see the In-app onboarding on the first login
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
     Then the "In App Message" page is displayed
      And the "card_title" textfield with "<title>" text is displayed
      And the "card_description" textfield with "<description>" text is displayed
      And the "card_button" button with "Weiter" text is displayed
      And the "close_button" button is displayed
      And clicks on the "close_button" button
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv     | title                   | description                                                                                     | jira_id      |
          | blaude  | 14.1   | Das Wichtigste im Fokus | Deine persönliche Startseite ist die Übersicht aller aktuellen Informationen zu deinem Vertrag. | QANOV-311500 |
          | o2de    | Future | TBD                     | TBD                                                                                             | QANOV-311501 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can continue the In-app onboarding from the first card to the second
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "card_button" button
     Then the "card_title" textfield with "<title>" text is displayed
      And the "card_description" textfield with "<description>" text is displayed
      And the "card_button" button with "Weiter" text is displayed
      And the "close_button" button is displayed
      And clicks on the "close_button" button
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv     | title                         | description                                                                                    | jira_id      |
          | blaude  | 14.1   | Dein Verbrauch immer im Blick | Prüfe jederzeit deinen Datenverbrauch im In- und Ausland und buche individuelle Optionen dazu. | QANOV-311502 |
          | o2de    | Future | TBD                           | TBD                                                                                            | QANOV-311503 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can continue the In-app onboarding from the second card to the third
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "card_button" button
      And clicks on the "card_button" button
     Then the "card_title" textfield with "<title>" text is displayed
      And the "card_description" textfield with "<description>" text is displayed
      And the "card_button" button with "Weiter" text is displayed
      And the "close_button" button is displayed
      And clicks on the "close_button" button
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv     | title                       | description                                                               | jira_id      |
          | blaude  | 14.1   | Deine persönlichen Angebote | Entdecke zahlreiche Vorteile von Blau und profitiere von aktuellen Deals. | QANOV-311504 |
          | o2de    | Future | TBD                         | TBD                                                                       | QANOV-311505 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can continue the In-app onboarding from the third card to the fourth
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "card_button" button
      And clicks on the "card_button" button
      And clicks on the "card_button" button
     Then the "card_title" textfield with "<title>" text is displayed
      And the "card_description" textfield with "<description>" text is displayed
      And the "card_button" button with "Los geht's" text is displayed
      And the "close_button" button is displayed
      And clicks on the "close_button" button
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv     | title                         | description                                                                               | jira_id      |
          | blaude  | 14.1   | Support, wenn Du ihn brauchst | All unsere Service-Kanäle auf einen Blick - zum Beispiel der bequeme Blau Rückrufservice. | QANOV-311506 |
          | o2de    | Future | TBD                           | TBD                                                                                       | QANOV-311507 |

  @jira.<jira_id> @<product> @android @automation.pending_env @har @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user who completes the In-app onboarding can tap on the button of the last card: user is redirected to the Start tab
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "card_button" button
      And clicks on the "card_button" button
      And clicks on the "card_button" button
      And clicks on the "card_button" button
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.1   | QANOV-311508 |
          | o2de    | Future | QANOV-311509 |

  @jira.QANOV-416954 @android @o2es @ios @jira.cv.Future @manual @mobile @smoke
  Scenario: An o2es user can see the onboarding on the first login
    The onboarding cards are a series of in-app messages configured in the cms
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
     Then the "In App Message" page is displayed

  @jira.QANOV-416955 @android @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: An o2es user who completes the In-app onboarding can tap on the button of the last card: user is redirected to the Account tab
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And the "In App Message" page is displayed
      And clicks on the "card_button" button in the last onboarding card
     Then the "[CONF:landing_tab]" page is displayed
