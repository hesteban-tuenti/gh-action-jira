# -*- coding: utf-8 -*-
@jira.QANOV-126373
Feature: Access to Profile Entrypoints First Level

  Actions Before the Feature:
    Given user is in the "Profile" page

  @jira.QANOV-6147 @android @automatic @ber @cert0 @cert1 @har @ios @jira.cv.10.3 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-47204 @live @mobile @next @o2uk @sanity
  Scenario: O2uk postpay user with data connection selects Profile icon: Profile screen is opened with all options enabled
    other_affected_versions="2021-15"
    Given user has a "postpay" account type
     Then the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.QANOV-6148 @android @automatic @ber @cert0 @cert1 @har @ios @jira.cv.10.3 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-47204 @live @mobile @next @o2uk @smoke
  Scenario: O2uk legacy prepay user with data connection selects Profile icon: Profile screen is opened with all options enabled
    other_affected_versions="2021-15"
    Given user has a "legacy prepay" account type
     Then the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.QANOV-37524 @android @automatic @ber @cert0 @cert1 @har @ios @jira.cv.12.0
  @jira.link.parent_test_plan.QANOV-178803 @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.parent_test_plan.QANOV-35253 @jira.link.parent_test_plan.QANOV-77438 @live @mobile @next @o2uk @smoke
  Scenario: O2uk device user without mobile lines and with data connection selects Profile icon: Profile screen is opened with all options enabled
    internal_checkpoint="User in CERT0: luchad86@yahoo.com"
    other_affected_versions="2021-07, 2021-15, 2022-23"
    Given user has a "device" account type
      And user has "0" mobile lines
     Then the "my_information_textfield" textfield with "[LANG:profile.dashboard.my_information.title]" text is displayed
      And the "my_information_list" list with "[LANG:profile.dashboard.my_information.contact_preferences]" entrypoints is displayed
      And the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.QANOV-76133 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-178803
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-24947 @jira.link.parent_test_plan.QANOV-35253
  @jira.link.parent_test_plan.QANOV-77438 @live @mobile @next @o2uk @regression @har
  Scenario: O2uk device user with mobile lines and data connection selects Profile icon: Profile screen is opened with all options enabled
    internal_checkpoint="User in CERT0: sggshfgs@gmail.com"
    other_affected_versions="2021-15, 2022-23"
    Given user has a "device" account type
      And user has "any" mobile lines
     Then the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.<jira_id> @<ber> @android @impeded_legacy @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-215691 @jira.link.parent_test_plan.QANOV-437387 @jira.link.relates_to.NOV-47204
  @mobile @regression @vivobr
  Scenario Outline: Monoplan <account_type> Vivobr user with data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "<account_type>" account type
      And user has "1" plans
     Then the "settings_list" list with "<settings_list>" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    @automatic @jira.link.detects.VIVO-3272 @qa
    Examples:
          | account_type | settings_list                                                                                                             | ber | cv   | parent_test_plan | jira_id      |
          | jeri postpay | [LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | ber | 13.6 | QANOV-226748     | QANOV-236431 |

    @automatic
    Examples:
          | account_type   | settings_list                                                                                                             | ber | cv   | parent_test_plan | jira_id      |
          | legacy postpay | [LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] |     | 10.3 | QANOV-24947      | QANOV-236430 |
          | legacy control | [LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] |     | 10.3 | QANOV-24947      | QANOV-236432 |

    @manual @old_app
    Examples:
          | account_type   | settings_list                                                                                                                                                           | ber | cv     | parent_test_plan | jira_id      |
          | legacy postpay | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] |     | Future | QANOV-24947      | QANOV-236433 |
          | jeri postpay   | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] |     | Future | QANOV-226748     | QANOV-236434 |
          | legacy control | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] |     | Future | QANOV-24947      | QANOV-236435 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-437387 @jira.link.relates_to.NOV-47204 @mobile @smoke @vivobr
  Scenario Outline: Monoplan Vivobr <account_type> user with data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "<account_type>" account type
      And user has "1" plans
     Then the "settings_list" list with "[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    @manual
    Examples:
          | account_type  | ber | parent_test_plan | cv   | jira_id      |
          | legacy prepay | ber | QANOV-24947      | 10.3 | QANOV-6151   |
          | jeri          |     | QANOV-200803     | 13.5 | QANOV-204106 |
          | control_n     |     | QANOV-200803     | 13.5 | QANOV-204107 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-437387 @jira.link.relates_to.NOV-47204 @manual @mobile @smoke @vivobr @old_app
  Scenario Outline: Monoplan Vivobr <account_type> user with data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "<account_type>" account type
      And user has "1" plans
     Then the "settings_list" list with "[LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    Examples:
          | account_type  | ber | parent_test_plan | cv     | jira_id      |
          | legacy prepay | ber | QANOV-228584     | Future | QANOV-228585 |
          | jeri          |     | QANOV-228584     | Future | QANOV-228586 |
          | control_n     |     | QANOV-228584     | Future | QANOV-228587 |

  @jira.<jira_id> @<automated> @<ber> @<priority> @android @ios @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-24947
  @jira.link.parent_test_plan.QANOV-437387 @jira.link.relates_to.NOV-47204 @live @mobile @next @vivobr @<har>
  Scenario Outline: Vivobr <account_type> user logged with data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "<account_type>" account type
      And user has a "any" plan in "active" status
      And user has a "<role>" role
     Then the "settings_list" list with "<settings_list>" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed
      And scrolls up

    Examples:
          | account_type | settings_list                                                                                                                                                                      | role      | ber | har | cv    | detects | parent_test_plan          | automated | priority | jira_id      |
          | beatrix      | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | admin     | ber |     | 13.10 |         | QANOV-132965              | manual    | smoke    | QANOV-129639 |
          | multivivo    | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | admin     |     | har | 13.10 |         | QANOV-132965              | manual    | smoke    | QANOV-129641 |
          | multivivo    | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | dependent |     |     | 13.10 |         | QANOV-132965:QANOV-228584 | manual    | smoke    | QANOV-129643 |

    @old_app
    Examples:
          | account_type | settings_list                                                                                                                                                                                                                    | role      | ber | har | cv     | detects | parent_test_plan | automated | priority | jira_id      |
          | beatrix      | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | admin     |     |     | Future |         | QANOV-215691     | manual    | smoke    | QANOV-223417 |
          | multivivo    | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | admin     |     |     | Future |         | QANOV-215691     | manual    | smoke    | QANOV-223419 |
          | multivivo    | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | dependent |     |     | Future |         | QANOV-215691     | manual    | smoke    | QANOV-223421 |

  @jira.<jira_id> @<automated> @<ber> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-437387 @live @mobile @next @smoke @vivobr
  Scenario Outline: Vivobr <account_type> user and logged with data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "<account_type>" account type
      And user has a "beatrix" mobile line
      And user has "several" plans
     Then the "settings_list" list with "<settings_list>" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    Examples:
          | account_type  | settings_list                                                                                                                                                                      | ber | cv   | parent_test_plan | automated | jira_id      |
          | legacy prepay | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | ber | 12.0 |                  | automatic | QANOV-204108 |
          | jeri          | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] |     | 13.5 | QANOV-200803     | manual    | QANOV-204109 |
          | control_n     | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] |     | 13.5 | QANOV-200803     | manual    | QANOV-204110 |

    @old_app
    Examples:
          | account_type  | settings_list                                                                                                                                                                                                                    | ber | cv     | parent_test_plan | automated | jira_id      |
          | legacy prepay | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] |     | Future | QANOV-215691     | manual    | QANOV-223423 |
          | jeri          | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] |     | Future | QANOV-215691     | manual    | QANOV-223424 |
          | control_n     | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] |     | Future | QANOV-215691     | manual    | QANOV-223425 |

  @jira.<jira_id> @<har> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-437387 @jira.link.relates_to.NOV-47204 @mobile @smoke @vivobr
  Scenario Outline: Vivo Convergente users with beatrix mobile lines and logged in <account_status> status with data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "convergente" account type
      And user has a "full convergente" plan in "<account_status>" status
      And user has a "beatrix" mobile line
     Then the "settings_list" list with "<settings_list>" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    @impeded_mock @manual
    Examples:
          | account_status | settings_list                                                                                                                                                                      | har | cv    | parent_test_plan | jira_id      |
          | active         | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | har | 13.10 | QANOV-132965     | QANOV-129645 |
          | pending        | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.configuration.security_and_privacy]                                                               |     | 12.4  | QANOV-56585      | QANOV-56948  |

    @impeded_mock @manual @old_app
    Examples:
          | account_status | settings_list                                                                                                                                                                                                                    | har | cv     | parent_test_plan | jira_id      |
          | active         | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] |     | Future | QANOV-215691     | QANOV-223426 |
          | pending        | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.configuration.security_and_privacy]                                                               |     | Future | QANOV-215691     | QANOV-223428 |

  @jira.<jira_id> @<impeded> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr
  Scenario Outline: Monoplan Vivo Soft Convergente in <account_status> status users with data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "convergente" account type
      And user has "1" plans
      And user has a "soft convergente" plan in "<account_status>" status
     Then the "settings_list" list with "<settings_list>" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    Examples:
          | account_status | settings_list                                                                                                             | cv    | parent_test_plan | impeded      | jira_id      |
          | active         | [LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | 13.10 | QANOV-132965     |              | QANOV-134871 |
          | pending        | [LANG:profile.dashboard.configuration.security_and_privacy]                                                               | 12.4  | QANOV-56585      | impeded_mock | QANOV-56949  |

    @old_app
    Examples:
          | account_status | settings_list                                                                                                                                                           | cv     | parent_test_plan | impeded | jira_id      |
          | active         | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | Future | QANOV-215691     |         | QANOV-223430 |
          | pending        | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.configuration.security_and_privacy]                                                               | Future | QANOV-215691     |         | QANOV-223431 |

  @jira.<jira_id> @<impeded> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @smoke @vivobr
  Scenario Outline: Multiplan Convergente user logged without mobile lines and with plan in <account_status> status and with data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "convergente" account type
      And user has "several" plans
      And user has a "soft convergente" plan in "<account_status>" status
      And user does not have a "beatrix" mobile line
     Then the "settings_list" list with "<settings_list>" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    Examples:
          | account_status | settings_list                                                                                                             | cv    | parent_test_plan | impeded      | jira_id      |
          | active         | [LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | 13.10 | QANOV-132965     |              | QANOV-194417 |
          | pending        | [LANG:profile.dashboard.configuration.security_and_privacy]                                                               | 12.4  | QANOV-56585      | impeded_mock | QANOV-60023  |

    @old_app
    Examples:
          | account_status | settings_list                                                                                                                                                           | cv     | parent_test_plan | impeded | jira_id      |
          | active         | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | Future | QANOV-215691     |         | QANOV-223432 |
          | pending        | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.configuration.security_and_privacy]                                                               | Future | QANOV-215691     |         | QANOV-223433 |


  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr
  Scenario Outline: Monoplan Vivo siebel users with data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "convergente" account type
      And user has "1" plans
      And user has a "siebel" plan
     Then the "settings_list" list with "<settings_list>" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    Examples:
          | settings_list                                                                                                                                                                      | cv   | parent_test_plan | jira_id      |
          | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | 24.3 | QANOV-360171     | QANOV-360361 |

    @old_app
    Examples:
          | settings_list                                                                                                                                                                                                                    | cv     | parent_test_plan | jira_id      |
          | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | Future | QANOV-215691     | QANOV-360362 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @smoke @vivobr
  Scenario Outline: Multiplan Convergente siebel user logged without mobile lines and with data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "convergente" account type
      And user has "several" plans
      And user has a "siebel" plan
      And user does not have a "beatrix" mobile line
     Then the "settings_list" list with "<settings_list>" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    Examples:
          | settings_list                                                                                                                                                                      | cv   | parent_test_plan | jira_id      |
          | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | 24.3 | QANOV-360171     | QANOV-360363 |

    @old_app
    Examples:
          | settings_list                                                                                                                                                                                                                    | cv     | parent_test_plan | jira_id      |
          | [LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy] | Future | QANOV-215691     | QANOV-360364 |

  @jira.QANOV-194418 @android @automatic @ber @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-132965
  @jira.link.parent_test_plan.QANOV-437387 @live @mobile @next @regression @vivobr
  Scenario: Multiplan Vivo Soft Convergente users with beatrix plan associated logged with data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "convergente" account type
      And user has "several" plans
      And user has a "soft convergente" plan in "active" status
      And user has a "beatrix" mobile line
     Then the "settings_list" list with "[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed
      And scrolls up

  @jira.QANOV-449450 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-355372
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr
  Scenario: Monoplan with beatrix mobile line in pre active status users logged with data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "beatrix" mobile line in "pre active" status
      And user has "1" plans
     Then the "settings_list" list with "[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed
      And scrolls up

  @jira.QANOV-223434 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-215691
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr
  Scenario: Multiplan Vivo Soft Convergente users with beatrix plan associated logged with data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "convergente" account type
      And user has "several" plans
      And user has a "soft convergente" plan in "active" status
      And user has a "beatrix" mobile line
     Then the "settings_list" list with "[LANG:profile.dashboard.my_information.token];[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr
  Scenario Outline: <account_type> cancelled users logged with data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "<account_type>" account type
      And user has all plans in "cancelled" status
     Then the "settings_list" list with "[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    Examples:
          | account_type | jira_id      |
          | convergente  | QANOV-403116 |
          | beatrix      | QANOV-403117 |
          | multivivo    | QANOV-403118 |


  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.14.4 @jira.link.detects.<detects> @live @mobile @next
  @sanity @har
  Scenario Outline: A <product> prepay user selects Profile icon: Profile screen is opened with all options enabled
    Given the app version is "equal_or_higher" than "14.4"
      And user has a "prepay" account type
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And clicks on the "avatar_tooltip.close_button" element if visible
     Then the "my_information_textfield" textfield with "[LANG:profile.dashboard.my_information.title]" text is displayed
      And the "my_information_list" list with "[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.payment_settings]" entrypoints is displayed
      And the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy];[LANG:profile.dashboard.configuration.cookies]" entrypoints is displayed
      And the "support_list" list with "[LANG:profile.dashboard.support.legal_documents];[LANG:profile.dashboard.support.cancel_contract];[LANG:profile.dashboard.support.data_protection];[LANG:profile.dashboard.support.imprint]" entrypoints is displayed
      And the "rate_us_entrypoint" entrypoint with "[LANG:profile.dashboard.rate_us]" text is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    @raitt_drop1
    Examples:
          | product | detects                                                       | jira_id      |
          | blaude  | O2DE-1445:O2DE-1795:OBO2DE-110:OBO2DE-113:OBO2DE-125:LOC-1031 | QANOV-386057 |

    Examples:
          | product | detects             | jira_id      |
          | o2de    | O2DE-1445:O2DE-1795 | QANOV-386058 |

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.14.4 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @live @mobile @next @sanity @har
  Scenario Outline: A <product> postpay user with mobile or internet@home product selects Profile icon: Profile screen is opened with all options enabled
    Given the app version is "equal_or_higher" than "14.4"
      And user has a "postpay" account type
      And user has any "<user_products>" product in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And clicks on the "avatar_tooltip.close_button" element if visible
     Then the "my_information_textfield" textfield with "[LANG:profile.dashboard.my_information.title]" text is displayed
      And the "my_information_list" list with "[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.payment_settings];[LANG:profile.dashboard.my_information.my_contracts];[LANG:profile.dashboard.my_information.my_orders]" entrypoints is displayed
      And the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy];[LANG:profile.dashboard.configuration.cookies]" entrypoints is displayed
      And the "support_list" list with "[LANG:profile.dashboard.support.legal_documents];[LANG:profile.dashboard.support.data_protection];[LANG:profile.dashboard.support.imprint]" entrypoints is displayed
      And the "rate_us_entrypoint" entrypoint with "[LANG:profile.dashboard.rate_us]" text is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    @raitt_drop1
    Examples:
          | product | user_products | detects                                   | parent_test_plan | jira_id      |
          | blaude  | mobile_line   | O2DE-1445:O2DE-1795:OBO2DE-110:OBO2DE-125 |                  | QANOV-386059 |

    Examples:
          | product | user_products                | detects             | parent_test_plan | jira_id      |
          | o2de    | mobile_line;internet_at_home | O2DE-1445:O2DE-1795 | QANOV-437471     | QANOV-386060 |

  @jira.QANOV-386061 @android @automatic @ber @blaude @cert3 @ios @jira.cv.14.4 @jira.link.detects.O2DE-110
  @jira.link.detects.O2DE-1445 @jira.link.detects.O2DE-1795 @jira.link.detects.O2DE-1826 @live @mobile @next @raitt_drop1
  @sanity @har
  Scenario: A blaude user with only MyHandy product/s selects Profile icon: Profile screen is opened with all options enabled
    Given the app version is "equal_or_higher" than "14.4"
      And user has a "my_handy" product in "active" status
      And user does not have "mobile_line" product
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And clicks on the "avatar_tooltip.close_button" element if visible
     Then the "my_information_textfield" textfield with "[LANG:profile.dashboard.my_information.title]" text is displayed
      And the "my_information_list" list with "[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.payment_settings];[LANG:profile.dashboard.my_information.my_orders]" entrypoints is displayed
      And the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy];[LANG:profile.dashboard.configuration.cookies]" entrypoints is displayed
      And the "support_list" list with "[LANG:profile.dashboard.support.legal_documents];[LANG:profile.dashboard.support.data_protection];[LANG:profile.dashboard.support.imprint]" entrypoints is displayed
      And the "rate_us_entrypoint" entrypoint with "[LANG:profile.dashboard.rate_us]" text is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.QANOV-386062 @android @ber @ios @jira.cv.14.4 @jira.link.detects.O2DE-1445 @jira.link.detects.O2DE-1795
  @jira.link.detects.O2DE-1826 @manual @mobile @o2de @sanity @har
  Scenario: A o2de user with only MyHandy product/s selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "my_handy" product in "active" status
      And user does not have "internet_at_home" product
      And user does not have "mobile_line" product
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
     Then the "my_information_textfield" textfield with "[LANG:profile.dashboard.my_information.title]" text is displayed
      And the "my_information_list" list with "[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.payment_settings];[LANG:profile.dashboard.my_information.my_orders]" entrypoints is displayed
      And the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy];[LANG:profile.dashboard.configuration.cookies]" entrypoints is displayed
      And the "support_list" list with "[LANG:profile.dashboard.support.legal_documents];[LANG:profile.dashboard.support.data_protection];[LANG:profile.dashboard.support.imprint]" entrypoints is displayed
      And the "rate_us_entrypoint" entrypoint with "[LANG:profile.dashboard.rate_us]" text is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.4 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: A <product> postpay user with mobile or internet@home products all in "cancelled" status selects Profile icon: Profile screen is opened with all options enabled
    Given the app version is "equal_or_higher" than "14.4"
      And user has a "postpay" account type
      And user has any "<user_products>" product
      And user has all products in "cancelled" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
     Then the "my_information_textfield" textfield with "[LANG:profile.dashboard.my_information.title]" text is displayed
      And the "my_information_list" list with "[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.payment_settings];[LANG:profile.dashboard.my_information.my_orders]" entrypoints is displayed
      And the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy];[LANG:profile.dashboard.configuration.cookies]" entrypoints is displayed
      And the "support_list" list with "[LANG:profile.dashboard.support.legal_documents];[LANG:profile.dashboard.support.data_protection];[LANG:profile.dashboard.support.imprint]" entrypoints is displayed
      And the "rate_us_entrypoint" entrypoint with "[LANG:profile.dashboard.rate_us]" text is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    Examples:
          | product | user_products                | detects    | parent_test_plan          | jira_id      |
          | blaude  | mobile_line                  | OBO2DE-721 | QANOV-306250              | QANOV-386063 |
          | o2de    | mobile_line;internet_at_home |            | QANOV-306250:QANOV-437471 | QANOV-386064 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.4 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @regression
  Scenario Outline: A <product> user with bank account in "activated" status and only MyHandy product/s in "cancelled" status selects Profile icon: Profile screen is opened with all options enabled
    Given the app version is "equal_or_higher" than "14.4"
      And user has a "my_handy" product
      And user has not a "internet_at_home" product
      And user has not a "mobile_line" product
      And user has all products in "cancelled" status
      And user has "bank_account" service in "activated" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
     Then the "my_information_textfield" textfield with "[LANG:profile.dashboard.my_information.title]" text is displayed
      And the "my_information_list" list with "[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.payment_settings];[LANG:profile.dashboard.my_information.my_orders]" entrypoints is displayed
      And the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy];[LANG:profile.dashboard.configuration.cookies]" entrypoints is displayed
      And the "support_list" list with "[LANG:profile.dashboard.support.legal_documents];[LANG:profile.dashboard.support.data_protection];[LANG:profile.dashboard.support.imprint]" entrypoints is displayed
      And the "rate_us_entrypoint" entrypoint with "[LANG:profile.dashboard.rate_us]" text is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-386065 |
          | o2de    | QANOV-386067 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.4 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @regression
  Scenario Outline: A <product> user without bank account and only MyHandy product/s in "cancelled" status selects Profile icon: Profile screen is opened with all options enabled
    Given the app version is "equal_or_higher" than "14.4"
      And user has a "my_handy" product
      And user has not a "internet_at_home" product
      And user has not a "mobile_line" product
      And user has all products in "cancelled" status
      And user does not have bank account
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
     Then the "my_information_textfield" textfield with "[LANG:profile.dashboard.my_information.title]" text is displayed
      And the "my_information_list" list with "[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.my_orders]" entrypoints is displayed
      And the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy];[LANG:profile.dashboard.configuration.cookies]" entrypoints is displayed
      And the "support_list" list with "[LANG:profile.dashboard.support.legal_documents];[LANG:profile.dashboard.support.data_protection];[LANG:profile.dashboard.support.imprint]" entrypoints is displayed
      And the "rate_us_entrypoint" entrypoint with "[LANG:profile.dashboard.rate_us]" text is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-386066 |
          | o2de    | QANOV-386068 |

  @jira.QANOV-410667 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: O2es user selects Profile icon: Profile screen is opened with all options enabled
     Then the "settings" list with "[LANG:profile.dashboard.configuration.notifications][LANG:profile.dashboard.personal_data.entrypoint];[LANG:profile.dashboard.my_orders];[LANG:profile.dashboard.biometric_access];[LANG:profile.dashboard.my_information.change_password.entrypoint];[LANG:profile.dashboard.rate_us]" textfields is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.QANOV-453414 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression
  @vivobr
  Scenario: Vivo user can see the logout entrypoint in red color
     Then the "log_out_button" entrypoint is displayed in "red" color

  @jira.QANOV-556365 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @sanity
  Scenario: Moves admin user can see all the entrypoints for the Profile tab
    The personal data entrypoint list can also include Mis tokens entrypoint if user has a landline product
    Verificación avanzada entrypoint is not ready yet
    Given user has a "admin" role
     Then the "store_qr_link" link with "Generar QR tienda" text is displayed
      And the "store_qr_icon" icon is displayed
      And the "personal_data_title" textfield with "DATOS PERSONALES" text is displayed
      And the "personal_data_list" list with "Email de contacto;Teléfono de contacto;Método de pago" entrypoints is displayed
      And the "access_title" textfield with "ACCESO" text is displayed
      And the "access_list" list with "Medio de recuperación de contraseña;PIN/Acceso biométrico;Verificación avanzada;Cambio usuario Movistar Plus+" entrypoints is displayed
      And the "privacy_title" textfield with "PRIVACIDAD" text is displayed
      And the "support_list" list with "Gestión de tu privacidad;Términos y condiciones de la app" entrypoints is displayed
      And the "log_out_link" link with "[LANG:profile.dashboard.log_out]" text is displayed
      And the "log_out_icon" icon is displayed

  @jira.QANOV-556366 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @sanity
  Scenario: Moves admin light user can see all the entrypoints for the Profile tab
    Given user has a "admin light" role
     Then the "store_qr_link" link is not displayed
      And the "access_title" textfield with "ACCESO" text is displayed
      And the "access_list" list with "PIN/Acceso biométrico" entrypoints is displayed
      And the "privacy_title" textfield with "PRIVACIDAD" text is displayed
      And the "support_list" list with "Gestión de tu privacidad;Términos y condiciones de la app" entrypoints is displayed
      And the "log_out_link" link with "[LANG:profile.dashboard.log_out]" text is displayed
      And the "log_out_icon" icon is displayed

  @jira.QANOV-578747 @android @ber @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @smoke
  Scenario: Moves admin user with a contact email can see it in the contact mail entrypoint
    Given user has a "admin" role
      And user has the "email" contact method set in the application
     Then the "contact_email_entrypoint" entrypoint is displayed
      And the "contact_email_current" textfield with "[CONTEXT:contact_method_email]" text is displayed

  @jira.QANOV-578748 @android @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: Moves admin user without a contact email can see the contact mail entrypoint without an email
    Given user has a "admin" role
      And user has not the "email" contact method set in the application
     Then the "contact_email_entrypoint" entrypoint is displayed
      And the "contact_email_current" textfield is not displayed

  @jira.QANOV-578749 @android @ber @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @smoke
  Scenario: Moves admin user with a contact phone can see it in the contact phone entrypoint
    Given user has a "admin" role
      And user has the "phone" contact method set in the application
     Then the "contact_phone_entrypoint" entrypoint is displayed
      And the "contact_phone_current" textfield with "[CONTEXT:contact_method_phone]" text is displayed

  @jira.QANOV-578750 @android @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: Moves admin user without a contact phone can see the contact phone entrypoint without an email
    Given user has a "admin" role
      And user has not the "phone" contact method set in the application
     Then the "contact_phone_entrypoint" entrypoint is displayed
      And the "contact_phone_current" textfield is not displayed

  @jira.QANOV-578751 @android @ber @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @smoke
  Scenario: Moves admin can see the payments method entrypoint
    Given user has a "admin" role
     Then the "payment_method_entrypoint" entrypoint is displayed
      And the "payment_method_entrypoint.title" textfield with "Tarjeta y Cuenta bancaria" text is displayed

  @jira.QANOV-578752 @android @ber @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @smoke
  Scenario: Moves admin with landline product can see the tokens entrypoint
    Given user has a "admin" role
      And user has a "landline" product
     Then the "tokens_entrypoint" entrypoint with "Mis tokens" text is displayed
      And the "tokens_description" textfield with "Consigue tokens y gana recompensas" text is displayed

  @jira.QANOV-578753 @android @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: Moves admin without landline product can not see the tokens entrypoint
    Given user has a "admin" role
      And user has not a "landline" product
     Then the "tokens_entrypoint" entrypoint is not displayed

  @jira.QANOV-578754 @android @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @smoke
  Scenario: Moves admin with tv product and a Movistar+ email can see the Movistar Plus entrypoint
    Given user has a "admin" role
      And user has a "tv" product
      And user has an email to access Movistar+
     Then the "movistar_plus_entrypoint" entrypoint with "Cambio usuario Movistar Plus+" text is displayed
      And the "movistar_plus_email" textfield is displayed

  @jira.QANOV-578755 @android @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: Moves admin with satelite tv product can see the Movistar Plus entrypoint
    Given user has a "admin" role
      And user has a "satelite tv" product
     Then the "movistar_plus_entrypoint" entrypoint with "Cambio usuario Movistar Plus+" text is displayed
      And the "movistar_plus_email" textfield is not displayed

  @jira.QANOV-578756 @android @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: Moves admin with ott product can not see the Movistar Plus entrypoint
    Given user has a "admin" role
      And user has a "ott" product
     Then the "movistar_plus_entrypoint" entrypoint is not displayed

  @jira.QANOV-578757 @android @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: Moves admin with >1 tv product can see the Movistar Plus entrypoint
    Given user has a "admin" role
      And user has ">1" products of "tv" type
     Then the "movistar_plus_entrypoint" entrypoint with "Cambio usuario Movistar Plus+" text is displayed
      And the "movistar_plus_email" textfield is not displayed

  @jira.QANOV-578758 @android @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @smoke
  Scenario: Moves user with PIN enabled can see the pin/biometric entrypoint entrypoint
    Given user has "PIN" feature "enabled" in the application
     Then the "pin_biometric_entrypoint" entrypoint with "PIN / Acceso biométrico" text is displayed
      And the "pin_biometric_status" textfield with "Activado" text is displayed

  @jira.QANOV-578759 @android @ber @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @smoke
  Scenario: Moves user with PIN disabled can see the pin/biometric entrypoint entrypoint
    Given user has "PIN" feature "disabled" in the application
     Then the "pin_biometric_entrypoint" entrypoint with "PIN / Acceso biométrico" text is displayed
      And the "pin_biometric_status" textfield with "Desactivado" text is displayed

  @jira.QANOV-596628 @android @ber @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @smoke
  Scenario: User with phone number stored as recovery method can see it in the recovery method entrypoint
    Given user has "phone_number" as recovery method
     Then the "recovery_method_subtitle" textfield with "[CONTEXT:recovery_phone_number]" text is displayed

  @jira.QANOV-596629 @android @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @smoke @ber
  Scenario: User with email stored as recovery method can see it in the recovery method entrypoint
    Given user has "email" as recovery method
     Then the "recovery_method_subtitle" textfield with "[CONTEXT:recovery_email]" text is displayed

  @jira.QANOV-596630 @android @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: User without recovery method will see custom sunbtitle in the recovery entrypoint
    Given user has no recovery method
     Then the "recovery_method_subtitle" textfield is displayed
