# -*- coding: utf-8 -*-
@jira.QANOV-4226
Feature: Shared data in plan


  @jira.<jira_id> @<ber> @android @ios @jira.cv.12.0 @jira.link.detects.VIVO-2264 @jira.link.parent_test_plan.QANOV-21791
  @live @mobile @next @vivobr @old_app
  Scenario Outline: A <account_type> admin user with data sharing can see the "distribuir internet" entrypoint in the admin mobile line dashboard
    internal_checkpoint="Default scenario (100% shared): As default this kind of plan shares all benefits as data,
    voice, and SMS with all lines, so everyone can use every amount."
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has data sharing
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     When clicks on the mobile line with role "admin"
      And the "Mobile Line Dashboard" page is displayed
     Then the "share_internet" module is displayed
      And the "share_internet.title" entrypoint with "Distribuir minha internet" text is displayed
      And the "share_internet.subtitle" textfield with "Escolher quanto e com quem distribuir" text is displayed
      And the "share_internet.chevron" icon is displayed

    @automatic @qa @smoke
    Examples:
          | account_type | ber | jira_id      |
          | convergente  |     | QANOV-340331 |

    @automatic @live @next @qa @sanity
    Examples:
          | account_type | ber | jira_id     |
          | multivivo    | ber | QANOV-21889 |

  @jira.<jira_id> @<automation> @<execution_mode> @<impeded> @android @ios @jira.cv.12.0
  @jira.link.parent_test_plan.QANOV-21791 @live @mobile @next @regression @vivobr @old_app
  Scenario Outline: Admin user with data sharing cannot see the "distribuir internet" entrypoint in the dependent mobile line dashboard
    internal_checkpoint="Default scenario (100% shared): As default this kind of plan shares all benefits as data,
    voice, and SMS with all lines, so everyone can use every amount."
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has data sharing
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     When clicks on the mobile line with role "dependent"
     Then the "Mobile Line Dashboard" page is displayed
      And the "share_internet" module is not displayed

    Examples:
          | account_type | execution_mode | impeded      | automation              | jira_id     |
          | convergente  | manual         | impeded_mock | automation.pending_mock | QANOV-21890 |
          | multivivo    | automatic      |              |                         | QANOV-21891 |

  @jira.<jira_id> @<automation> @<impeded> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-185572 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: Dependent user with data sharing cannot see the "distribuir internet" entrypoint in the account dashboard
    internal_checkpoint="Default scenario (100% shared): As default this kind of plan shares all benefits as data,
    voice, and SMS with all lines, so everyone can use every amount."
    Given user has a "<account_type>" account type
      And user has a "dependent" role
      And user has data sharing
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "share_internet" module is not displayed

    Examples:
          | cv    | account_type | parent_test_plan | impeded      | automation              | jira_id    |
          | 11.12 | multivivo    | QANOV-21949      |              |                         | QANOV-4227 |
          | 12.0  | convergente  | QANOV-21791      | impeded_mock | automation.pending_mock | QANOV-4228 |

  @jira.<jira_id> @<automation> @<impeded> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual
  @mobile @regression @vivobr @old_app
  Scenario Outline: Dependent user with data sharing can see the total consumed among all lines in the consumption roundels
    Given user has a "<account_type>" account type
      And user has a "dependent" role
      And user has data sharing
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the consumed quota displayed in the consumption roundels corresponds to the total consumed among all lines

    Examples:
          | cv    | account_type | impeded      | automation              | jira_id     |
          | 11.12 | multivivo    |              |                         | QANOV-21893 |
          | 12.0  | convergente  | impeded_mock | automation.pending_mock | QANOV-21892 |

  @jira.<jira_id> @<automation> @<impeded> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual
  @mobile @regression @vivobr @old_app
  Scenario Outline: Admin user with data sharing can see the total consumed among all lines in the consumption roundels
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has data sharing
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     When clicks on the "any" mobile line roundel
      And the "Mobile Line Dashboard" page is displayed
     Then the consumed quota displayed in the consumption roundels corresponds to the total consumed among all lines

    Examples:
          | account_type | impeded      | automation              | jira_id     |
          | multivivo    |              |                         | QANOV-21895 |
          | convergente  | impeded_mock | automation.pending_mock | QANOV-21894 |

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @mobile
  @regression @vivobr @old_app
  Scenario Outline: <account_type> user with data sharing can see the data packages detailed in the data consumption screen
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has data sharing
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user has the "consumption-counters-mobile" module configured in CMS for "mobile" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the mobile line with role "admin"
      And the "Mobile Line Dashboard" page is displayed
      And clicks on the "data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "como_quiser_bundles_list" list is displayed
      And each element in the "como_quiser_bundles_list" list has the "current_line" textfield with the "Minha linha: \d+ (MB|GB|KB)" format
      And each element in the "como_quiser_bundles_list" list has the "other_lines" textfield with the "Outras linhas: \d+ (MB|GB|KB)" format

    @qa
    Examples:
          | account_type | ber | jira_id      |
          | convergente  |     | QANOV-340332 |

    @live @next @qa
    Examples:
          | account_type | ber | jira_id      |
          | multivivo    | ber | QANOV-340333 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.12.0 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-21791 @mobile @vivobr @old_app
  Scenario Outline: Admin user with data sharing can see the usage details for each line
    internal_checkpoint="The only allowance that is possible to distribute among lines is 'Meu Plano'
    (the main plan quota). Then, this page will only show the usage for this quota."
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has data sharing
      And user has the matching subscription selected in the account
      And user has the "simple-action-row" module configured in CMS for "mobile" page for the plan selected
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user has the "multivivo-related-counters" module configured in CMS for "shared-data" page for the plan selected
      And user is in the "Account" page
     When clicks on the mobile line with role "admin"
      And the "Mobile Line Dashboard" page is displayed
      And clicks on the "share_internet" entrypoint
     Then the "Distribute Internet" page is displayed
      And the "Distribuir internet" header is displayed
      And the "days_to_renewal" textfield with the "Minha franquia renova em \d+ (dia|dias|horas|hora)" format is displayed
      And the "billing_cycle" textfield with the "Faturamento \d\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez) - \d\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format is displayed
      And the "usage_progress_bar" progression bar is displayed
      And the "usage_per_line_title" textfield with "QUANTO JÁ USEI POR LINHA" text is displayed
      And the "usage_per_line_list" list is displayed with all the lines associated to the multivivo plan
      And each element in the "usage_per_line_list" list has the "mobile_icon" field
      And each element in the "usage_per_line_list" list has the "phone_number" field
      And each element in the "usage_per_line_list" list has the "label" textfield with "Celular" text
      And each element in the "usage_per_line_list" list has the "data_usage" textfield with the "\d+ (MB|GB|KB)( de \d+ (MB|GB|KB))?" format
      And clicks on the "navigation_top_bar.back_button" button
      And the "Mobile Line Dashboard" page is displayed
      And the "Celular" header is displayed

    @manual @smoke
    Examples:
          | account_type | depends_on | ber | jira_id     |
          | convergente  |            |     | QANOV-21896 |

    @automatic @live @next @qa @sanity
    Examples:
          | account_type | depends_on  | ber | jira_id     |
          | multivivo    | QANOV-21889 | ber | QANOV-21897 |

  @jira.<jira_id> @<automation> @<execution_mode> @<impeded> @android @ios @jira.cv.12.0
  @jira.link.depends_on.<depends_on> @jira.link.detects.VIVO-2270 @jira.link.parent_test_plan.QANOV-21791 @live @mobile
  @next @regression @vivobr @old_app
  Scenario Outline: Admin user with data sharing can manage the data usage per line
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has data sharing
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     When clicks on the mobile line with role "admin"
      And the "Mobile Line Dashboard" page is displayed
      And clicks on the "share_internet" entrypoint
      And the "Distribute Internet" page is displayed
      And clicks on the "distribuir_internet_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Distribuir internet" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Distribute Internet" page is displayed

    Examples:
          | account_type | depends_on  | execution_mode | impeded      | automation              | jira_id     |
          | convergente  | QANOV-21896 | manual         | impeded_mock | automation.pending_mock | QANOV-21900 |
          | multivivo    | QANOV-21897 | automatic      |              |                         | QANOV-21901 |

  @jira.<jira_id> @android @automatic @automation.pending_mock @impeded_mock @ios @jira.cv.12.0
  @jira.link.parent_test_plan.QANOV-21791 @live @mobile @next @smoke @vivobr @old_app
  Scenario Outline: Admin user with data distributed can see the "distribuir internet" entrypoint in the admin mobile line dashboard
    internal_checkpoint="Internet distributed scenario: user can distribute internet allowance among each line assigning
    a specific quota to each line."
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has data distributed
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page
      And user has the "simple-action-row" module configured in CMS for "mobile" page for the plan selected
      And user is in the "Account" page
     When clicks on the mobile line with role "admin"
      And the "Mobile Line Dashboard" page is displayed
     Then the "share_internet" module is displayed
      And the "share_internet.title" entrypoint with "Distribuir minha internet" text is displayed
      And the "share_internet.subtitle" textfield with "Escolher quanto e com quem distribuir" text is displayed
      And the "share_internet.chevron" icon is displayed

    Examples:
          | account_type | jira_id     |
          | convergente  | QANOV-4237  |
          | multivivo    | QANOV-21902 |

  @jira.<jira_id> @android @automatic @automation.pending_mock @impeded_mock @ios @jira.cv.12.0
  @jira.link.parent_test_plan.QANOV-21791 @live @mobile @next @regression @vivobr @old_app
  Scenario Outline: Admin user with data distributed cannot see the "distribuir internet" entrypoint in the dependent mobile line dashboard
    internal_checkpoint="Internet distributed scenario: user can distribute internet allowance among each line assigning
    a specific quota to each line."
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has data distributed
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
     When clicks on the mobile line with role "dependent"
      And the "Mobile Line Dashboard" page is displayed
     Then the "share_internet" module is not displayed

    Examples:
          | account_type | jira_id     |
          | convergente  | QANOV-21903 |
          | multivivo    | QANOV-21904 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-185653 @mobile @regression @vivobr @old_app
  Scenario Outline: Dependent user with data distributed cannot see the "distribuir internet" entrypoint in the account dashboard
    internal_checkpoint="Internet distributed scenario: user can distribute internet allowance among each line assigning
    a specific quota to each line."
    Given user has a "<account_type>" account type
      And user has a "dependent" role
      And user has data distributed
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "share_internet" module is not displayed

    @automatic @qa
    Examples:
          | cv    | account_type | parent_test_plan | ber | jira_id      |
          | 11.12 | multivivo    | QANOV-21949      | ber | QANOV-340334 |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | cv   | account_type | parent_test_plan | ber | jira_id    |
          | 12.0 | convergente  | QANOV-21791      |     | QANOV-4235 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.0
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: Dependent user with data distributed can see the total consumed by his/her line in the consumption roundels
    Given user has a "<account_type>" account type
      And user has a "dependent" role
      And user has data distributed
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the mobile data quota displayed in the consumption roundels corresponds to the distribution selected for his/her line
      And the consumed quota displayed in the consumption roundels corresponds to the total consumed by his/her line

    Examples:
          | account_type | jira_id     |
          | convergente  | QANOV-21905 |
          | multivivo    | QANOV-21906 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.0
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: Admin user with data distributed can see the total consumed by his/her line in the consumption roundels
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has data distributed
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     When clicks on an activated mobile line
      And the "Mobile Line Dashboard" page is displayed
     Then the mobile data quota displayed in the consumption roundels corresponds to the distribution selected for that line
      And the consumed quota displayed in the consumption roundels corresponds to the total consumed by that line

    Examples:
          | account_type | jira_id     |
          | convergente  | QANOV-21907 |
          | multivivo    | QANOV-21908 |

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @mobile @qa
  @regression @vivobr @old_app
  Scenario Outline: <account_type> user with data distributed can see the data packages detailed in the data consumption screen
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has data distributed
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user has the "consumption-counters-mobile" module configured in CMS for "mobile" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the mobile line with role "admin"
      And the "Mobile Line Dashboard" page is displayed
      And clicks on the "data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "como_quiser_bundles_list" list is displayed
      And each element in the "como_quiser_bundles_list" list does not have the "current_line" field
      And each element in the "como_quiser_bundles_list" list does not have the "other_lines" field

    Examples:
          | account_type | ber | jira_id      |
          | convergente  |     | QANOV-340337 |
          | multivivo    | ber | QANOV-340339 |

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.12.0 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-21791 @live @mobile @next @qa @smoke @vivobr @old_app
  Scenario Outline: Admin user with data distributed can see the usage details for each line
    internal_checkpoint="The only allowance that is possible to distribute among lines is 'Meu Plano'
    (the main plan quota). Then, this page will only show the usage for this quota."
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has data distributed
      And user has the matching subscription selected in the account
      And user has the "simple-action-row" module configured in CMS for "mobile" page for the plan selected
      And user has the "multivivo-related-counters" module configured in CMS for "shared-data" page for the plan selected
      And user is in the "Account" page
     When clicks on the mobile line with role "admin"
      And the "Mobile Line Dashboard" page is displayed
      And clicks on the "share_internet" entrypoint
     Then the "Distribute Internet" page is displayed
      And the "Distribuir internet" header is displayed
      And the "days_to_renewal" textfield with the "Minha franquia renova em \d+ (dia|dias|horas|hora)" format is displayed
      And the "billing_cycle" textfield with the "Faturamento \d\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez) - \d\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format is displayed
      And the "usage_progress_bar" progression bar is displayed
      And the "usage_per_line_title" textfield with "QUANTO JÁ USEI POR LINHA" text is displayed
      And the "usage_per_line_list" list is displayed with all the lines associated to the multivivo plan
      And each element in the "usage_per_line_list" list has the "mobile_icon" field
      And each element in the "usage_per_line_list" list has the "phone_number" field
      And each element in the "usage_per_line_list" list has the "label" textfield with "Celular" text
      And each element in the "usage_per_line_list" list has the "data_usage" textfield with the "\d+ (MB|GB|KB) de \d+ (MB|GB|KB)" format
      And clicks on the "navigation_top_bar.back_button" button
      And the "Mobile Line Dashboard" page is displayed
      And the "Celular" header is displayed

    Examples:
          | account_type | depends_on  | ber | jira_id      |
          | convergente  | QANOV-4237  |     | QANOV-340340 |
          | multivivo    | QANOV-21902 | ber | QANOV-340342 |

  @jira.<jira_id> @android @automatic @automation.pending_mock @impeded_mock @ios @jira.cv.12.0 @old_app
  @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-21791 @live @mobile @next @regression @vivobr
  Scenario Outline: Admin user with data distributed can manage the data usage per line
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has data distributed
      And user has the matching subscription selected in the account
      And user has the "simple-action-row" module configured in CMS for "mobile" page for the plan selected
      And user is in the "Account" page
     When clicks on the mobile line with role "admin"
      And the "Mobile Line Dashboard" page is displayed
      And clicks on the "share_internet" entrypoint
      And the "Distribute Internet" page is displayed
      And clicks on the "distribuir_internet_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Distribuir internet" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Distribute Internet" page is displayed
      And the "Distribuir internet" header is displayed

    Examples:
          | account_type | depends_on | jira_id     |
          | convergente  |            | QANOV-21913 |
          | multivivo    |            | QANOV-21914 |

  @jira.<jira_id> @<automation> @<impeded> @android @ios @jira.cv.12.0 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: <account_type> user with data shared/distributed and <allowance_type> unlimited allowances can see the package detailed in the <allowance_type> consumption screen
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And the "<allowance_type>" allowance is unlimited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "any" mobile line roundel
      And the "Mobile Line Dashboard" page is displayed
      And clicks on the "data_roundel" allowance roundel
      And the "Mobile Line Consumption" page is displayed
      And clicks on the "<allowance_type>" tab
     Then the "<allowance_type>" tab is selected
      And the "allowances_list" list is displayed
      And each element in the "allowances_list" list has the "roundel" field displayed in "purple" color
      And each element in the "allowances_list" list has not the "allowance_legend" module

    Examples:
          | account_type | allowance_type | detects       | impeded      | automation              | jira_id     |
          | convergente  | minutes        | ACCOUNT-16036 | impeded_mock | automation.pending_mock | QANOV-26310 |
          | convergente  | sms            |               | impeded_mock | automation.pending_mock | QANOV-26311 |
          | multivivo    | minutes        |               |              |                         | QANOV-26312 |
          | multivivo    | sms            |               |              |                         | QANOV-26313 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.0
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: <account_type> user with data shared/distributed and limited <allowance_type> allowances can see the package detailed in the <allowance_type> consumption screen
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has made consumption on the "<allowance_type>" allowances in the "mobile_line" product
      And user has a dependent line with consumption on the "<allowance_type>" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "any" mobile line roundel
      And the "Mobile Line Dashboard" page is displayed
      And clicks on the "data" allowance roundel
      And the "Mobile Line Consumption" page is displayed
      And clicks on the "<allowance_type>" tab
     Then the "<allowance_type>" tab is selected
      And the consumed quota displayed in the consumption card corresponds to the total consumed among all lines
      And the "<allowance_type>_allowances_list" list is displayed
      And each element in the "<allowance_type>_allowances_list" list has the "allowance_legend" module
      And each element in the "<allowance_type>_allowances_list" list has the "allowance_legend.current_line" field
      And each element in the "<allowance_type>_allowances_list" list has the "allowance_legend.other_lines" field

    Examples:
          | account_type | allowance_type | jira_id     |
          | convergente  | minutes        | QANOV-26322 |
          | convergente  | messages       | QANOV-26323 |
          | multivivo    | minutes        | QANOV-26324 |
          | multivivo    | messages       | QANOV-26325 |

  @jira.<jira_id> @<automation> @<impeded> @android @ios @jira.cv.12.3 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: <account_type> admin user with data sharing/distributed will see the admin line in first position of the list in "Share internet" screen
    other_affected_versions=2021-20
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "simple-action-row" module configured in CMS for "mobile" page
      And user has the "multivivo-related-counters" module configured in CMS for "shared-data" page
      And user is in the "Account" page
     When clicks on the mobile line with role "admin"
      And the "Mobile Line Dashboard" page is displayed
      And clicks on the "share_internet" entrypoint
     Then the "Distribute Internet" page is displayed
      And the "Distribuir internet" header is displayed
      And the "usage_per_line_title" textfield with "Quanto já usei por linha" text is displayed
      And the "usage_per_line_list" list is displayed with all the lines associated to the multivivo plan
      And the "admin_mobile_line" is in the "0" position of "usage_per_line_list" list

    Examples:
          | account_type | impeded      | automation              | jira_id     |
          | convergente  | impeded_mock | automation.pending_mock | QANOV-84601 |
          | multivivo    |              |                         | QANOV-84602 |
