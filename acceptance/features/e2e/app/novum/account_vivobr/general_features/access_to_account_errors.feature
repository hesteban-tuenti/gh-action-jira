# -*- coding: utf-8 -*-
@jira.QANOV-127154
Feature: Access to account errors


  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-80691 @mobile @regression @vivobr
  Scenario Outline: A <account_type> user accesses to the account tab and an API error occurs: API error screen is displayed
    internal_checkpoint="Note that here API error means that the API faÇade that returns the account information must
    fail. This might be tested by asking that the thirdPartyClients/4p/url points to an invalid URL and waiting some
    minutes, but not for Colombia Home lines. Home lines do not require enough 4p information to get into the 'general
    failure'.
    Carlos Fernandez from account team proposes to configure hystrix circuits between account and NOVUM services to be
    open. We might explore this option"
    Given user has a "<account_type>" account type
      And user has "<plans>" plans
      And user has the matching subscription selected in the account
      And user is in the "Support" page
     When clicks on the "navigation_tab_bar.account_tab" tab
      And there is an API error
     Then the "<page>" page is displayed
      And the "internal_error_title" textfield with "[LANG:account.maintenance.internal_error.internal_error_title]" text is displayed
      And the "internal_error_text" textfield with "[LANG:account.maintenance.internal_error.internal_error_text]" text is displayed

    @no_automatable
    Examples:
          | cv   | account_type   | plans | page      | parent_test_plan | jira_id      |
          | 10.7 | legacy control | 1     | AccountV1 | QANOV-21950      | QANOV-4423   |
          | 10.7 | legacy postpay | 1     | AccountV1 | QANOV-21950      | QANOV-390304 |

    @manual
    Examples:
          | cv    | account_type  | plans | page      | parent_test_plan | jira_id      |
          | 11.12 | beatrix       | any   | Account   | QANOV-21949      | QANOV-59874  |
          | 11.12 | multivivo     | any   | Account   | QANOV-21949      | QANOV-59875  |
          | 12.0  | convergente   | any   | Account   | QANOV-21791      | QANOV-59876  |
          | 14.5  | legacy prepay | any   | Account   | QANOV-132105     | QANOV-133844 |
          | 14.5  | jeri prepay   | any   | Account   | QANOV-132105     | QANOV-272652 |
          | 13.6  | jeri postpay  | 1     | AccountV1 | QANOV-226748     | QANOV-228821 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.14.1 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-293817 @mobile @no_automatable
  @regression @vivobr @old_app
  Scenario Outline: A <account_type> user who is in the screen error after the API returned an error and taps the retry button will see the Account information if the error is solved
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "<account_type>" account type
      And user has "<plans>" plans
      And user has the matching subscription selected in the account
      And user is in the "<page>" page
     When pulls down the page to refresh
      And there is an API error
      And the "internal_error_title" textfield is displayed
      And the API error is solved
      And pulls down the page to refresh
     Then the "<page>" page is displayed
      And the "internal_error_title" textfield is not displayed

    Examples:
          | account_type   | plans | page      | parent_test_plan | depends_on   | jira_id      |
          | legacy control | 1     | AccountV1 | QANOV-21950      | QANOV-4423   | QANOV-295182 |
          | legacy postpay | 1     | AccountV1 | QANOV-21950      | QANOV-4423   | QANOV-390305 |
          | beatrix        | any   | Account   | QANOV-21949      | QANOV-59874  | QANOV-295184 |
          | multivivo      | any   | Account   | QANOV-21949      | QANOV-59875  | QANOV-295186 |
          | convergente    | any   | Account   | QANOV-21791      | QANOV-59876  | QANOV-295187 |
          | legacy prepay  | any   | Account   | QANOV-132105     | QANOV-133844 | QANOV-295188 |
          | jeri prepay    | any   | Account   | QANOV-132105     | QANOV-133844 | QANOV-295189 |
          | jeri postpay   | 1     | AccountV1 | QANOV-226748     | QANOV-4423   | QANOV-295190 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.14.1 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-293817 @mobile @no_automatable
  @regression @vivobr @old_app
  Scenario Outline: A <account_type> user who is in the screen error after the 4P API returned an error and taps the Retry button will remain in the same screen if the error is not solved
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "<account_type>" account type
      And user has "<plans>" plans
      And user has the matching subscription selected in the account
      And user is in the "<page>" page
     When pulls down the page to refresh
      And there is an API error
      And the "internal_error_title" textfield is displayed
      And pulls down the page to refresh
     Then the "<page>" page is displayed
      And the "internal_error_title" textfield is displayed

    Examples:
          | account_type   | plans | page      | parent_test_plan | depends_on   | jira_id      |
          | legacy control | 1     | AccountV1 | QANOV-21950      | QANOV-4423   | QANOV-295191 |
          | legacy postpay | 1     | AccountV1 | QANOV-21950      | QANOV-4423   | QANOV-390306 |
          | beatrix        | any   | Account   | QANOV-21949      | QANOV-59874  | QANOV-295192 |
          | multivivo      | any   | Account   | QANOV-21949      | QANOV-59875  | QANOV-295193 |
          | convergente    | any   | Account   | QANOV-21791      | QANOV-59875  | QANOV-295194 |
          | legacy prepay  | any   | Account   | QANOV-132105     | QANOV-133844 | QANOV-295195 |
          | jeri prepay    | any   | Account   | QANOV-132105     | QANOV-133844 | QANOV-295196 |
          | jeri postpay   | 1     | AccountV1 | QANOV-226748     | QANOV-4423   | QANOV-295197 |

  @jira.<jira_id> @android @impeded_mock @ios @jira.cv.14.1 @jira.link.parent_test_plan.<parent_test_plan> @old_app
  @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.NOV-112058 @mobile @no_automatable @regression @vivobr
  Scenario Outline: A <account_type> user refresh the account tab during a maintenance window: maintenance screen is displayed
    The maintenance window will be displayed if the user perfoms any action that
    reloads the account page.
    If the user was in other tab and switch to the Account tab, if that action reloads the account page,
    the maintenance window will be displayed.
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "<account_type>" account type
      And user has "<plans>" plans
      And user has the matching subscription selected in the account
      And user is in the "<page>" page
      And there is a maintenance window
     When pulls down the page to refresh
     Then the "<page>" page is displayed
      And the "maintenance_window_title" textfield with "[LANG:maintenance_mode.maintenance_window_title]" text is displayed
      And the "maintenance_window_text" textfield with "[LANG:maintenance_mode.maintenance_window_subtitle]" text is displayed

    Examples:
          | account_type   | plans | page      | parent_test_plan | jira_id      |
          | legacy control | 1     | AccountV1 | QANOV-21950      | QANOV-295198 |
          | legacy postpay | 1     | AccountV1 | QANOV-21950      | QANOV-390307 |
          | beatrix        | any   | Account   | QANOV-21949      | QANOV-295199 |
          | multivivo      | any   | Account   | QANOV-21949      | QANOV-295200 |
          | convergente    | any   | Account   | QANOV-21791      | QANOV-295202 |
          | legacy prepay  | any   | Account   | QANOV-132105     | QANOV-295204 |
          | jeri prepay    | any   | Account   | QANOV-132105     | QANOV-295205 |
          | jeri postpay   | 1     | AccountV1 | QANOV-226748     | QANOV-295206 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-80725 @manual @mobile @regression @vivobr
  Scenario Outline: A <account_type> user taps on an specific option in the account tab and an API error occurs: API error screen is displayed
    commented_tags="@depends_on.NOV-47637"
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "view_all_services" link
      And there is an API error
     Then the "Account" page is displayed
      And the "internal_error_title" textfield with "[LANG:account.maintenance.internal_error.internal_error_title]" text is displayed
      And the "internal_error_text" textfield with "[LANG:account.maintenance.internal_error.internal_error_text]" text is displayed

    Examples:
          | cv    | account_type  | parent_test_plan | jira_id      |
          | 10.7  | beatrix       | QANOV-21949      | QANOV-4427   |
          | 12.0  | convergente   | QANOV-21791      | QANOV-4428   |
          | 11.12 | multivivo     | QANOV-21949      | QANOV-4429   |
          | 14.5  | legacy prepay | QANOV-132105     | QANOV-133848 |
          | 14.5  | jeri prepay   | QANOV-132105     | QANOV-272656 |

  @jira.QANOV-4430 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.7 @old_app
  @jira.link.parent_test_plan.QANOV-21950 @jira.link.parent_test_plan.QANOV-226748 @jira.link.relates_to.NOV-80725 @mobile
  @no_automatable @regression @vivobr
  Scenario: User taps on an specific option in the account tab and an API error occurs: API error screen is displayed
    commented_tags="@depends_on.NOV-30"
    Given user has any "legacy control;legacy postpay;jeri postpay" account types
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "AccountV1" page
     When clicks on the "services_tab" tab
      And clicks on the "plan_details" entrypoint
      And there is an API error
     Then the "ConsumptionV1" page is displayed
      And the "internal_error_title" textfield with "[LANG:account.maintenance.internal_error.internal_error_title]" text is displayed
      And the "internal_error_text" textfield with "[LANG:account.maintenance.internal_error.internal_error_text]" text is displayed

  @jira.<jira_id> @<impeded> @android @automation.hard @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-186312 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A <account_type> logged user without data connection opens the app and goes to the account tab: error message will be shown
    Given user has a "<account_type>" account type
      And user has "<plans>" plans
      And user has the matching subscription selected in the account
      And user terminates the app
      And the "<page>" page is not cached
      And user turns on the Airplane mode
     When launches the app
      And clicks on the "navigation_tab_bar.account_tab" tab
     Then the "<page>" page is displayed
      And the "connectivity_error_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "connectivity_error_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "connectivity_error_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | cv    | account_type   | plans | page      | parent_test_plan | impeded      | jira_id      |
          | 9.7   | legacy control | 1     | AccountV1 | QANOV-21950      |              | QANOV-4431   |
          | 9.7   | legacy postpay | 1     | AccountV1 | QANOV-21950      |              | QANOV-390308 |
          | 11.12 | beatrix        | any   | Account   | QANOV-21949      |              | QANOV-59886  |
          | 11.12 | multivivo      | any   | Account   | QANOV-21949      |              | QANOV-59887  |
          | 12.0  | convergente    | any   | Account   | QANOV-21791      | impeded_mock | QANOV-59888  |
          | 14.5  | legacy prepay  | any   | Account   | QANOV-132105     |              | QANOV-133849 |
          | 14.5  | jeri prepay    | any   | Account   | QANOV-132105     |              | QANOV-272657 |
          | 13.6  | jeri postpay   | 1     | AccountV1 | QANOV-226748     |              | QANOV-228825 |

  @jira.<jira_id> @<impeded> @android @automation.hard @ios @jira.cv.14.1 @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.NOV-92145 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A <account_type> user without data connection reloads the account: an error message is displayed
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "<account_type>" account type
      And user has "<plans>" plans
      And user has the matching subscription selected in the account
      And user is in the "<page>" page
      And the "<page>" page is not cached
      And user turns on the Airplane mode
     When pulls down the page to refresh
     Then the "<page>" page is displayed
      And the "connectivity_error_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "connectivity_error_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "connectivity_error_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | account_type   | plans | page      | parent_test_plan | impeded      | jira_id      |
          | legacy control | 1     | AccountV1 | QANOV-21950      |              | QANOV-295207 |
          | legacy postpay | 1     | AccountV1 | QANOV-21950      |              | QANOV-390309 |
          | beatrix        | any   | Account   | QANOV-21949      |              | QANOV-295208 |
          | multivivo      | any   | Account   | QANOV-21949      |              | QANOV-295209 |
          | convergente    | any   | Account   | QANOV-21791      | impeded_mock | QANOV-295210 |
          | legacy prepay  | any   | Account   | QANOV-132105     |              | QANOV-295211 |
          | jeri prepay    | any   | Account   | QANOV-132105     |              | QANOV-295212 |
          | jeri postpay   | 1     | AccountV1 | QANOV-226748     |              | QANOV-295213 |

  @jira.QANOV-4433 @android @automation.pending_mock @impeded_mock @ios @jira.cv.9.7 @jira.link.depends_on.QANOV-4414
  @jira.link.depends_on.QANOV-4415 @jira.link.depends_on.QANOV-4416 @jira.link.parent_test_plan.QANOV-21950 @old_app
  @jira.link.parent_test_plan.QANOV-226748 @jira.link.relates_to.NOV-80693 @mobile @no_automatable @regression @vivobr
  Scenario: A user moves from an account tab to another account tab and an API error occurs: API error screen will be shown
    Given user has any "legacy control;legacy postpay;jeri postpay" account types
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "AccountV1" page
     When clicks on the "services_tab" tab
      And there is an API error
     Then the "ServicesV1" page is displayed
      And the "internal_api_error_title" textfield with "[LANG:account.maintenance.internal_error.internal_error_title]" text is displayed
      And the "internal_api_error_text" textfield with "[LANG:account.maintenance.internal_error.internal_error_text]" text is displayed

  @jira.QANOV-4434 @android @ios @jira.cv.9.7 @jira.link.depends_on.QANOV-4414 @jira.link.depends_on.QANOV-4415
  @jira.link.depends_on.QANOV-4416 @jira.link.parent_test_plan.QANOV-21950 @jira.link.parent_test_plan.QANOV-226748
  @jira.link.relates_to.NOV-772 @manual @mobile @regression @vivobr @old_app
  Scenario: A user without data connection selects Consumption tab from another tab in the account section: an error message is displayed
    Given user has any "legacy control;legacy postpay;jeri postpay" account types
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "ServicesV1" page
      And user turns on the Airplane mode
     When clicks on the "consumption_tab" tab
     Then the "ConsumptionV1" page is displayed
      And the "connectivity_error_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "connectivity_error_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.<cv> @jira.link.depends_on.QANOV-4415 @old_app
  @jira.link.depends_on.QANOV-4416 @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-885 @mobile
  @no_automatable @regression @vivobr
  Scenario Outline: A <account_type> user without data connection selects Conta tab: an error message is displayed
    internal_checkpoint="Content could be cached"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "ConsumptionV1" page
      And user turns on the Airplane mode
     When clicks on the "bills_tab" tab
     Then the "BillsV1" page is displayed
      And the "connectivity_error_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "connectivity_error_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed

    Examples:
          | account_type   | parent_test_plan | cv   | jira_id      |
          | legacy control | QANOV-21950      | 9.7  | QANOV-4435   |
          | legacy postpay | QANOV-21950      | 9.7  | QANOV-4436   |
          | jeri postpay   | QANOV-226748     | 13.6 | QANOV-228827 |

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-4415
  @jira.link.depends_on.QANOV-4416 @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-888 @mobile
  @no_automatable @regression @vivobr @old_app
  Scenario Outline: A <account_type> user without data connection reload the Conta tab: an error message is shown
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
      And user turns on the Airplane mode
     When pulls down the page to refresh
     Then the "BillsV1" page is displayed
      And the "connectivity_error_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "connectivity_error_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed

    Examples:
          | account_type   | parent_test_plan | jira_id      |
          | legacy control | QANOV-21950      | QANOV-295216 |
          | legacy postpay | QANOV-21950      | QANOV-295217 |
          | jeri postpay   | QANOV-226748     | QANOV-295218 |

  @jira.QANOV-4444 @android @ios @jira.cv.9.7 @jira.link.depends_on.QANOV-4414 @jira.link.depends_on.QANOV-4415
  @jira.link.depends_on.QANOV-4416 @jira.link.parent_test_plan.QANOV-21950 @jira.link.parent_test_plan.QANOV-226748
  @jira.link.relates_to.NOV-104 @mobile @no_automatable @regression @vivobr @old_app
  Scenario: A user without data connection selects Services tab (Services content is not cached): an error will be shown
    This scenario can be simulated by disabling the connectivity very quickly just after the user
    logged in the app and before the account screen is loaded)
    Given user has any "legacy control;legacy postpay;jeri postpay" account types
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "ConsumptionV1" page
      And the "ServicesV1" page is not cached
      And user turns on the Airplane mode
     When clicks on the "services_tab" tab
     Then the "ServicesV1" page is displayed
      And the "connectivity_error_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "connectivity_error_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed

  @jira.QANOV-295220 @android @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-4414 @jira.link.depends_on.QANOV-4415
  @jira.link.depends_on.QANOV-4416 @jira.link.parent_test_plan.QANOV-21950 @jira.link.parent_test_plan.QANOV-226748
  @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.NOV-91763 @manual @mobile @regression @vivobr @old_app
  Scenario: A user without data connection reload the Services tab: an error message is shown
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has any "legacy control;legacy postpay;jeri postpay" account types
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "ServicesV1" page
      And user turns on the Airplane mode
     When pulls down the page to refresh
     Then the "ServicesV1" page is displayed
      And the "connectivity_error_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "connectivity_error_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
