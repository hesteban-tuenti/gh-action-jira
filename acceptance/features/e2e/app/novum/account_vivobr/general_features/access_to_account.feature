# -*- coding: utf-8 -*-
@jira.QANOV-4328
Feature: Access to account


  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @old_app
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-30 @mobile @no_automatable @smoke @vivobr
  Scenario Outline: A <account_type> user selects Account icon: account screen will be displayed with the tabs corresponding to that Brand
    This scenario is automated for legacy prepay but we do not have users
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.account_tab" tab
     Then the "AccountV1" page is displayed
      And the "consumption_tab" tab with "Consumo" text is displayed
      And the "<tab>_tab" tab with "<tab_text>" text is displayed
      And the "services_tab" tab with "Serviços" text is displayed

    @impeded_legacy
    Examples:
          | account_type   | tab   | tab_text | parent_test_plan | cv   | jira_id      |
          | legacy control | bills | Conta    | QANOV-21950      | 10.4 | QANOV-4415   |
          | legacy postpay | bills | Conta    | QANOV-21950      | 10.4 | QANOV-4416   |
          | jeri postpay   | bills | Conta    | QANOV-226748     | 13.6 | QANOV-228714 |

  @jira.QANOV-295154 @android @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-4416 @jira.link.parent_test_plan.QANOV-21950
  @jira.link.parent_test_plan.QANOV-226748 @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.NOV-28 @manual
  @mobile @no_automatable @regression @vivobr @old_app
  Scenario: User reloads the Account: consumption screen is displayed
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has any "legacy control;legacy postpay;jeri postpay" account types
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "ConsumptionV1" page
     When pulls down the page to refresh
     Then the "loading" icon is displayed
      And the "ConsumptionV1" page is displayed

  @jira.QANOV-4418 @android @ios @jira.cv.9.12 @jira.link.depends_on.QANOV-4416 @jira.link.parent_test_plan.QANOV-21950
  @jira.link.parent_test_plan.QANOV-226748 @jira.link.relates_to.NOV-773 @manual @mobile @no_automatable @smoke @vivobr
  @old_app
  Scenario: User selects Consumption tab from another tab in the account section: consumption information is shown
    Given user has any "legacy control;legacy postpay;jeri postpay" account types
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "ServicesV1" page
     When clicks on the "consumption_tab" tab
     Then the "loading" icon is displayed
      And the "ConsumptionV1" page is displayed

  @jira.<jira_id> @<ber> @<execution_mode> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-47637 @live @mobile @next @qa @sanity @vivobr @old_app
  Scenario Outline: A <account_type> user selects Account icon: account screen is displayed with the proper title
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user is in the "Tab Mais" page
     When clicks on the "navigation_tab_bar.account_tab" tab
     Then the "Account" page is displayed
      And the "Meu Plano" header is displayed

    Examples:
          | cv    | account_type  | parent_test_plan | execution_mode | ber | jira_id      |
          | 10.4  | beatrix       | QANOV-21949      | automatic      | ber | QANOV-4411   |
          | 11.12 | multivivo     | QANOV-21949      | automatic      |     | QANOV-4413   |
          | 12.0  | convergente   | QANOV-21791      | automatic      |     | QANOV-4412   |
          | 14.5  | legacy prepay | QANOV-132105     | manual         | ber | QANOV-133839 |
          | 14.5  | jeri prepay   | QANOV-132105     | manual         |     | QANOV-272648 |

  @jira.<jira_id> @android @ios @jira.cv.14.1 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.NOV-63928
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A <account_type> user reloads the Account: account screen is displayed
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When pulls down the page to refresh
     Then the "loading" icon is displayed
      And the "Account" page is displayed

    Examples:
          | account_type  | parent_test_plan | depends_on   | jira_id      |
          | beatrix       | QANOV-21949      | QANOV-4411   | QANOV-295155 |
          | multivivo     | QANOV-21949      | QANOV-4413   | QANOV-295156 |
          | convergente   | QANOV-21791      | QANOV-4412   | QANOV-295157 |
          | legacy prepay | QANOV-132105     | QANOV-133839 | QANOV-295158 |
          | jeri prepay   | QANOV-132105     | QANOV-133839 | QANOV-295160 |

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-4415
  @jira.link.depends_on.QANOV-4416 @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-293817
  @jira.link.relates_to.NOV-889 @mobile @no_automatable @regression @vivobr @old_app
  Scenario Outline: A <account_type> user with data connection reloads the Conta tab: Conta tab is reloaded
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When pulls down the page to refresh
     Then the "BillsV1" page is displayed

    Examples:
          | account_type   | parent_test_plan | jira_id      |
          | legacy control | QANOV-21950      | QANOV-295161 |
          | legacy postpay | QANOV-21950      | QANOV-295162 |
          | jeri postpay   | QANOV-226748     | QANOV-295163 |

  @jira.QANOV-295165 @android @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-4414 @jira.link.depends_on.QANOV-4415
  @jira.link.depends_on.QANOV-4416 @jira.link.parent_test_plan.QANOV-21950 @jira.link.parent_test_plan.QANOV-226748
  @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.NOV-31951 @manual @mobile @no_automatable @regression
  @vivobr @old_app
  Scenario: A legacy user with data connection reload the Services tab: Services screen is reloaded
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has any "legacy control;legacy postpay;jeri postpay" account types
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "ServicesV1" page
     When pulls down the page to refresh
     Then the "ServicesV1" page is displayed
      And the "connectivity_error_title" textfield is not displayed
      And the "connectivity_error_text" textfield is not displayed

  @jira.QANOV-4445 @android @ios @jira.cv.10.0 @jira.link.depends_on.QANOV-4414 @jira.link.depends_on.QANOV-4415
  @jira.link.depends_on.QANOV-4416 @jira.link.parent_test_plan.QANOV-21950 @jira.link.parent_test_plan.QANOV-226748
  @jira.link.relates_to.NOV-94756 @manual @mobile @no_automatable @regression @vivobr @old_app
  Scenario: A legacy user without data connection selects Services tab (Services content is cached): Services content cached will be shown
    Given user has any "legacy control;legacy postpay;jeri postpay" account types
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "ConsumptionV1" page
      And the "ServicesV1" page is cached
      And user turns on the Airplane mode
     When clicks on the "services_tab" tab
     Then the "ServicesV1" page is displayed
      And the "connectivity_error_title" textfield is not displayed
      And the "connectivity_error_text" textfield is not displayed

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.14.1
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.NOV-195394
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A <account_type> user's line changes to "migration" status while the user is logged in the app: a maintenance screen will be shown when the app renews the token in OAM
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "<account_type>" account type in "migration" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And there is a migration window
     When pulls down the page to refresh
     Then the "Account" page is displayed
      And the "migration_window_title" textfield with "Voltamos logo ;)" text is displayed
      And the "migration_window_text" textfield with "Estamos fazendo alguns ajustes e voltamos logo. Que tal tentar de novo daqui a pouquinho?" text is displayed

    Examples:
          | account_type    | parent_test_plan | jira_id      |
          | beatrix postpay | QANOV-21949      | QANOV-295166 |
          | multivivo       | QANOV-21949      | QANOV-295167 |
          | convergente     | QANOV-21791      | QANOV-295168 |
          | legacy prepay   | QANOV-132105     | QANOV-295169 |
          | jeri prepay     | QANOV-132105     | QANOV-295170 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.14.1 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.NOV-195395
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: Once the <account_type> line is no longer on “migration status”, the user can use the app normally
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "<account_type>" account type in "migration" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When the migration finished
      And pulls down the page to refresh
     Then the "Account" page is displayed
      And the "migration_window_title" textfield is not displayed
      And the "migration_window_text" textfield is not displayed

    Examples:
          | account_type | parent_test_plan | depends_on   | jira_id      |
          | beatrix      | QANOV-21949      | QANOV-2616   | QANOV-295171 |
          | multivivo    | QANOV-21949      | QANOV-2618   | QANOV-295172 |
          | convergente  | QANOV-21791      | QANOV-2617   | QANOV-295175 |
          | prepay       | QANOV-132105     | QANOV-133842 | QANOV-295179 |

  @jira.QANOV-360493 @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @smoke @vivobr
  @old_app @har
  Scenario: Account page is autorefreshed
    Given user is in the "Explore" page
     When clicks on the "navigation_tab_bar.account_tab" tab
     Then the "Account" page is autorefreshed
      And the "Account" page is displayed
      And the "Meu Plano" header is displayed
