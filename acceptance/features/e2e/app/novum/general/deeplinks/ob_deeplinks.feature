# -*- coding: utf-8 -*-
@jira.QANOV-8780
Feature: OB Deeplinks

  Actions After the Feature:
     Then restarts the navigation
      And navigates to "[CONF:landing_tab]" page


  @jira.<jira_id> @android @automatic @cert2 @ios @jira.cv.11.15 @jira.link.relates_to.<relates_to> @live @mobile @moves
  @next @regression
  Scenario Outline: A user can open the devices deeplink
    other_affected_versions="2020-47"
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And the "Ofertas" string in browser is displayed

    Examples:
          | deeplink_name    | jira_id     |
          | OB.Terminales 1  | QANOV-38109 |
          | OB.Terminales 2  | QANOV-38110 |
          | OB.Terminales 3  | QANOV-38111 |
          | OB.Terminales 4  | QANOV-38112 |
          | OB.Terminales 5  | QANOV-38113 |
          | OB.Terminales 6  | QANOV-38114 |
          | OB.Terminales 7  | QANOV-38115 |
          | OB.Terminales 8  | QANOV-38116 |
          | OB.Terminales 9  | QANOV-38117 |
          | OB.Terminales 10 | QANOV-38118 |

  @jira.<jira_id> @android @ios @jira.cv.11.8 @jira.link.detects.<detects> @jira.link.relates_to.<relates_to> @mobile
  @moves @regression
  Scenario Outline: A "<account_type>" user with <role> can open the <deeplink_name> deeplink
    internal_checkpoint="Browser mode:
    [https://docs.google.com/presentation/d/1EAGESvhh0imOSjUeTcxf6f1XwKxxnZmLxlljzM0NdxM/edit#slide=id.g4b83a3ab96_0_199]"
    Given user has a "<account_type>" account type
      And user has a "<role>" role
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the browser webview with "Activación Disney+" text in the header is displayed
      And the "Disney+" string in browser is displayed

    @automatic @cert2 @live @next
    Examples:
          | account_type | role  | deeplink_name             | relates_to             | detects    | cv   | jira_id    |
          | telco        | admin | OB.Disney Plus Activation | NOV-194447:QANOV-21058 | MOVES-3876 | 11.8 | QANOV-8794 |

    @manual
    Examples:
          | account_type | role        | deeplink_name             | relates_to             | detects    | cv   | jira_id    |
          | telco        | admin-light | OB.Disney Plus Activation | NOV-194447:QANOV-21058 | MOVES-3876 | 11.8 | QANOV-8797 |

  @jira.QANOV-8805 @android @automatic @cert2 @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-189597
  @jira.link.relates_to.NOV-189030 @live @mobile @moves @next @regression
  Scenario: A telco user can access to the Soteira informative page from the Soteira deeplink
    internal_checkpoint="The deeplink also works with prepay user
    NOTE: The CTA will change with the Soteira phase 2."
    Given user has a "telco postpay" account type
     When opens the "OB.Soteira Information" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "Alarma Movistar Prosegur" header is displayed

  @jira.<jira_id> @android @ios @jira.cv.11.14 @jira.link.relates_to.<relates_to> @mobile @moves @regression
  Scenario Outline: A TELCO user can access to the ATC data download page from the deeplink
    internal_checkpoint="Moves Ask and Download page cannot only be checked with a real telco user"
    Given user has a "telco" account type
      And user has a "<role>" role
      And user has a "internet" product
     When opens the "OB.Data Download" deeplink with the app in "killed" status
     Then the internal webview with "Consulta y descarga de datos" header is displayed
      And waits until the "Descarga tus datos" string in internal webview is displayed

    @automatic @cert2 @live @next
    Examples:
          | role  | relates_to | jira_id    |
          | admin | NOV-193918 | QANOV-8801 |

    @manual
    Examples:
          | role        | relates_to | jira_id    |
          | admin-light | NOV-193918 | QANOV-8803 |

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-163378 @manual @mobile @moves
  Scenario Outline: A <account_type> user can open the Tienda de terminales deeplink
    Given user has a "<account_type>" account type
     When opens the "OB.Tienda Terminales" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And is authenticated

    Examples:
          | account_type | test_priority | jira_id    |
          | postpay      | smoke         | QANOV-8809 |
          | prepay       | regression    | QANOV-8811 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-402094 @jira.link.relates_to.<relates_to>
  @mobile @vivobr
  Scenario Outline: A "<account_type>" admin can open the "<deeplink_name>" deeplink
    internal_checkpoint="beatrix control monoline: 05546594845"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has a "admin" role
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the internal webview with "<header>" header is displayed
      And waits until the "<text>" string in internal webview is displayed

    @automatic @live @next @sanity
    Examples:
          | account_type    | cv   | relates_to | deeplink_name             | header            | text              | jira_id    |
          | beatrix control | 10.1 | NOV-29320  | Account.Conta digital     | Fatura Digital    | Fatura Digital    | QANOV-8828 |
          | beatrix control | 10.1 | NOV-29319  | Account.Débito automático | Débito automático | Débito automático | QANOV-8833 |

    @manual @regression
    Examples:
          | account_type  | cv    | relates_to | deeplink_name               | header                   | text                                | jira_id     |
          | legacy prepay | 10.3  | NOV-64469  | Account.Detalhes do Consumo | Consumo                  | Detalhamento do consumo de internet | QANOV-8812  |
          | legacy prepay | 10.2  | NOV-67171  | Account.Configurar Aparelho | Como configurar aparelho | Tutoriais                           | QANOV-8817  |
          | multivivo     | 11.12 | NOV-67171  | Account.Configurar Aparelho | Como configurar aparelho | Tutoriais                           | QANOV-8826  |
          | multivivo     | 11.12 | NOV-29320  | Account.Conta digital       | Conta digital            | Conta Digital                       | QANOV-8831  |
          | convergente   | 12.0  | NOV-29320  | Account.Conta digital       | Conta digital            | Conta Digital                       | QANOV-98840 |
          | multivivo     | 11.12 | NOV-29319  | Account.Débito automático   | Débito automático        | Débito automático                   | QANOV-8836  |
          | convergente   | 12.0  | NOV-29319  | Account.Débito automático   | Débito automático        | Débito automático                   | QANOV-98841 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type   | cv   | relates_to | deeplink_name               | header                   | text                                | jira_id    |
          | legacy control | 10.3 | NOV-64469  | Account.Detalhes do Consumo | Consumo                  | Detalhamento do consumo de internet | QANOV-8814 |
          | legacy postpay | 10.3 | NOV-64469  | Account.Detalhes do Consumo | Consumo                  | Detalhamento do consumo de internet | QANOV-8816 |
          | legacy control | 10.2 | NOV-67171  | Account.Configurar Aparelho | Como configurar aparelho | Tutoriais                           | QANOV-8819 |
          | legacy postpay | 10.2 | NOV-67171  | Account.Configurar Aparelho | Como configurar aparelho | Tutoriais                           | QANOV-8821 |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | account_type    | cv   | relates_to | deeplink_name             | header            | text              | jira_id    |
          | beatrix postpay | 10.1 | NOV-29320  | Account.Conta digital     | Conta digital     | Conta Digital     | QANOV-8830 |
          | beatrix postpay | 10.1 | NOV-29319  | Account.Débito automático | Débito automático | Débito automático | QANOV-8835 |

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.<cv> @jira.link.detects.VIVO-1870
  @jira.link.parent_test_plan.QANOV-402094 @jira.link.relates_to.<relates_to> @mobile @no_automatable @regression @vivobr
  Scenario Outline: A "<account_type>" user can open the "<deeplink_name>" deeplink
    internal_checkpoint="beatrix control monoline: 05546594845"
    Given user has a "<account_type>" account type
      And user has "1" plans
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the internal webview with "<header>" header is displayed
      And the "<text>" textfield is displayed

    Examples:
          | account_type   | cv   | relates_to | deeplink_name                  | header   | text              | jira_id    |
          | legacy control | 10.1 | NOV-29320  | Account.Conta digital          | Serviços | Conta Digital     | QANOV-8838 |
          | legacy control | 10.1 | NOV-29319  | Account.Débito automático      | Serviços | Débito automático | QANOV-8842 |
          | legacy control | 10.3 | NOV-47475  | Account.Gerar código de barras | Serviços | Sua conta         | QANOV-8844 |
          | legacy postpay | 10.1 | NOV-29320  | Account.Conta digital          | Serviços | Conta Digital     | QANOV-8840 |
          | legacy postpay | 10.1 | NOV-29319  | Account.Débito automático      | Serviços | Débito automático | QANOV-8843 |
          | legacy postpay | 10.3 | NOV-47475  | Account.Gerar código de barras | Serviços | Sua conta         | QANOV-8845 |

  @jira.<jira_id> @android @cert0 @cert1 @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-573446 @manual @mobile @o2uk
  @regression @e2e
  Scenario Outline: An "<account_type>" o2uk user can open the <deeplink_name> deeplink: The internal webview is displayed
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
     When opens the "OB.Support.<deeplink_name>" deeplink with the app in "killed" status
     Then the browser webview with "<header>" text in the header is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | account_type | deeplink_name                  | header                                                       | jira_id      |
          | postpay      | Manage my personal details     | O2 \| Accounts \| My O2 Accounts                             | QANOV-606383 |
          | prepay       | Manage my personal details     | O2 \| Accounts \| My O2 Accounts                             | QANOV-606384 |
          | postpay      | Looking to upgrade?            | Upgrades                                                     | QANOV-606385 |
          | prepay       | I want to change my tariff     | Choose your tariff                                           | QANOV-606386 |
          | postpay      | Make a payment                 | O2 \| My Bills                                               | QANOV-606387 |
          | postpay      | Your extras                    | O2 \| My device                                              | QANOV-606388 |
          | prepay       | Your extras                    | O2 \| My device                                              | QANOV-606389 |
          | device       | Unlock my device               | O2 \| My device                                              | QANOV-606390 |
          | prepay       | Unlock my device               | O2 \| My device                                              | QANOV-606391 |
          | postpay      | Unlock my device               | O2 \| My device                                              | QANOV-606392 |
          | postpay      | Keep, cancel or claim a number | Transfer your current mobile number - Help and Support \| O2 | QANOV-606393 |
          | postpay      | Track my order                 | O2 \| My device                                              | QANOV-606394 |
          | prepay       | Track my order                 | O2 \| My device                                              | QANOV-606395 |

  @jira.QANOV-8846 @android @automatic @cert0 @cert1 @ios @jira.cv.11.6 @jira.link.relates_to.NOV-202760 @mobile @next
  @o2uk @regression
  Scenario: A user can open the Airtime rewards deeplink
    Given user has a "postpay" account type
     When opens the "OB.Airtime Rewards" deeplink with the app in "killed" status
     Then the browser webview with "Airtime Rewards | My O2" text in the header is displayed

  @jira.QANOV-8849 @android @automatic @cert0 @cert1 @ios @jira.cv.11.8 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-202755 @mobile @next @o2uk @regression
  Scenario: A legacy user can open the Upgrade options deeplink
    Given user has a "legacy postpay" account type
      And user has the matching subscription selected in the account
     When opens the "OB.Upgrade Options" deeplink with the app in "killed" status
     Then the browser webview with "Upgrades" text in the header is displayed
      And the "Upgrade Options" string is displayed

  @jira.QANOV-8850 @android @automatic @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.relates_to.NOV-202755 @mobile @o2uk @smoke
  Scenario: An AO2 user can open the Upgrade options deeplink
    Given user has a "AO2 postpay" account type
      And user has the matching subscription selected in the account
     When opens the "OB.Upgrade Options" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And the "Account" header is displayed
      And the "Looking to upgrade?" string is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-97827 @mobile @o2uk @regression
  Scenario Outline: A <account_type> user with a single line can open the "OB.Volt Benefits" deeplink
    other_affected_versions="2022-22"
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
     When opens the "OB.Volt Benefits" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And the header that contains the "<header_value>" text is displayed
      And the "Supercharge your world with Volt" string is displayed

    @automatic @cert0 @cert1 @live @next
    Examples:
          | account_type   | header_value    | cv   | jira_id      |
          | legacy postpay | O2 \| My device | 12.7 | QANOV-155333 |

    @manual
    Examples:
          | account_type | header_value  | cv   | jira_id      |
          | AO2 postpay  | Volt Benefits | 13.3 | QANOV-155334 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-97827 @mobile @o2uk @regression
  Scenario Outline: A <account_type> user with multiple lines can open the "OB.Volt Benefits" deeplink
    other_affected_versions="2022-22"
    Given user has "several" lines of the "<account_type>" account type
     When opens the "OB.Volt Benefits" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And each element in the "lines.list" list has the "title" field
      And each element in the "lines.list" list has the "subtitle" field
      And the "title" field of "lines.list" list entries will match the user mobile lines

    @automatic @cert0 @cert1 @live @next
    Examples:
          | account_type   | cv   | jira_id      |
          | legacy postpay | 12.7 | QANOV-155335 |

    @manual
    Examples:
          | account_type | cv   | jira_id      |
          | AO2 postpay  | 13.3 | QANOV-155336 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-97827 @mobile @o2uk @regression
  Scenario Outline: A <account_type> user with multiple lines can select a line after opening the "OB.Volt Benefits" deeplink
    other_affected_versions="2022-22"
    Given user has "several" lines of the "<account_type>" account type
      And user opens the "OB.Volt Benefits" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
     When clicks on the "chevron" field of "lines.list" list with "0" index
     Then the browser webview with "<header_value>" text in the header is displayed
      And the "Supercharge your world with Volt" string is displayed

    @automatic @cert0 @cert1 @live @next
    Examples:
          | account_type   | header_value    | cv   | jira_id      |
          | legacy postpay | O2 \| My device | 12.7 | QANOV-155337 |

    @manual
    Examples:
          | account_type | header_value  | cv   | jira_id      |
          | AO2 postpay  | Volt Benefits | 13.3 | QANOV-155338 |

  @jira.QANOV-212645 @cert0 @cert1 @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-206624 @manual @mobile @o2uk
  @smoke
  Scenario: An o2uk user with mobile lines can open the Kindred deeplink with version iOS>=15.0
    Only to be displayed for users with iOS version 15 or up as the plugin functionality in Safari is needed
    other_affected_versions="2022-20"
    Given the device version is "equal_or_greater" than "15.0"
      And user has any "postpay;prepay" account types
     When opens the "OB.Kindred" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And the header that contains the "Kindred | My O2" text is displayed

  @jira.QANOV-344961 @android @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-206624 @manual @mobile @o2uk @smoke
  Scenario: An o2uk user with mobile lines can open the Kindred deeplink with version Android >= 6.0
    Given the device version is "equal_or_greater" than "6.0"
      And user has any "postpay;prepay" account types
     When opens the "OB.Kindred" deeplink with the app in "killed" status
     Then the "Kindred" page is displayed
      And the header that contains the "Kindred | My O2" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-212646 @cert0 @cert1 @ios @jira.cv.13.2 @jira.link.parent_test_plan.QANOV-206624 @manual @mobile @o2uk
  @regression
  Scenario: An o2uk user with mobile lines can open the Kindred deeplink with iOS under 15
    other_affected_versions="2022-20"
    Given the device version is "lower" than "15.0"
      And user has any "postpay;prepay" account types
     When opens the "OB.Kindred" deeplink with the app in "killed" status
     Then the "Not Available Deeplink" page is displayed
      And the header that contains the "MyO2" text is displayed
      And the "title" textfield with "Device not compatible" text is displayed
      And the "description" textfield with "Kindred is not supported on your device. Contact MyO2 for more info." text is displayed
      And the "button" button with "Go back to app" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-212648 @android @cert0 @cert1 @ios @jira.cv.13.2 @jira.link.parent_test_plan.QANOV-206624 @manual @mobile
  @o2uk @regression
  Scenario: An o2uk user without mobile lines can open the Kindred deeplink
    other_affected_versions="2022-20"
    Given user has a "device" account type
     When opens the "OB.Kindred" deeplink with the app in "killed" status
     Then the "Not Available Deeplink" page is displayed
      And the header that contains the "Your products" text is displayed
      And the "title" textfield with "Product list" text is displayed
      And the "description" textfield with "You don't have any products available for this process" text is displayed
      And the "button" button with "Go back my account" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-212649 @android @cert0 @cert1 @ios @jira.cv.13.2 @jira.link.depends_on.QANOV-212646
  @jira.link.depends_on.QANOV-212647 @jira.link.depends_on.QANOV-212648 @jira.link.parent_test_plan.QANOV-206624 @manual
  @mobile @o2uk @regression
  Scenario: An o2uk user in the Not available deeplink screen can go back to Account
    The Not Available Deeplink page when opening the Kindred deeplink will be displayed for SFF and EECC only users
    (device account type), and for iOS with OS version under 15.
    other_affected_versions="2022-20"
    Given user has a "device" account type
     When opens the "OB.Kindred" deeplink with the app in "killed" status
      And the "Not Available Deeplink" page is displayed
      And clicks on the "button" button
     Then the "Account" page is displayed
      And the "Account" header is displayed

  @jira.QANOV-21886 @android @automatic @cert2 @ios @jira.cv.11.12 @jira.link.parent_test_plan.QANOV-21050 @live @mobile
  @moves @next @regression
  Scenario: TELCO user can open the Movistar Car Discoverability deeplink
    other_affected_versions="2020-38"
    Given user has a "telco postpay" account type
      And user has the "movistar_car" service in "deactivated" status
     When opens the "OB.Movistar Car Discoverability" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And the "Movistar Car" string in browser is displayed

  @jira.QANOV-21887 @android @automatic @cert2 @ios @jira.cv.11.12 @jira.link.parent_test_plan.QANOV-21050 @live @mobile
  @moves @next @regression
  Scenario: TELCO user can open the Movistar Car Hire deeplink
    internal_checkpoint="Is not confirmed that the MOVISTAR_CAR_HIRE webview will be displayed on internal mode"
    other_affected_versions="2020-38"
    Given user has a "telco postpay" account type
      And user has the "movistar_car" service in "deactivated" status
     When opens the "OB.Movistar Car Hire" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And the "Movistar Car" string is displayed

  @jira.<jira_id> @android @automatic @ios @jira.cv.11.12 @mobile @moves @regression
  Scenario Outline: A FUSION user can open the REPOS FUSION "<repo_fusion_deeplink>" deeplink
    Given user has a "postpay" account type
      And user has a "fusion" plan
     When opens the "<repo_fusion_deeplink>" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And is authenticated

    Examples:
          | repo_fusion_deeplink                                | jira_id     |
          | OB.Reposfusion Fusiontotalpluspromo600mb            | QANOV-21817 |
          | OB.Reposfusion Fusionseleccionplusfutbol600mb       | QANOV-21818 |
          | OB.Reposfusion Fusiontotalpluspromo600mbnetflixx4   | QANOV-21819 |
          | OB.Reposfusion Fusionseleccionplusficcionpromo600mb | QANOV-21820 |

  @jira.QANOV-8805 @android @automatic @cert2 @ios @jira.cv.11.12 @live @mobile @moves @next @regression
  Scenario: A telco user can access to the Soteira Quote page from the Soteira Quote deeplink
    Given user has a "telco postpay" account type
     When opens the "OB.Soteira Cotizador" deeplink with the app in "killed" status
     Then the browser webview with "Particulares" text in the header is displayed

  @jira.QANOV-27249 @android @ios @jira.cv.11.13 @jira.link.parent_test_plan.QANOV-27051 @manual @mobile @moves
  @regression
  Scenario: TELCO user with eHealth already contracted can access eHealth UPGRADE deeplink
    internal_checkpoint="Is not confirmed that the MOVISTAR_HEALTH_UPGRADE webview will be displayed on internal mode"
    other_affected_versions="2020-41"
    Given user has a "telco" account type
      And user has an eHealth "personal_plan" plan contracted
     When opens the "OB.eHealth Upgrade" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And the "datos" string in browser is displayed

  @jira.QANOV-49034 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-28881 @manual @mobile @moves @regression
  Scenario: A Telco user can open the Gestiones Línea Móvil deeplink
    other_affected_versions="2021-03"
    Given user has a "telco" account type
      And user has "1" mobile lines
     When opens the "OB.Mobile line management" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And the "Área privada Movistar" header is displayed
      And the "Buzón de voz" string is displayed

  @jira.<jira_id> @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-402094 @jira.link.relates_to.<relates_to>
  @manual @mobile @regression @vivobr
  Scenario Outline: A "convergente" user can open the "<deeplink_name>" deeplink
    Given user has a "convergente" account type
      And user has "several" mobile lines
      And user has a "admin" role
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And the "<text>" textfield is displayed

    Examples:
          | relates_to | deeplink_name             | header            | text              | jira_id     |
          | NOV-29320  | Account.Conta digital     | Conta Digital     | Conta Digital     | QANOV-44837 |
          | NOV-29319  | Account.Débito automático | Débito automático | Débito automático | QANOV-44838 |

  @jira.QANOV-57125 @android @automatic @cert2 @ios @jira.cv.12.1 @live @mobile @moves @next @regression
  Scenario: A user can see the content not available empty case when trying to open a deeplink not available for him/her
    internal_checkpoint="links with the /link/ path go through a disambiguation process and show an specific empty page
    different to the regular 'Not available' deeplinks empty page. Links without the /link/ path show the regular 'Not
    available empty page'"
    Given user has a "prepay" account type
     When opens the "OB.Movistar Shop Router HGU" deeplink with the app in "killed" status
     Then the "Not Available" page is displayed
      And the "not_available_text" textfield with "[LANG:pageelements.not_available_deeplink.message]" text is displayed

  @jira.<jira_id> @android @automatic @cert2 @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-28881 @live @mobile
  @moves @next @regression
  Scenario Outline: TELCO user can access to the <deeplink_name> Mobile Tariff Webview
    other_affected_versions="2021-07"
    Given user has a "telco" account type
      And user has a "any_admin" role
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And the "<text>" string is displayed

    Examples:
          | deeplink_name                  | text                   | jira_id     |
          | OB.Tariff List Mobile Contract | Contrato               | QANOV-59720 |
          | OB.Tariff List Additional Line | Tarifas móvil contrato | QANOV-59721 |

  @jira.<jira_id> @android @automatic @cert2 @ios @jira.cv.12.0 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.QANOV-28881 @jira.link.parent_test_plan.QANOV-44675 @live @mobile @moves @next @regression
  Scenario Outline: User can access to the <deeplink_name> equipment deeplink
    other_affected_versions="2021-07"
    Given user has a "any_admin" role
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And the "<text>" string in browser is displayed

    Examples:
          | deeplink_name            | text         | detects      | jira_id     |
          | OB.Smart Wifi Router HGU | router       |              | QANOV-59722 |
          | OB.Smart Wifi Desco UHD  | UHD          |              | QANOV-59723 |
          | OB.Smart Wifi Amplifier  | Amplificador | NOVUMCC-9052 | QANOV-59724 |
          | OB.Mando Vocal           | televisión   |              | QANOV-59726 |

  @jira.QANOV-68955 @android @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288 @manual @mobile @moves @smoke
  Scenario: User can access to the <deeplink_name> deeplink: Modal webview is displayed
    other_affected_versions="2021-14-B"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan with a renting device
     When opens the "OB.Device Renting Details" deeplink with the app in "killed" status
     Then the modal webview is displayed
      And the "Área privada Movistar" header is displayed
      And the "SISTEMA OPERATIVO" string is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-68956 @android @automatic @ber @cert2 @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288 @live
  @mobile @moves @next @qa @sanity
  Scenario: User can access to the "Device Renting Not Choosen" deeplink: Modal webview is displayed
    other_affected_versions="2021-14-B"
    Given user has a "postpay" account type
      And user has a "admin" role
      And user has a "fusion" plan with a renting device
     When opens the "OB.Device Renting Not Choosen" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And the "dispositivo" string is displayed

  @jira.QANOV-124104 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-125017 @manual @mobile @moves
  @regression
  Scenario: TELCO postpay user can access to the Digital Invoice deeplink: Área privada Movistar page is displayed
    other_affected_versions="2021-30-B"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has bills for "some" months
     When opens the "OB.Digital Invoice" deeplink with the app in "killed" status
     Then the browser webview with "Área privada Movistar" text in the header is displayed
      And the "Factura sin papel" string is displayed

  @jira.QANOV-134681 @android @automatic @cert2 @ios @jira.cv.12.5 @live @mobile @moves @next @regression
  Scenario: ADMIN can access to the Movistar Lite activation page:
    other_affected_versions="2021-33"
    Given user has a "postpay" account type
      And user has a "any_admin" role
     When opens the "OB.Movistar Lite Activation" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And the browser webview with "Movistar Plus+" text in the header is displayed
      And the "SUSCRIBIRME AHORA" string in browser is displayed

  @jira.<jira_id> @android @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-132965
  @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression @vivobr
  Scenario Outline: <account_type> Vivo users can access to the biometric deeplink
    Given user has a "<account_type>" account type
      And user has a "any" plan in "active" status
      And user has a "admin" role
     When opens the "Settings.Biometric" deeplink with the app in "killed" status
     Then the "Identity Confirmation" internal webview is displayed
      And the "Confirmação de identidade" header is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-129647 |
          | convergente  | QANOV-129648 |
          | multivivo    | QANOV-129649 |

  @jira.QANOV-274567 @TBD @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-273962
  @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression @vivobr
  Scenario: Vivo users can access to the Cancelamento deeplink
    Given user has any "platinum;V;gold" segmentation
      And user has a "any" plan in "active" status
      And user has a "admin" role
      And user has "1" plans
     When opens the "Tabmais.Cancelamento" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "TBD" header is displayed

  @jira.QANOV-283339 @android @har @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-273962
  @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @sanity @vivobr
  Scenario: Vivo users can access to the Chatbot deeplink
    Given user has a "any" plan in "active" status
     When opens the "Tabmais.Chatbot" deeplink with the app in "killed" status
     Then the "Aura Chat" page is displayed

  @jira.QANOV-283340 @android @har @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-273962
  @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression @vivobr
  Scenario: Vivo users can access to the Chatbot deeplink with Chat title
    Given user has a "any" plan in "active" status
     When opens the "Tabmais.Chat Title" deeplink with the app in "killed" status
     Then the "Aura Chat" page is displayed
      And the "ChatTest" header is displayed

  @jira.QANOV-283341 @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-273962
  @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression @vivobr
  Scenario: Vivo users can access to the Chatbot deeplink with Aura title
    Given user has a "any" plan in "active" status
      And the "Aura Chat" page is not cached
     When opens the "Tabmais.Aura Title" deeplink with the app in "killed" status
     Then the "Aura Chat" page is displayed
      And the "AuraTest" header is displayed

  @jira.QANOV-295061 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @smoke
  @tbd
  Scenario: A moves user can access to the change password OB screen
     When opens the "OB.Change Pwd" deeplink with the app in "killed" status
     Then the browser webview with "TBD" text in the header is displayed
      And the "TBD" string in browser is displayed

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual
  @mobile @regression
  Scenario Outline: A <product> postpay user who <has_hasnot> requested a cancellation for his/her mobile line tariff and has the earliest possible extension date in the <time> can open the "OB.Change Tariff Postpay" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" mobile lines
      And user <has_hasnot> a contract cancellation requested for a "mobile_line" product
      And user has a "mobile_line" tariff with the earliest possible extension date in the "<time>"
     When opens the "OB.Change Tariff Postpay" deeplink with the app in "killed" status
     Then the internal webview with "<header_name>" header is displayed

    Examples:
          | product | cv   | has_hasnot | time   | header_name | parent_test_plan | jira_id      |
          | blaude  | 14.0 | has not    | future | TBD         |                  | QANOV-269677 |
          | blaude  | 14.0 | has not    | past   | TBD         |                  | QANOV-269678 |
          | blaude  | 14.0 | has        | future | TBD         |                  | QANOV-269679 |
          | blaude  | 14.0 | has        | past   | TBD         |                  | QANOV-269680 |
          | o2de    | 14.6 | has not    | future | TBD         | QANOV-437471     | QANOV-269704 |
          | o2de    | 14.6 | has not    | past   | TBD         |                  | QANOV-269705 |
          | o2de    | 14.6 | has        | future | TBD         |                  | QANOV-269706 |
          | o2de    | 14.6 | has        | past   | TBD         |                  | QANOV-269707 |

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @jira.link.detects.O2DE-2496
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke
  Scenario Outline: A user can open the "OB.Consent Management" deeplink
    Given user has a "any" account type
     When opens the "OB.Consent Management" deeplink with the app in "killed" status
     Then the internal webview with "Einwilligungen und Erlaubnisse" header is displayed

    @cert3 @live @next
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 14.3 |                  | QANOV-291324 |

    @live @next
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | o2de    | 14.6 | QANOV-437471     | QANOV-291325 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario Outline: A user can open the "OB.Faqs" deeplink
    Given user has a "any" account type
     When opens the "OB.Faqs" deeplink with the app in "killed" status
     Then the internal webview with "FAQs" header is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-532961 |
          | o2de    | QANOV-532962 |

  @jira.QANOV-376740 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-370138
  @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @smoke @vivobr
  Scenario: A user can open the "Esim" deeplink
    Given user has any "beatrix;multivivo;convergente;control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has a device with eSIM capabilities
     When opens the "Others.Esim" deeplink with the app in "killed" status
     Then the "Aura Chat" page is displayed
      And the "Aura" header is displayed

  @jira.QANOV-377168 @android @ios @jira.cv.14.3 @manual @mobile @old_App @regression @vivobr
  Scenario: A prepay user can open the "Others.Gamificaion" deeplink: disambiguation screen is displayed
    Given user has "several" prepay plans
     When opens the "Others.Gamificaion" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And the "lines" list is displayed
      And each element in the "lines" list has the "icon" field
      And each element in the "lines" list has the "product_customer_type" field
      And each element in the "lines" list has the "phone_number" field
      And the "phone_number" field of "lines" list entries will match the user mobile lines whose account type is not any of "vivo easy;control_n;jeri control;jeri postpay;legacy control;legacy postpay;convergente;multivivo;beatrix"

  @jira.QANOV-406588 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression
  @vivobr
  Scenario: A prepay user can open the "Others.Gamificaion" deeplink: disambiguation screen is displayed
    Given user has "several" prepay plans
     When opens the "Others.Gamificaion" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And the "disambiguation_header" textfield is displayed
      And the "title" textfield is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "phone_number" field of "lines" list entries will match the user mobile lines whose account type is not any of "vivo easy;control_n;jeri control;jeri postpay;legacy control;legacy postpay;convergente;multivivo;beatrix"

  @jira.QANOV-377169 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression
  @vivobr
  Scenario: A prepay user can open the "Others.Gamificaion" deeplink
    Given user has any "jeri prepay;legacy prepay" account types
      And user has "1" plans
      And user has a "admin" role
     When opens the "Others.Gamificaion" deeplink with the app in "killed" status
     Then the internal webview with "Recarga premiada" header is displayed
      And waits until the "Chegou" string in internal webview is displayed

  @jira.QANOV-377170 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression
  @vivobr
  Scenario: A prepay user open the "Others.Gamificaion" deeplink when selects a product in disambiguation screen
    Given user has "several" prepay plans
      And user opens the "Others.Gamificaion" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
     When clicks on any element in the "lines" list
     Then the internal webview with "Recarga premiada" header is displayed
      And waits until the "Chegou" string in internal webview is displayed

  @jira.QANOV-8299 @android @automatic @cert2 @ios @jira.cv.10.8 @jira.link.relates_to.NOV-64123 @live @mobile @moves
  @next @regression
  Scenario: Telco user can open the OB.Mis incidencias deeplink
    Given user has a "telco" account type
     When opens the "OB.Mis incidencias" deeplink with the app in "killed" status
     Then the internal webview with "Mis incidencias" header is displayed

  @jira.QANOV-449449 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-355372 @manual @mobile @regression
  @vivobr
  Scenario: A user can open the "Others.SIM activacion" deeplink
    Given user has a "beatrix" mobile line in "pre active" status
     When opens the "Others.SIM activacion" deeplink with the app in "killed" status
     Then the internal webview with "TBD" header is displayed

  @jira.QANOV-558796 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A prepay user can open the "OB.Topup With Third Party Providers" deeplink
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
     When opens the "OB.Topup With Third Party Providers" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "Aufladebetrag auswählen - Alphacomm Prepaid Services B.V." header is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A postpay user can open the "OB.EVN Download" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has invoices
     When opens the "OB.EVN Download" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "Mein <page>" header is displayed

    Examples:
          | product | page | jira_id      |
          | blaude  | Blau | QANOV-558797 |
          | o2de    | o2   | QANOV-558798 |

  @jira.QANOV-558799 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A multisim non-UDP user can open the "OB.Delete SIM" deeplink
    Given user has a "mobile_line" product in "active" status
      And user has "multisim" service in "activated" status
      And user has "several" SIMs in "active" status for the same mobile line
     When opens the "OB.Delete SIM" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "Mein o2" header is displayed

  @jira.QANOV-558800 @android @blaude @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario: A RAITT user can open the "OB.Change Password" deeplink
    Given user has a "raitt" account type
      And user has a "mobile_line" product in "active" status
     When opens the "OB.Change Password" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "Kennwort ändern" string is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A any user can open the "OB.Create Email Login" deeplink
    Given user has a "any" account type
     When opens the "OB.Create Email Login" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "<string>" string is displayed

    Examples:
          | product | string          | jira_id      |
          | blaude  | Kennwort ändern | QANOV-558801 |
          | o2de    | Login verwalten | QANOV-558802 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A any user can open the "OB.Delete Login Account" deeplink
    Given user has a "any" account type
     When opens the "OB.Delete Login Account" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "<string>" string is displayed

    Examples:
          | product | cv     | string          | jira_id      |
          | blaude  | Future | Kennwort ändern | QANOV-558804 |
          | o2de    | 24.1   | Login verwalten | QANOV-558805 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A any user can open the "OB.Change Login Email Address" deeplink
    Given user has a "any" account type
     When opens the "OB.Change Login Email Address" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "<string>" string is displayed

    Examples:
          | product | string          | jira_id      |
          | blaude  | Kennwort ändern | QANOV-558806 |
          | o2de    | Login verwalten | QANOV-558807 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A any user can open the "OB.Manage Login" deeplink
    Given user has a "any" account type
     When opens the "OB.Manage Login" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "<string>" string is displayed

    Examples:
          | product | string          | jira_id      |
          | blaude  | Kennwort ändern | QANOV-558808 |
          | o2de    | Login verwalten | QANOV-558810 |

  @jira.QANOV-558811 @android @blaude @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario: A RAITT user can open the "OB.Change Contact Email" deeplink
    Given user has a "raitt" account type
      And user has a "any" product in "active" status
      And user has a "active" email stored in the contact details
     When opens the "OB.Change Contact Email" deeplink with the app in "killed" status
     Then the browser webview with "Login" text in the header is displayed
      And the "Authentifizierung der Rufnummer" string is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A any user can open the "OB.Data Protection" deeplink
    Given user has a "any" account type
     When opens the "OB.Data Protection" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "<string>" string is displayed

    Examples:
          | product | string                           | jira_id      |
          | blaude  | Datenschutzerklärung             | QANOV-558813 |
          | o2de    | Datenschutzerklärung Mein o2 App | QANOV-558814 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A any user can open the "OB.Impressum" deeplink
    Given user has a "any" account type
     When opens the "OB.Impressum" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "<string>" string is displayed

    Examples:
          | product | string             | jira_id      |
          | blaude  | Impressum von Blau | QANOV-558815 |
          | o2de    | Impressum          | QANOV-558816 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A any user can open the "OB.Cookies" deeplink
    Given user has a "any" account type
     When opens the "OB.Cookies" deeplink with the app in "killed" status
     Then the "Cookies Management" popup is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558818 |
          | o2de    | QANOV-558820 |

  @jira.QANOV-558822 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: Any user can open the "OB.Hotline Sign Language" deeplink
    Given user has a "any" account type
      And user has "1" products
     When opens the "OB.Hotline Sign Language" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "Gehörlos telefonieren dank Tess | o2" header is displayed
