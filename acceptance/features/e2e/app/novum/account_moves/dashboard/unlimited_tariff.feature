# -*- coding: utf-8 -*-
@jira.QANOV-7301
Feature: Unlimited tariff

  Actions Before the Feature:
    Given user has a "mobile_line" product


  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-21054
  @jira.link.relates_to.NOV-199561 @mobile @moves
  Scenario Outline: User who has contracted an unlimited tariff and hasn't data sharing activated can see his/her allowance counters
    internal_checkpoint="- NOTE: pending to know the text inside the roundel when no consumption
    - NOTE: the two possible unlimited tariffs are:
    - 'Contrato ilimitado' (for mobile lines)
    - 'Línea adicional ilimitada' (for mobile contract or Fusion plans)"
    Given user has "<allowance_type>" allowances in the "mobile_line" product
      And the "<allowance_type>" allowance is unlimited in the "mobile_line" product
      And user has "data_sharing" service in "deactivated" status
      And user has the "consumption-counters-mobile" module configured in CMS for any of the "mobile,dashboard" pages for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "<allowance_type>_roundel_color" allowance roundel is displayed in "blue" colour
      And the "<allowance_type>_roundel.title" textfield with the "Llevas" format is displayed
      And the "<allowance_type>_roundel.amount" textfield with the "\d* (MB|GB|SMS|minutos)" format is displayed
      And the "<allowance_type>_roundel.subtitle" textfield with the "de ilimitados" format is displayed

    @automatic @live @cert2 @next @ber @qa @webapp
    Examples:
          | allowance_type | test_priority | jira_id    |
          | data           | sanity        | QANOV-7304 |

    @manual
    Examples:
          | allowance_type   | test_priority | jira_id    |
          | minutes_roundel  | regression    | QANOV-7312 |
          | messages_roundel | regression    | QANOV-7318 |

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.depends_on.QANOV-7304
  @jira.link.detects.MOVES-4734 @jira.link.parent_test_plan.QANOV-21054 @jira.link.relates_to.NOV-199597 @mobile
  @moves
  Scenario Outline: User who has contracted an unlimited tariff and hasn't data sharing activated can access to "Gestionar datos" screen
    internal_checkpoint="- NOTE: pending to see what happens if the user has just one line (because in this case, he/she
    cannot have data sharing)
    - If the user has one extra bundle activated, the extra bundle entry with the 'Desactivar' button is displayed"
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And the "data" allowance is unlimited in the "mobile_line" product
      And user has "data_sharing" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "<cms_module>" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "<button>" button
     Then the "Data Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "data_sharing_activate" module is displayed
      And the "data_sharing_activate.manage" button with "Activar" text is displayed

    @smoke @next @qa @live @automatic @cert2
    Examples:
          | account_type | button                   | cms_module       | jira_id    |
          | telco        | services_data_management | services-summary | QANOV-7325 |

    @regression @impeded_legacy @no_automatable
    Examples:
          | account_type | button                        | cms_module           | jira_id      |
          | legado       | smart_actions.data_management | smart-actions-legado | QANOV-235818 |


  @jira.<jira_id> @<execution_mode> @android @cert2 @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-21054
  @jira.link.relates_to.NOV-199625 @live @mobile @moves @next @regression
  Scenario Outline: User who has contracted an unlimited tariff and has data sharing activated can see his/her allowance counters
    internal_checkpoint="- NOTE: the line with unlimited data will bring 25 GB to the total of shared data.
    - NOTE: pending to know the text inside the unlimited roundel when no consumption
    - NOTE: the two possible unlimited tariffs are:
    - 'Contrato ilimitado' (for mobile lines)
    - 'Línea adicional ilimitada' (for mobile contract or Fusion plans)"
    Given user has "<allowance_type>" allowances in the "mobile_line" product
      And the "<allowance_type>" allowance is unlimited in the "mobile_line" product
      And user has "data_sharing" service in "activated" status
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for any of the "mobile,dashboard" pages for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
      And the "<allowance_type>_remaining_allowance_counter.title" textfield with the "Llevas" format is displayed
      And the "<allowance_type>_remaining_allowance_counter.amount" textfield with the "\d* (MB|GB|SMS|minutos)" format is displayed
      And the "<allowance_type>_remaining_allowance_counter.subtitle" textfield with the "de \d* (MB|GB|SMS|minutos)" format is displayed

    @manual
    Examples:
          | allowance_type | execution_mode | jira_id    |
          | data           | automatic      | QANOV-7350 |

    @automation.pending_mock @impeded_mock
    Examples:
          | allowance_type | execution_mode | jira_id    |
          | minutes        | manual         | QANOV-7371 |
          | sms            | manual         | QANOV-7385 |

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.depends_on.QANOV-7350
  @jira.link.parent_test_plan.QANOV-21054 @jira.link.relates_to.NOV-199644 @mobile @moves @regression
  Scenario Outline: User who has contracted an unlimited tariff and has data sharing activated can access to "Gestionar datos" screen
    internal_checkpoint="- Pending to see what happens if the user has just one line (because in this case,
    he/she cannot have data sharing).
    - If the user has Netflix contracted there will appear an extra data bundle in the Data Consumption screen
    that won't be appearing in the Data management screen (see NOV-74862)
    - If the user has one extra bundle activated, the extra bundle entry with the 'Desactivar' button is displayed"
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And the "data" allowance is unlimited in the "mobile_line" product
      And user has "data_sharing" service in "activated" status
      And user has the matching subscription selected in the account
      And user has the "<cms_module>" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "<button>" button
     Then the "Data Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "data_sharing_activate" module is displayed
      And the "data_sharing_activate.manage" button with "Desactivar" text is displayed
      And the "pay_per_use_activate" module is not displayed

    @automatic @cert2 @live @next
    Examples:
          | account_type | button                        | cms_module           | jira_id      |
          | telco        | services_data_management      | services-summary     | QANOV-7387   |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | button                        | cms_module           | jira_id      |
          | legado       | smart_actions.data_management | smart-actions-legado | QANOV-235820 |

  @jira.QANOV-7389 @android @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-21054 @jira.link.relates_to.NOV-199775
  @manual @mobile @moves @regression
  Scenario: User who had purchased an unlimited data bundle and without data sharing enabled will see the Unlimited roundel on the Mobile line dashboard
    Given user has the "unlimited_bundle" data bundle purchased
      And user has "data_sharing" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for any of the "mobile,dashboard" pages for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     Then the "current_roundel.title" textfield with the "Llevas" format is displayed
      And the "current_roundel.amount" textfield with the "\d* (MB|GB|SMS|minutos)" format is displayed
      And the "current_roundel.subtitle" textfield with the "de ilimitados" format is displayed

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.7
  @jira.link.parent_test_plan.QANOV-21054 @jira.link.relates_to.NOV-199857 @manual @mobile @moves @regression
  Scenario Outline: User's mobile line is changed to an unlimited data tariff and hasn't data sharing activated: the user can access to the "Gestionar datos" screen
    Given user has a "<account_type>" account type
      And user has a "fusion" plan
      And user has "several" mobile lines
      And user has "data_sharing" service in "deactivated" status
      And the current tariff of the mobile line product has been changed to an unlimited data tariff
      And user has the matching subscription selected in the account
      And user has the "<cms_module>" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "<button>" button
     Then the "Data Management" page is displayed
      And the "data_sharing_activate" module is displayed
      And the "data_sharing_activate.manage" button with "Activar" text is displayed

    @manual
    Examples:
          | account_type | button                        | cms_module           | jira_id      |
          | telco        | services_data_management      | services-summary     | QANOV-7394   |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | button                        | cms_module           | jira_id      |
          | legado       | smart_actions.data_management | smart-actions-legado | QANOV-235821 |

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-21054 @jira.link.relates_to.NOV-199860
  @mobile @moves @regression
  Scenario Outline: User's mobile line is changed to an unlimited data tariff and has data sharing activated: the user can access to the "Gestionar datos" screen
    Given user has a "<account_type>" account type
      And user has a "fusion" plan
      And user has "several" mobile lines
      And user has "data_sharing" service in "activated" status
      And the current tariff of the mobile line product has been changed to an unlimited data tariff
      And user has the matching subscription selected in the account
      And user has the "<cms_module>" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "<button>" button
     Then the "Data Management" page is displayed
      And the "data_sharing_activate" module is displayed
      And the "data_sharing_activate.manage" button with "Desactivar" text is displayed

    @manual
    Examples:
          | account_type | button                        | cms_module           | jira_id      |
          | telco        | services_data_management      | services-summary     | QANOV-7399   |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | button                        | cms_module           | jira_id      |
          | legado       | smart_actions.data_management | smart-actions-legado | QANOV-235822 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.7
  @jira.link.parent_test_plan.QANOV-21054 @jira.link.relates_to.NOV-199861 @mobile @moves @regression
  Scenario Outline: User's mobile line is changed to an unlimited data tariff and has an extra data bundle: the user can access to the "Gestionar datos" screen
    internal_checkpoint="- NOTE: If the user has Netflix contracted there will appear an extra data bundle in the Data
    Consumption screen that won't be appearing in the Data management screen (see NOV-74862)"
    Given user has a "<account_type>" account type
      And user has a "fusion" plan
      And user has "several" mobile lines
      And user has the "any" data bundle purchased
      And the current tariff of the mobile line product has been changed to an unlimited data tariff
      And user has the matching subscription selected in the account
      And user has the "<cms_module>" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "<button>" button
     Then the "Data Management" page is displayed
      And the "bundle_list" list contains "1" elements
      And each element in the "bundle_list" list has the "manage_button" button with "Dar de baja" text

    @manual
    Examples:
          | account_type | button                        | cms_module           | jira_id      |
          | telco        | services_data_management      | services-summary     | QANOV-7401   |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | button                        | cms_module           | jira_id      |
          | legado       | smart_actions.data_management | smart-actions-legado | QANOV-235823 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.7
  @jira.link.parent_test_plan.QANOV-21054 @jira.link.relates_to.NOV-199862 @mobile @moves @regression
  Scenario Outline: User's mobile line is changed to an unlimited data tariff and hasn't any extra data bundle: the user can access to the "Gestionar datos" screen
    Given user has a "<account_type>" account type
      And user has a "fusion" plan
      And user has "several" mobile lines
      And user has the "none" data bundle purchased
      And the current tariff of the mobile line product has been changed to an unlimited data tariff
      And user has the matching subscription selected in the account
      And user has the "<cms_module>" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "<button>" button
     Then the "Data Management" page is displayed
      And the "bundle_list" list is not displayed

    @manual
    Examples:
          | account_type | button                        | cms_module           | jira_id      |
          | telco        | services_data_management      | services-summary     | QANOV-7404   |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | button                        | cms_module           | jira_id      |
          | legado       | smart_actions.data_management | smart-actions-legado | QANOV-235824 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.7
  @jira.link.parent_test_plan.QANOV-21054 @jira.link.relates_to.NOV-199863 @mobile @moves @regression
  Scenario Outline: User's mobile line is changed to an unlimited data tariff and has the pay per use activated: the user can access to the "Gestionar datos" screen
    Given user has a "<account_type>" account type
      And user has a "fusion" plan
      And user has "several" mobile lines
      And user has "pay_per_use" service in "activated" status
      And the current tariff of the mobile line product has been changed to an unlimited data tariff
      And user has the matching subscription selected in the account
      And user has the "<cms_module>" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "<button>" button
     Then the "Data Management" page is displayed
      And the "pay_per_use_activate" module is displayed
      And the "pay_per_use_activate.manage" button with "Desactivar" text is displayed

    @manual
    Examples:
          | account_type | button                        | cms_module           | jira_id      |
          | telco        | services_data_management      | services-summary     | QANOV-7408   |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | button                        | cms_module           | jira_id      |
          | legado       | smart_actions.data_management | smart-actions-legado | QANOV-235825 |

  @jira.QANOV-7411 @android @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-21054 @jira.link.relates_to.NOV-199960
  @manual @mobile @moves @regression
  Scenario: User who had purchased an unlimited data bundle and with data sharing enabled won't see the Unlimited roundel on the Mobile line dashboard
    Given user has the "unlimited_bundle" data bundle purchased
      And user has "data_sharing" service in "activated" status
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for any of the "mobile,dashboard" pages for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     Then the "current_roundel.title" textfield with the "Llevas" format is displayed
      And the "current_roundel.amount" textfield with the "\d* (MB|GB|SMS|minutos)" format is displayed
      And the "current_roundel.subtitle" textfield with the "de d* (MB|GB|SMS|minutos)" format is displayed
      And the "current_roundel.subtitle" textfield does not contains the "ilimitado" text
