# -*- coding: utf-8 -*-
@jira.QANOV-126729
Feature: Consumption


  @jira.<jira_id> @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-47935 @mobile @moves
  Scenario Outline: User can see the <allowance> allowance information is displayed
    LEGADO POSTPAY (Live): 05960856S
    commented_tags="@depends_on.NOV-47913"
    Given user has a "<account_type>" account type
      And user has "<allowance>" allowances in the "mobile_line" product
      And user has a "mobile_line" product
      And user has the "event-history-total-<account_type_name>" module configured in CMS for "consumption-details-<allowance_name>" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "any_roundel" allowance roundel
      And the "Consumption" page is displayed
      And clicks on the "<allowance>" tab
     Then the "<allowance>" tab is selected
      And the "total_consumption_section_title" textfield with "<consumption_text>" text is displayed
      And the "amount_consumed.title" textfield with "Has consumido" text is displayed
      And the "amount_consumed.value" textfield with the "<format>" format is displayed

    @manual @regression
    Examples:
          | account_type   | account_type_name | allowance | allowance_name | consumption_text    | format                       | jira_id    |
          | telco postpay  | postpay           | minutes   | calls          | consumo de llamadas | (\s?\d{1,2}(min\|s\|h)){1,3} | QANOV-6417 |
          | telco postpay  | postpay           | sms       | messages       | consumo de mensajes | \d+ Mensajes                 | QANOV-6422 |
          | telco postpay  | postpay           | others    | others         | otros consumos      | \d+                          | QANOV-6423 |

    @sanity @automatic @ber @qa @live @cert2 @next @webapp
    Examples:
          | account_type  | account_type_name | allowance | allowance_name | consumption_text | format                   | jira_id    |
          | telco postpay | postpay-telco     | data      | data           | consumo de datos | \d+(\,\d{1,2})? (MB\|GB) | QANOV-6406 |

    @no_automatable @regression @impeded_legacy
    Examples:
          | account_type   | account_type_name | allowance | allowance_name | consumption_text    | format                       | jira_id    |
          | legado postpay | postpay-legado    | data      | data           | consumo de datos    | \d+(\,\d{1,2})? (MB\|GB)     | QANOV-6424   |
          | legado postpay | postpay           | minutes   | calls          | consumo de llamadas | (\s?\d{1,2}(min\|s\|h)){1,3} | QANOV-6425   |
          | legado postpay | postpay           | sms       | messages       | consumo de mensajes | \d+ Mensajes                 | QANOV-6426   |
          | legado postpay | postpay           | others    | others         | otros consumos      | \d+                          | QANOV-250891 |
          | legado prepay  | prepay            | data      | data           | consumo de datos    | \d+(\,\d{1,2})? (MB\|GB)     | QANOV-250892 |
          | legado prepay  | prepay            | minutes   | calls          | consumo de llamadas | (\s?\d{1,2}(min\|s\|h)){1,3} | QANOV-250893 |
          | legado prepay  | prepay            | sms       | messages       | consumo de mensajes | \d+ Mensajes                 | QANOV-250894 |

  @jira.<jira_id> @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-6428 @jira.link.depends_on.QANOV-6429
  @jira.link.depends_on.QANOV-6430 @jira.link.depends_on.QANOV-6432 @jira.link.relates_to.NOV-92076 @mobile @moves
  Scenario Outline: Postpay user can see more information about the consumption
    Given user has a "<account_type> postpay" account type
      And user has a "mobile_line" product
      And user has the "event-history-total-<account_type_name>" module configured in CMS for "consumption-details-<allowance_name>" page for the "mobile" product
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Consumption" page
     When clicks on the "<allowance>" tab
      And clicks on the "info_icon" icon
     Then the "Consumption More Information" page is displayed
      And the "Más información" header is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Información de tu consumo" text is displayed
      And the "subtitle" textfield is displayed

    @smoke @automatic @qa @live @cert2 @next @webapp
    Examples:
          | account_type | account_type_name | allowance | allowance_name | jira_id    |
          | telco        | postpay-telco     | data      | data           | QANOV-6434 |

    @regression @automatic @qa @live @cert2 @next @webapp
    Examples:
          | account_type | account_type_name | allowance | allowance_name | jira_id    |
          | telco        | postpay           | minutes   | calls          | QANOV-6434 |
          | telco        | postpay           | messages  | messages       | QANOV-6434 |

    @regression @no_automatable
    Examples:
          | account_type | account_type_name | allowance | allowance_name | jira_id    |
          | legado       | postpay-legado    | data      | data           | QANOV-6434 |
          | legado       | legado            | minutes   | calls          | QANOV-6434 |
          | legado       | legado            | sms       | messages       | QANOV-6434 |

  @jira.<jira_id> @<impeded> @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-6428 @jira.link.depends_on.QANOV-6429
  @jira.link.depends_on.QANOV-6430 @jira.link.depends_on.QANOV-6432 @jira.link.depends_on.QANOV-6435
  @jira.link.depends_on.QANOV-6436 @jira.link.depends_on.QANOV-6437 @jira.link.depends_on.QANOV-6681
  @jira.link.relates_to.NOV-82317 @mobile @moves @regression
  Scenario Outline: User can see a bar chart with the daily consumption made within the billing period
    LEGADO POSTPAY (Live): 05960856S
    LEGADO PREPAY (Dev): 656874631
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product
      And user has a "any_admin" role
      And user has "<allowance>_roundel" allowances in the "mobile_line" product
      And user has made consumption on the "<allowance>" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user has the "event-history-aggregated-<account_type_name>" module configured in CMS for "consumption-details-<allowance_name>" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "<allowance>" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "consumption_graph_title" textfield with "Consumo diario" text is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the consumptions are displayed in the "y" axis of the "consumption_graph" graph
      And the selected day line is displayed in the "today" day of the "consumption_graph" graph

    @manual
    Examples:
          | account_type   | account_type_name | allowance | allowance_name | impeded      | jira_id      |
          | telco postpay  | postpay-telco     | data      | data           |              | QANOV-6532   |
          | legado postpay | postpay-legado    | data      | data           |              | QANOV-250895 |
          | postpay        | postpay           | minutes   | calls          |              | QANOV-6541   |
          | postpay        | postpay           | sms       | messages       | impeded_mock | QANOV-6554   |

    @no_automatable @impeded_legacy
    Examples:
          | account_type  | account_type_name | allowance | allowance_name | impeded      | jira_id    |
          | legado prepay | prepay            | data      | data           |              | QANOV-6564 |
          | legado prepay | prepay            | minutes   | calls          |              | QANOV-6576 |
          | legado prepay | prepay            | sms       | messages       | impeded_mock | QANOV-6586 |

  @jira.<jira_id> @<impeded> @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-6586 @jira.link.relates_to.NOV-82319
  @mobile @moves @regression
  Scenario Outline: User can interact with the bar chart of consumption events
    LEGADO POSTPAY (Live): 05960856S
    LEGADO PREPAY (Dev): 656874631
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product
      And user has a "admin" role
      And user has "<allowance>" allowances in the "mobile_line" product
      And user has made consumption on the "<allowance>" allowances in the "mobile_line" product
      And user has the "event-history-aggregated-<account_type_name>" module configured in CMS for "consumption-details-<allowance_name>" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Consumption" page
     When clicks on a different day in the "consumption_graph" graph
     Then the "consumption_graph.selected_day" line is displayed in the "selected" day
      And the "consumption_graph.selected_value" textfield with the "dd mmm · XX" format is displayed

    @manual
    Examples:
          | account_type   | account_type_name | allowance | allowance_name | impeded      | jira_id      |
          | telco postpay  | postpay-telco     | data      | data           |              | QANOV-6603   |
          | legado postpay | postpay-legado    | data      | data           |              | QANOV-250896 |
          | postpay        | postpay           | minutes   | calls          |              | QANOV-6615   |
          | postpay        | postpay           | sms       | messages       | impeded_mock | QANOV-6625   |

    @automation.pending_mock @manual
    Examples:
          | account_type | account_type_name | allowance | allowance_name | impeded | jira_id    |
          | postpay      | postpay           | others    | others         |         | QANOV-6634 |

    @no_automatable @impeded_legacy
    Examples:
          | account_type  | account_type_name | allowance | allowance_name | impeded      | jira_id    |
          | legado prepay | prepay            | data      | data           |              | QANOV-6643 |
          | legado prepay | prepay            | minutes   | calls          |              | QANOV-6658 |
          | legado prepay | prepay            | sms       | messages       | impeded_mock | QANOV-6669 |

  @jira.QANOV-6753 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-47974 @manual @mobile @moves @regression
  @impeded_legacy
  Scenario: Legado Admin light can't see the allowance details of a line different to the one used to login: user escalation is required
    Given user has a "legado postpay" account type
      And user has a "mobile_line" product
      And user has a "admin-light" role
      And user has a "fusion;pikolin" plan
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     When clicks on the "non_logged_mobile_line" mobile line roundel
      And the "Mobile Line Dashboard" page is displayed
      And clicks on the "any_roundel" allowance roundel
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.<jira_id> @<impeded> @android @automation.pending_mock @ios @jira.cv.10.4 @jira.link.relates_to.NOV-47922 @manual
  @mobile @moves @regression
  Scenario Outline: User who has consumed data on "Pago por uso", can access to data consumption details from the mobile line screen
    internal_checkpoint="MOVES DEV: moves-4 -> First line"
    commented_tags="@depends_on.NOV-47913 @depends_on.NOV-194546"
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has a "<role>" role
      And user has "pay_per_use" activated in the "<mobile_line>" product
      And user has consumed "100%" of the "data" allowance in the "<mobile_line>" product
      And user has made consumption on the "data-ppu" allowances in the "<mobile_line>" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "pay_per_use_section" button
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "data" tab is selected

    Examples:
          | role        | mobile_line        | impeded      | jira_id    |
          | admin       | mobile_line        |              | QANOV-6761 |
          | admin-light | logged_mobile_line | impeded_mock | QANOV-6767 |
