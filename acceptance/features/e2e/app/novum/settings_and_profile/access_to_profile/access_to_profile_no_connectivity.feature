# -*- coding: utf-8 -*-
@jira.QANOV-82797
Feature: Access to Profile without connectivity

  Actions Before each Scenario:
    Given user is in the "Profile" page

  Actions After the Feature:
     Then the device is connected to a "wifi" network


  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.relates_to.NOV-174708 @mobile @regression
  Scenario Outline: User can see log out option in Profile screen when a server error happens
    NOTE: server error can be simulated from: 'developer settings->settings->Force GetUserprofile error'
    Given user is in the "<page>" page
      And there is a general server error in the Profile page
     When clicks on the "navigation_top_bar.profile_icon" icon
     Then the "Profile Error" page is displayed
      And the "photo" icon is not displayed
      And the "log_out_button" button is displayed
      And the "retry_button" button with "[LANG:profile.force_user_error.retry_user_error]" text is displayed
      And the general server error in the Profile page is solved
      And clicks on the "retry_button" button
      And the "Profile" page is displayed

    @automatic @cert0 @cert1 @live @next
    Examples:
          | cv   | product | client  | page    | jira_id    |
          | 11.7 | o2uk    | android | Account | QANOV-6039 |

    @automatic @jira.link.detects.ANDROID-9320 @jira.link.detects.ANDROID-9710 @live
    @next @qa @old_app
    Examples:
          | cv   | product | client  | page    | jira_id    |
          | 11.7 | vivobr  | android | Account | QANOV-6041 |

    @jira.link.parent_test_plan.QANOV-437387 @manual
    Examples:
          | cv   | product | client  | page      | jira_id      |
          | 24.3 | vivobr  | android | Menu Mais | QANOV-453431 |

    @manual
    Examples:
          | cv   | product | client  | page    | jira_id      |
          | 13.9 | blaude  | android | Account | QANOV-217463 |
          | 14.2 | o2de    | android | Account | QANOV-217464 |

    @impeded_mock @jira.link.parent_test_plan.QANOV-437387 @no_automatable
    Examples:
          | cv   | product | client | page      | jira_id      |
          | 24.3 | vivobr  | ios    | Menu Mais | QANOV-453432 |

  @jira.QANOV-47937 @android @automatic @cert0 @cert1 @har @jira.cv.10.3 @jira.link.relates_to.NOV-54251
  @jira.link.relates_to.NOV-54252 @live @mobile @next @o2uk @regression
  Scenario: O2uk postpay user without data connection selects Profile icon: Profile screen is opened with all options enabled in Android devices
    other_affected_versions="2021-15"
    Given user has a "postpay" account type
      And user turns on the Airplane mode
      And waits until the "No Connectivity Warning" warning is not displayed
     Then the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.QANOV-82819 @automatic @cert0 @cert1 @ios @jira.cv.10.3 @jira.link.relates_to.NOV-54251
  @jira.link.relates_to.NOV-54252 @live @mobile @next @o2uk @regression @har
  Scenario: O2uk postpay user without data connection selects Profile icon: Profile screen is opened with all options enabled in iOS devices
    other_affected_versions="2021-15"
    Given user has a "postpay" account type
      And user turns on the Airplane mode
     Then the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.QANOV-47938 @android @automatic @cert0 @cert1 @jira.cv.10.3 @jira.link.relates_to.NOV-54251
  @jira.link.relates_to.NOV-54252 @live @mobile @next @o2uk @regression
  Scenario: O2uk prepay user without data connection selects Profile icon: Profile screen is opened with all options enabled in Android devices
    other_affected_versions="2021-15"
    Given user has a "prepay" account type
      And user turns on the Airplane mode
      And waits until the "No Connectivity Warning" warning is not displayed
     Then the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.QANOV-82827 @automatic @cert0 @cert1 @ios @jira.cv.10.3 @jira.link.relates_to.NOV-54251
  @jira.link.relates_to.NOV-54252 @live @mobile @next @o2uk @regression
  Scenario: O2uk prepay user without data connection selects Profile icon: Profile screen is opened with all options enabled in iOS devices
    other_affected_versions="2021-15"
    Given user has a "prepay" account type
      And user turns on the Airplane mode
     Then the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.QANOV-47939 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-178803 @jira.link.relates_to.NOV-54251
  @jira.link.relates_to.NOV-54252 @manual @mobile @o2uk @regression
  Scenario: O2uk device user without data connection selects Profile icon: Profile screen is opened with all options enabled
    other_affected_versions="2021-15, 2022-23"
    Given user has a "device" account type
      And user has "0" mobile lines
      And user turns on the Airplane mode
     Then the "my_information_textfield" textfield with "[LANG:profile.dashboard.my_information.title]" text is displayed
      And the "my_information_list" list with "[LANG:profile.dashboard.my_information.contact_preferences]" entrypoints is displayed
      And the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-54251 @jira.link.relates_to.NOV-54252 @manual @mobile @regression @vivobr
  Scenario Outline: Monoplan Vivobr <account_type> user without data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user turns on the Airplane mode
     Then the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    Examples:
          | account_type  | cv   | parent_test_plan | jira_id      |
          | legacy prepay | 10.3 |                  | QANOV-47946  |
          | jeri          | 13.5 | QANOV-200803     | QANOV-203793 |
          | control_n     | 13.5 | QANOV-200803     | QANOV-203794 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-54251 @jira.link.relates_to.NOV-54252 @manual
  @mobile @regression @vivobr
  Scenario Outline: Vivobr <account_type> user logged by <login_type> without data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "<account_type>" account type
      And user has a "any" plan in "active" status
      And user has logged by "<login_type>"
      And user turns on the Airplane mode
     Then the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "my_configuration_list" list with "<my_information_list>" entrypoints is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    Examples:
          | account_type | login_type | my_information_list                                                                                                         | cv    | jira_id     |
          | beatrix      | otp        | [LANG:profile.dashboard.my_information.personal_details]                                                                    | 10.3  | QANOV-47947 |
          | beatrix      | usr/pwd    | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.change_password.entrypoint] | 12.0  | QANOV-60025 |
          | multivivo    | otp        | [LANG:profile.dashboard.my_information.personal_details]                                                                    | 11.13 | QANOV-47948 |
          | multivivo    | usr/pwd    | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.change_password.entrypoint] | 12.0  | QANOV-60026 |

  @jira.<jira_id> @<impeded> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-54251 @jira.link.relates_to.NOV-54252 @manual @mobile @regression @vivobr
  Scenario Outline: Vivo Convergente in <account_status> status users logged by <login_type> without data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "convergente" account type
      And user has a "any" plan in "<plan_status>" status
      And user has a "beatrix" mobile line
      And user has logged by "<login_type>"
      And user turns on the Airplane mode
     Then the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "my_configuration_list" list with "<my_information_list>" entrypoints is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    Examples:
          | plan_status | login_type | my_information_list                                                                                                         | cv   | parent_test_plan        | impeded      | jira_id     |
          | active      | otp        | [LANG:profile.dashboard.my_information.personal_details]                                                                    | 12.0 | QANOV-21791             | impeded_mock | QANOV-47949 |
          | active      | usr/pwd    | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.change_password.entrypoint] | 12.0 | QANOV-21791:QANOV-66163 |              | QANOV-47951 |
          | pending     | otp        | [LANG:profile.dashboard.my_information.personal_details]                                                                    | 12.4 | QANOV-56585             | impeded_mock | QANOV-60027 |
          | pending     | usr/pwd    | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.change_password.entrypoint] | 12.4 | QANOV-56585             | impeded_mock | QANOV-60028 |

  @jira.QANOV-47950 @android @impeded_mock @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-66163
  @jira.link.relates_to.NOV-54251 @jira.link.relates_to.NOV-54252 @manual @mobile @regression @vivobr
  Scenario: Monoplan Vivo Soft Convergente users logged by CPF without data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "convergente" account type
      And user has "1" plans
      And user has a "soft convergente" plan in "active" status
      And user has logged by "usr/pwd"
      And user turns on the Airplane mode
     Then the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "my_configuration_list" list with "[LANG:profile.dashboard.my_information.change_password.entrypoint]" entrypoints is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.QANOV-60029 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-66163 @manual @mobile @regression
  @vivobr
  Scenario: Multiplan Vivo Soft Convergente users without beatrix plan associated logged by CPF without data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "convergente" account type
      And user has "several" plans
      And user has a "soft convergente" plan in "active" status
      And user does not have a "beatrix" mobile line
      And user has logged by "usr/pwd"
      And user turns on the Airplane mode
     Then the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "my_configuration_list" list with "[LANG:profile.dashboard.my_information.change_password.entrypoint]" entrypoints is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.QANOV-60030 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-66163 @manual @mobile @regression
  @vivobr
  Scenario: Multiplan Vivo Soft Convergente users with beatrix plan associated logged by CPF without data connection selects Profile icon: Profile screen is opened with all options enabled
    Given user has a "convergente" account type
      And user has "several" plans
      And user has a "soft convergente" plan in "active" status
      And user has a "beatrix" mobile line
      And user has logged by "usr/pwd"
      And user turns on the Airplane mode
     Then the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "my_configuration_list" list with "[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.change_password.entrypoint]" entrypoints is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.4 @manual @mobile @regression
  Scenario Outline: A <product> <account_type> user without data connection and a "<user_products>" product selects Profile icon: Profile screen is opened with all options
    Given the app version is "equal_or_higher" than "14.4"
      And user has a "<account_type>" account type
      And user has any "<user_products>" product in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user turns on the Airplane mode
     Then the "my_information_textfield" textfield with "[LANG:profile.dashboard.my_information.title]" text is displayed
      And the "my_information_list" list with "<my_information_entrypoints>" entrypoints is displayed
      And the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.notifications];[LANG:profile.dashboard.configuration.security_and_privacy];[LANG:profile.dashboard.configuration.cookies]" entrypoints is displayed
      And the "support_list" list with "<support_entrypoints>" entrypoints is displayed
      And the "rate_us_entrypoint" entrypoint with "[LANG:profile.dashboard.rate_us]" text is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    Examples:
          | product | account_type | user_products                | my_information_entrypoints                                                                                                                                                                                               | support_entrypoints                                                                                                                                                                         | jira_id      |
          | blaude  | prepay       | mobile_line                  | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.payment_settings]                                                                                                        | [LANG:profile.dashboard.support.legal_documents];[LANG:profile.dashboard.support.cancel_contract];[LANG:profile.dashboard.support.data_protection];[LANG:profile.dashboard.support.imprint] | QANOV-386131 |
          | blaude  | postpay      | mobile_line                  | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.payment_settings];[LANG:profile.dashboard.my_information.my_contracts];[LANG:profile.dashboard.my_information.my_orders] | [LANG:profile.dashboard.support.legal_documents];[LANG:profile.dashboard.support.data_protection];[LANG:profile.dashboard.support.imprint]                                                  | QANOV-386132 |
          | o2de    | prepay       | mobile_line                  | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.payment_settings]                                                                                                        | [LANG:profile.dashboard.support.legal_documents];[LANG:profile.dashboard.support.cancel_contract];[LANG:profile.dashboard.support.data_protection];[LANG:profile.dashboard.support.imprint] | QANOV-386133 |
          | o2de    | postpay      | mobile_line;internet_at_home | [LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.payment_settings];[LANG:profile.dashboard.my_information.my_contracts];[LANG:profile.dashboard.my_information.my_orders] | [LANG:profile.dashboard.support.legal_documents];[LANG:profile.dashboard.support.data_protection];[LANG:profile.dashboard.support.imprint]                                                  | QANOV-386134 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.4 @manual @mobile @regression
  Scenario Outline: A <product> user without data connection and only MyHandy product/s selects Profile icon: Profile screen is opened with all options
    Given the app version is "equal_or_higher" than "14.4"
      And user has a "my_handy" product in "active" status
      And user has not a "internet_at_home" product
      And user has not a "mobile_line" product
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user turns on the Airplane mode
     Then the "my_information_textfield" textfield with "[LANG:profile.dashboard.my_information.title]" text is displayed
      And the "my_information_list" list with "[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.payment_settings];[LANG:profile.dashboard.my_information.my_orders]" entrypoints is displayed
      And the "configuration_textfield" textfield with "[LANG:profile.dashboard.configuration.title]" text is displayed
      And the "configuration_list" list with "[LANG:profile.dashboard.configuration.notifications];[LANG:profile.dashboard.configuration.security_and_privacy];[LANG:profile.dashboard.configuration.cookies]" entrypoints is displayed
      And the "support_list" list with "[LANG:profile.dashboard.support.legal_documents];[LANG:profile.dashboard.support.data_protection];[LANG:profile.dashboard.support.imprint]" entrypoints is displayed
      And the "rate_us_entrypoint" entrypoint with "[LANG:profile.dashboard.rate_us]" text is displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

    Examples:
          | product | detects                                  | jira_id      |
          | blaude  | O2DE-1445:O2DE-1795:O2DE-1826:OBO2DE-110 | QANOV-386135 |
          | o2de    | O2DE-1445:O2DE-1795:O2DE-1826            | QANOV-386136 |

  @jira.<jira_id> @<execution_mode> @<product> @android @jira.cv.10.4 @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-54267 @mobile @regression
  Scenario Outline: <product> user with <account_type> account type and without data connection taps on the Security and Privacy entrypoint: the screen is opened with all options enabled in Android devices
    Given user has a "<account_type>" account type
      And user turns on the Airplane mode
      And waits until the "No Connectivity Warning" warning is not displayed
     When clicks on the "security_and_privacy_entrypoint" entrypoint
      And the "Security And Privacy" page is displayed
     Then the "security_and_privacy_list" list with "<entrypoint_list>" entrypoints is displayed

    @cert0 @cert1 @live @next
    Examples:
          | cv   | account_type   | product | entrypoint_list                                                                                                                                                           | execution_mode | parent_test_plan | jira_id     |
          | 10.4 | legacy postpay | o2uk    | PIN/Biometric;Change security question;Manage access to 18+ websites;Session management;Terms and conditions;Delete account;Forgotten sign in details;Network preferences | automatic      | QANOV-24141      | QANOV-26142 |
          | 12.4 | AO2 postpay    | o2uk    | PIN/Biometric;Change security question;Session management;Terms and conditions;Delete account;Forgotten sign in details;Network preferences                               | manual         | QANOV-24140      | QANOV-47863 |
          | 10.4 | legacy prepay  | o2uk    | PIN/Biometric;Change security question;Session management;Terms and conditions;Delete account;Forgotten sign in details;Network preferences                               | automatic      | QANOV-24141      | QANOV-6159  |

    @live @next @qa
    Examples:
          | cv   | account_type | product | entrypoint_list                                                    | execution_mode | parent_test_plan         | jira_id    |
          | 10.4 | any          | vivobr  | Acesso biométrico e PIN;Acesso a sua conta;Alterar senha de acesso | automatic      | QANOV-56585:QANOV-200803 | QANOV-6160 |

  @jira.<jira_id> @<execution_mode> @<product> @ios @jira.cv.10.4 @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-54267 @mobile @regression
  Scenario Outline: <product> user with <account_type> account type and without data connection taps on the Security and Privacy entrypoint: the screen is opened with all options enabled in iOS devices
    Given user has a "<account_type>" account type
      And user turns on the Airplane mode
     When clicks on the "security_and_privacy_entrypoint" entrypoint
      And the "Security And Privacy" page is displayed
     Then the "security_and_privacy_list" list with "<entrypoint_list>" entrypoints is displayed

    @cert0 @cert1 @live @next
    Examples:
          | cv   | account_type   | product | entrypoint_list                                                                                                                                                           | execution_mode | parent_test_plan | jira_id     |
          | 10.4 | legacy postpay | o2uk    | PIN/Biometric;Change security question;Manage access to 18+ websites;Session management;Terms and conditions;Delete account;Forgotten sign in details;Network preferences | automatic      | QANOV-24141      | QANOV-82906 |
          | 12.4 | AO2 postpay    | o2uk    | PIN/Biometric;Change security question;Session management;Terms and conditions;Delete account;Forgotten sign in details;Network preferences                               | manual         | QANOV-24140      | QANOV-82912 |
          | 10.4 | legacy prepay  | o2uk    | PIN/Biometric;Change security question;Session management;Terms and conditions;Delete account;Forgotten sign in details;Network preferences                               | automatic      | QANOV-24141      | QANOV-82915 |

    @live @next @qa
    Examples:
          | cv   | account_type | product | entrypoint_list                                                                                                                                                                       | execution_mode | parent_test_plan         | jira_id     |
          | 10.4 | any          | vivobr  | [LANG:profile.security_and_privacy.biometric_pin_access.page_header];[LANG:profile.session_management.page_header];[LANG:profile.dashboard.my_information.change_password.entrypoint] | automatic      | QANOV-56585:QANOV-200803 | QANOV-82920 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-48072 @manual @mobile @regression @vivobr
  Scenario Outline: <account_type> user logged by <login_type> method without data connection taps on a profile <option> that redirects to a webview: error message will be shown with a refresh button
    Given user has a "<account_type>" account type
      And user has a "any" plan in "active" status
      And user has logged by "<login_type>"
      And user has a "<role_type>" role
      And user turns on the Airplane mode
      And user is in the "<initial_page>" page
     When clicks on the "<option>" entrypoint
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | cv    | account_type | login_type | role_type | initial_page         | option                          | parent_test_plan          | jira_id      |
          | 10.4  | beatrix      | otp        | any       | Profile              | personal_information_entrypoint |                           | QANOV-6173   |
          | 12.0  | beatrix      | usr/pwd    | admin     | Profile              | change_password_entrypoint      | QANOV-21791               | QANOV-60031  |
          | 10.4  | beatrix      | any        | any       | Profile              | vivo_valoriza_entrypoint        |                           | QANOV-6174   |
          | 10.4  | beatrix      | any        | any       | Profile              | account_address_entrypoint      |                           | QANOV-6175   |
          | 10.4  | beatrix      | any        | any       | Security And Privacy | tems_and_conditions_entrypoint  |                           | QANOV-6177   |
          | 10.4  | legacy       | any        | any       | Security And Privacy | tems_and_conditions_entrypoint  |                           | QANOV-6178   |
          | 11.13 | multivivo    | otp        | any       | Profile              | personal_information_entrypoint |                           | QANOV-22240  |
          | 12.0  | multivivo    | usr/pwd    | admin     | Profile              | change_password_entrypoint      | QANOV-21791               | QANOV-60032  |
          | 11.13 | multivivo    | any        | any       | Profile              | vivo_valoriza_entrypoint        |                           | QANOV-22241  |
          | 11.13 | multivivo    | any        | any       | Profile              | account_address_entrypoint      |                           | QANOV-22242  |
          | 11.13 | multivivo    | any        | any       | Security And Privacy | tems_and_conditions_entrypoint  |                           | QANOV-22244  |
          | 13.5  | jeri         | any        | any       | Security And Privacy | tems_and_conditions_entrypoint  | QANOV-200803:QANOV-226748 | QANOV-203802 |
          | 13.5  | control_n    | any        | any       | Security And Privacy | tems_and_conditions_entrypoint  | QANOV-200803              | QANOV-203803 |

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @jira.link.relates_to.NOV-48072
  @manual @mobile @regression @vivobr
  Scenario Outline: A convergente user logged by <login_type> method and without data connection taps on the profile <option> that redirects to a webview: error message will be shown with a refresh button
    Given user has a "convergente" account type
      And user has a "any" plan in "active" status
      And user has a "any" role
      And user has logged by "<login_type>"
      And user turns on the Airplane mode
      And user is in the "<initial_page>" page
     When clicks on the "<option>" entrypoint
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | initial_page         | login_type | option                     | jira_id     |
          | Profile              | usr/pwd    | change_password_entrypoint | QANOV-22248 |
          | Profile              | any        | vivo_valoriza_entrypoint   | QANOV-22246 |
          | Security And Privacy | any        | tems_and_conditions        | QANOV-22250 |

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @jira.link.relates_to.NOV-48072
  @manual @mobile @regression @vivobr
  Scenario Outline: Convergente user with several plans, with beatrix plan associated without data connection taps the profile <option> that redirects to a webview: error message will be shown with a refresh button
    Given user has a "convergente" account type
      And user has a "any" plan in "active" status
      And user has a "any" role
      And user has "several" plans
      And user has a "beatrix" mobile line
      And user turns on the Airplane mode
      And user is in the "Profile" page
     When clicks on the "<option>" entrypoint
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | option                          | jira_id     |
          | personal_information_entrypoint | QANOV-60033 |
          | account_address_entrypoint      | QANOV-60034 |

  @jira.<jira_id> @android @automatic @cert0 @cert1 @jira.cv.10.4 @jira.link.detects.ANDROID-9370
  @jira.link.detects.O2UK-4391 @jira.link.relates_to.NOV-48072 @live @mobile @next @o2uk @regression
  Scenario Outline: O2uk User without data connection taps on the profile <option> that redirects to a webview: error message will be shown with a refresh button in Android devices
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user turns on the Airplane mode
      And user is in the "Security And Privacy" page
      And waits until the "No Connectivity Warning" warning is not displayed
     When clicks on the "<option>" entrypoint
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Security And Privacy" page is displayed

    @cert0 @cert1 @live @next
    Examples:
          | account_type | option                              | jira_id    |
          | any          | forgotten_sign_details_entrypoint   | QANOV-6172 |
          | any          | terms_and_conditions_entrypoint     | QANOV-6170 |
          | any          | delete_account_entrypoint           | QANOV-6171 |
          | any          | change_security_question_entrypoint | QANOV-6169 |

  @jira.QANOV-26143 @android @automatic @cert0 @cert1 @jira.cv.10.4 @jira.link.detects.O2UK-4050
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-48072 @live @mobile @next @o2uk @regression
  Scenario: Legacy O2uk User without data connection taps on the profile age_verification_entrypoint that redirects to a webview: error message will be shown with a refresh button in Android devices
    Given user has a "legacy postpay" account type
      And user has "1" mobile lines
      And user turns on the Airplane mode
      And waits until the "No Connectivity Warning" warning is not displayed
      And user is in the "Security And Privacy" page
     When clicks on the "age_verification_entrypoint" entrypoint
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Security And Privacy" page is displayed

  @jira.<jira_id> @automatic @cert0 @cert1 @ios @jira.cv.10.4 @jira.link.relates_to.NOV-48072 @live @mobile @next @o2uk
  @regression
  Scenario Outline: O2uk User without data connection taps on the profile <option> that redirects to a webview: error message will be shown with a refresh button in iOS devices
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user turns on the Airplane mode
      And user is in the "Security And Privacy" page
     When clicks on the "<option>" entrypoint
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Security And Privacy" page is displayed

    @cert0 @cert1 @live @next
    Examples:
          | account_type | option                              | jira_id     |
          | any          | change_security_question_entrypoint | QANOV-83119 |
          | any          | forgotten_sign_details_entrypoint   | QANOV-83121 |
          | any          | terms_and_conditions_entrypoint     | QANOV-83124 |
          | any          | delete_account_entrypoint           | QANOV-83126 |

  @jira.QANOV-83128 @automatic @cert0 @cert1 @ios @jira.cv.10.4 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-48072 @live @mobile @next @o2uk @regression
  Scenario: Legacy O2uk User without data connection taps on the profile age_verification_entrypoint that redirects to a webview: error message will be shown with a refresh button in iOS devices
    Given user has a "legacy postpay" account type
      And user has "1" mobile lines
      And user turns on the Airplane mode
      And user is in the "Security And Privacy" page
     When clicks on the "age_verification_entrypoint" entrypoint
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Security And Privacy" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @<har>
  Scenario Outline: User without data connection taps on the <option> option in the profile screen: error message will be shown with a refresh button
    Given user has a "<account_type>" account type
      And user has any "<user_products>" product
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "No Connectivity Webview" module configured in CMS for "No Connectivity Webview" page
      And user turns on the Airplane mode
     When clicks on the "<option>" entrypoint
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | product | cv   | account_type | user_products                         | option                     | har | jira_id      |
          | blaude  | 13.9 | postpay      | mobile_line;my_handy                  | my_orders_entrypoint       | har | QANOV-217472 |
          | blaude  | 13.9 | any          | mobile_line;my_handy                  | data_protection_entrypoint |     | QANOV-217475 |
          | blaude  | 13.9 | any          | mobile_line;my_handy                  | imprint_entrypoint         |     | QANOV-217476 |
          | blaude  | 13.9 | any          | mobile_line;my_handy                  | legal_documents_entrypoint |     | QANOV-311041 |
          | o2de    | 14.2 | postpay      | mobile_line;my_handy;internet_at_home | my_orders_entrypoint       | har | QANOV-217478 |
          | o2de    | 14.2 | any          | mobile_line;my_handy;internet_at_home | data_protection_entrypoint |     | QANOV-217481 |
          | o2de    | 14.2 | any          | mobile_line;my_handy;internet_at_home | imprint_entrypoint         |     | QANOV-217482 |
          | o2de    | 14.2 | any          | mobile_line;my_handy;internet_at_home | legal_documents_entrypoint |     | QANOV-311042 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: Prepay user without data connection taps on the "Cancel contract" option in the profile screen: error message will be shown with a refresh button
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "No Connectivity Webview" module configured in CMS for "No Connectivity Webview" page
      And user turns on the Airplane mode
     When clicks on the "cancel_contract_entrypoint" entrypoint
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-217474 |
          | o2de    | 14.2 | QANOV-217480 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @har
  Scenario Outline: User without data connection taps on the "Payment settings" option in the profile screen: error message will be shown with a refresh button
    Given user has a "any" product in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "No Connectivity Webview" module configured in CMS for "No Connectivity Webview" page
      And user turns on the Airplane mode
     When clicks on the "payment_settings_entrypoint" entrypoint
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-217471 |
          | o2de    | 14.2 | QANOV-217477 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @<har>
  Scenario Outline: User without data connection taps on the "<option>" option in the "Personal data" screen: error message will be shown with a refresh button
    Given user has a "<account_type>" account type
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user has the "No Connectivity Webview" module configured in CMS for "No Connectivity Webview" page
      And user is in the "Personal Data" page
      And user turns on the Airplane mode
     When clicks on the "<option>" entrypoint
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | product | cv    | account_type | option                              | har | depends_on   | parent_test_plan | jira_id      |
          | blaude  | 13.9  | any          | change_contact_details_entrypoint   | har | QANOV-217322 |                  | QANOV-223244 |
          | blaude  | 13.9  | box7         | change_login_credentials_entrypoint |     | QANOV-217322 |                  | QANOV-228047 |
          | blaude  | 14.10 | raitt        | change_password_entrypoint          |     | QANOV-416190 | QANOV-402198     | QANOV-420234 |
          | o2de    | 14.2  | any          | change_contact_details_entrypoint   | har | QANOV-217323 |                  | QANOV-223245 |
          | o2de    | 14.2  | any          | change_login_credentials_entrypoint |     | QANOV-217323 |                  | QANOV-228051 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression @<har>
  Scenario Outline: Postpay user without data connection taps on the "<option>" option in the "My contracts" screen: error message will be shown with a refresh button
    Given user has a "postpay" account type
      And user has any "<user_product>" product in "active" status
      And user has the "My contracts" module configured in CMS for "My contracts" page
      And user has the "No Connectivity Webview" module configured in CMS for "No Connectivity Webview" page
      And user is in the "My Contracts" page
      And user turns on the Airplane mode
     When clicks on the "<entrypoint>" entrypoint
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | product | cv    | user_product                 | option                     | entrypoint                                         | har | depends_on                | jira_id      |
          | blaude  | 13.9  | mobile_line                  | Contract alias             | my_contracts.change_contract_alias_entrypoint      |     | QANOV-217356              | QANOV-227521 |
          | blaude  | 13.9  | mobile_line                  | Contract owner             | my_contracts.change_contract_owner_entrypoint      |     | QANOV-217356              | QANOV-227522 |
          | blaude  | 13.9  | mobile_line                  | Cancel contract            | my_contracts.cancel_contract_entrypoint            | har | QANOV-217356              | QANOV-227523 |
          | o2de    | 14.2  | mobile_line;internet_at_home | Contract alias             | my_contracts.change_contract_alias_entrypoint      |     | QANOV-312322:QANOV-376011 | QANOV-227527 |
          | o2de    | 14.2  | mobile_line;internet_at_home | Contract owner             | my_contracts.change_contract_owner_entrypoint      |     | QANOV-312322:QANOV-376011 | QANOV-227528 |
          | o2de    | 14.2  | mobile_line;internet_at_home | Cancel contract            | my_contracts.cancel_contract_entrypoint            | har | QANOV-312322:QANOV-376011 | QANOV-227529 |
          | o2de    | 14.11 | mobile_line;internet_at_home | Self-employed verification | my_contracts.self_employed_verification_entrypoint |     | QANOV-312322:QANOV-376011 | QANOV-227530 |
          | o2de    | 14.11 | mobile_line;internet_at_home | Young-age verification     | my_contracts.young_age_verification_entrypoint     |     | QANOV-312322:QANOV-376011 | QANOV-227531 |
          | o2de    | 14.11 | mobile_line                  | Decommission contract      | my_contracts.decommission_contract_entrypoint      |     | QANOV-312322              | QANOV-227532 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User without data connection taps on the "Consent Management Data Processing" option in the "Security & Privacy" screen: error message will be shown with a refresh button
    Given user has a "any" product in "active" status
      And user has the "Security And Privacy" module configured in CMS for "Security And Privacy" page
      And user has the "No Connectivity Webview" module configured in CMS for "No Connectivity Webview" page
      And user is in the "Security And Privacy" page
      And user turns on the Airplane mode
     When clicks on the "consent_management_data_processing_entrypoint" entrypoint
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-217358 | QANOV-243158 |
          | o2de    | 14.2 | QANOV-217359 | QANOV-243161 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User without data connection taps on the "PIN/Biometric" option in the "Security & Privacy" screen: the "Pin Biometric" screen is displayed
    Given user has the "Security And Privacy" module configured in CMS for "Security And Privacy" page
      And user has the "Pin Biometric" module configured in CMS for "Pin Biometric" page
      And user is in the "Security And Privacy" page
      And user turns on the Airplane mode
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-217358 | QANOV-286653 |
          | o2de    | 14.2 | QANOV-217359 | QANOV-286654 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User without data connection taps on the "Cookies Management" option in the "Profile" screen: the "Cookies Management" screen is displayed
    Given user has the "Cookies Management" module configured in CMS for "Cookies Management" page
      And user is in the "Profile" page
      And user turns on the Airplane mode
     When clicks on the "cookies_management_entrypoint" entrypoint
     Then the "Cookies Management" popup is displayed
      And clicks on the "refuse_button" button
      And the "Profile" page is displayed
      And the "Profil" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-217358 | QANOV-243159 |
          | o2de    | 14.2 | QANOV-217359 | QANOV-243162 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User without data connection taps on the "App notifications" option in the "Notifications" screen: the "Notifications Management" screen is displayed
    Given user has the "Notifications" module configured in CMS for "Notifications" page
      And user has the "Notifications Management" module configured in CMS for "Notifications Management" page
      And user is in the "Notifications" page
      And user turns on the Airplane mode
     When clicks on the "app_notifications_entrypoint" entrypoint
     Then the "Notifications Management" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | Future | QANOV-296685 |
          | o2de    | Future | QANOV-296686 |

  @jira.QANOV-453435 @android @cert0 @cert1 @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile
  @regression @vivobr
  Scenario: Vivo user without data connection selects Profile icon: Profile screen is opened with all options enabled
     When user turns on the Airplane mode
     Then the "settings_list" list with "[LANG:profile.dashboard.my_information.personal_details];[LANG:profile.dashboard.my_information.identity_confirmation];[LANG:profile.dashboard.configuration.security_and_privacy]" entrypoints is displayed
      And the "log_out_button" entrypoint with "Sair de minha conta" text is displayed
