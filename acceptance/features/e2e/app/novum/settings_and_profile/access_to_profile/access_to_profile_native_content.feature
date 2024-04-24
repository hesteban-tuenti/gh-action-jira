# -*- coding: utf-8 -*-
@jira.QANOV-126430
Feature: Access to Profile Native Content

  Actions Before the Feature:
    Given user is in the "Profile" page


  @jira.QANOV-205532 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.13.3 @jira.dv.Future
  @jira.link.parent_test_plan.QANOV-203801 @live @mobile @moves @next @regression
  Scenario: Moves user can access to the notifications management entrypoint in Profile and check the header is right
    Given user has a "any" account type
      And user has a "any" role
      And user is in the "App Configuration" page
     When clicks on the "notifications_management_entrypoint" entrypoint
     Then the "Notifications Management" page is displayed
      And the "[LANG:profile.dashboard.app_configuration.notifications_management.notifications_management_name]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "App Configuration" page is displayed

  @jira.<jira_id> @<client> @cert2 @deprecate_profile_moves @jira.cv.13.3 @jira.dv.Future
  @jira.link.parent_test_plan.QANOV-203801 @live @manual @mobile @moves @next @regression
  Scenario Outline: Moves user with <client> client can access to the <entrypoint> entrypoint in Profile
    Given user has a "any" account type
      And user has a "any" role
      And user is in the "App Configuration" page
     When clicks on the "<entrypoint>" entrypoint
     Then the "<app>" app is displayed
      And the "Mi Movistar" page is displayed in the "<app>" app

    Examples:
          | client  | app        | entrypoint                      | jira_id      |
          | android | Play Store | rate_us_in_playstore_entrypoint | QANOV-205534 |
          | ios     | App Store  | rate_us_in_appstore_entrypoint  | QANOV-205535 |

  @jira.<jira_id> @<product> @android @automatic @ber @har @ios @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-100486 @mobile @sanity
  Scenario Outline: User can access to Security And Privacy screen and check the header is right
    other_affected_versions="2021-07"
    Given user is in the "Profile" page
     When clicks on the "security_and_privacy_entrypoint" entrypoint
     Then the "Security And Privacy" page is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    @cert2 @deprecate_profile_moves @jira.cv.13.3 @jira.dv.Future @live @next
    Examples:
          | product | parent_test_plan | header                                                      | jira_id     |
          | moves   | QANOV-203801     | [LANG:profile.dashboard.configuration.privacy_and_security] | QANOV-21768 |

    @cert0 @cert1 @jira.cv.11.7 @live @next @qa
    Examples:
          | product | parent_test_plan | header                                                      | jira_id     |
          | o2uk    | QANOV-35253      | [LANG:profile.dashboard.configuration.security_and_privacy] | QANOV-21769 |

    @jira.cv.11.7 @live @next
    Examples:
          | product | parent_test_plan        | header                                                      | jira_id     |
          | vivobr  | QANOV-56585:QANOV-66163 | [LANG:profile.dashboard.configuration.security_and_privacy] | QANOV-21770 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.<cv> @jira.link.detects.ANDROID-9257
  @jira.link.detects.ANDROID-9586 @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-100486 @mobile
  Scenario Outline: <account_type> user can access to the <page_name> native page from the entrypoints in Security And Privacy screen and check the header is right
    Given user has a "<account_type>" account type
      And user is in the "Security And Privacy" page
     When clicks on the "<option>" entrypoint
     Then the "<page_name>" page is displayed
      And the "<header_name>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Security And Privacy" page is displayed

    @automatic @cert2 @deprecate_profile_moves @jira.dv.Future
    @jira.link.parent_test_plan.QANOV-203801 @live @next @sanity
    Examples:
          | product | cv   | account_type | option                          | page_name          | header_name                                                          | parent_test_plan | jira_id    |
          | moves   | 11.7 | telco        | biometric_pin_access_entrypoint | Pin Biometric      | [LANG:profile.security_and_privacy.biometric_pin_access.page_header] |                  | QANOV-5962 |
          | moves   | 11.7 | telco        | session_management_entrypoint   | Session Management | [LANG:profile.session_management.page_header]                        |                  | QANOV-5965 |

    @deprecate_profile_moves @impeded_legacy @jira.dv.Future
    @jira.link.parent_test_plan.QANOV-203801 @no_automatable @regression
    Examples:
          | product | cv   | account_type | option                          | page_name          | header_name                                                          | parent_test_plan | jira_id    |
          | moves   | 11.7 | legado       | biometric_pin_access_entrypoint | Pin Biometric      | [LANG:profile.security_and_privacy.biometric_pin_access.page_header] |                  | QANOV-5979 |
          | moves   | 11.7 | legado       | session_management_entrypoint   | Session Management | [LANG:profile.session_management.page_header]                        |                  | QANOV-5982 |

    @automatic @ber @live @next @qa @smoke @har @old_app
    Examples:
          | product | cv   | account_type | option                          | page_name          | header_name                                                          | parent_test_plan         | jira_id    |
          | vivobr  | 11.7 | any          | biometric_pin_access_entrypoint | Pin Biometric      | [LANG:profile.security_and_privacy.biometric_pin_access.page_header] | QANOV-56585:QANOV-200803 | QANOV-6005 |
          | vivobr  | 11.7 | any          | session_management_entrypoint   | Session Management | [LANG:profile.session_management.page_header]                        | QANOV-56585:QANOV-200803 | QANOV-6001 |

    @ber @manual @smoke
    Examples:
          | product | cv   | account_type | option                          | page_name          | header_name             | parent_test_plan | jira_id      |
          | vivobr  | 24.3 | any          | biometric_pin_access_entrypoint | Pin Biometric      | Acesso biométrico e PIN | QANOV-437387     | QANOV-453428 |
          | vivobr  | 24.3 | any          | session_management_entrypoint   | Session Management | Acesso a minha conta    | QANOV-437387     | QANOV-453429 |

    @automatic @ber @live @next @smoke @har
    Examples:
          | product | cv    | account_type | option                          | page_name     | header_name                                                          | parent_test_plan | jira_id      |
          | blaude  | 13.10 | any          | biometric_pin_access_entrypoint | Pin Biometric | [LANG:profile.security_and_privacy.biometric_pin_access.page_header] |                  | QANOV-286637 |
          | o2de    | 14.2  | any          | biometric_pin_access_entrypoint | Pin Biometric | [LANG:profile.security_and_privacy.biometric_pin_access.page_header] |                  | QANOV-286638 |

  @jira.<jira_id> @android @automatic @cert0 @cert1 @har @ios @jira.cv.11.7 @jira.link.detects.ANDROID-9257
  @jira.link.relates_to.NOV-100486 @live @mobile @next @o2uk @smoke
  Scenario Outline: A MyO2 user with msisdn products can access to the <page_name> native page from the entrypoints in Security And Privacy screen and check the header is right
    Given user has a "any" account type
      And user has a "mobile_line" product
      And user is in the "Security And Privacy" page
     When clicks on the "<option>" entrypoint
     Then the "<page_name>" page is displayed
      And the "<header_name>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Security And Privacy" page is displayed

    Examples:
          | option                          | page_name           | header_name                                                          | jira_id    |
          | biometric_pin_access_entrypoint | Pin Biometric       | [LANG:profile.security_and_privacy.biometric_pin_access.page_header] | QANOV-5986 |
          | network_preferences_entrypoint  | Network Preferences | Network preferences                                                  | QANOV-5997 |
          | session_management_entrypoint   | Session Management  | [LANG:profile.session_management.page_header]                        | QANOV-5989 |

  @jira.<jira_id> @android @automatic @cert0 @cert1 @har @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-178803
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-35253 @jira.link.parent_test_plan.QANOV-77438
  @mobile @next @o2uk @smoke
  Scenario Outline: A MyO2 user without msisdn products can access to the <page_name> native page from the entrypoints in Security And Privacy screen and check the header is right
    other_affected_versions="2021-07, 2022-23"
    Given user has a "device" account type
      And user has "0" mobile lines
      And user is in the "Security And Privacy" page
     When clicks on the "<option>" entrypoint
     Then the "<page_name>" page is displayed
      And the "<header_name>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Security And Privacy" page is displayed

    Examples:
          | option                          | page_name          | header_name                                                          | jira_id     |
          | biometric_pin_access_entrypoint | Pin Biometric      | [LANG:profile.security_and_privacy.biometric_pin_access.page_header] | QANOV-37517 |
          | session_management_entrypoint   | Session Management | [LANG:profile.session_management.page_header]                        | QANOV-37518 |

  @jira.<jira_id> @android @deprecate_profile_moves @ios @jira.cv.10.8 @jira.dv.Future @jira.link.detects.ANDROID-10245
  @jira.link.detects.ANDROID-9889 @jira.link.relates_to.NOV-92096 @mobile @moves
  Scenario Outline: A <account_type> priority user who access to the Profile screen can see the priority banner
    Given user has a "<account_type>" account type
      And user has a "priority" membership status
     Then the "priority" textfield with "[LANG:profile.dashboard.priority]" text is displayed

    @har @manual @smoke
    Examples:
          | account_type | jira_id    |
          | telco        | QANOV-6094 |

    @no_automatable @regression
    Examples:
          | account_type | jira_id    |
          | legado       | QANOV-6097 |

  @jira.<jira_id> @<product> @automatic @har @ios @jira.cv.11.8 @jira.link.relates_to.NOV-201245 @mobile @smoke
  Scenario Outline: A <product> user with a device with biometric capabilities and No fingerprint registered in the device can access to the PIN/Biometric screen on iOS devices
    Given user has a device with "biometric" capabilities
      And user is in the "Security And Privacy" page
      And the device has no fingerprint registered
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "pin_code_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "pin_code_switch" switch is displayed
      And the "change_pin_link" link with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_link]" text is displayed
      And the "biometric_textfield" textfield is displayed

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | jira_id    |
          | moves   | QANOV-6103 |

    @jira.link.parent_test_plan.QANOV-200803 @live @next @qa @old_app @har
    Examples:
          | product | jira_id    |
          | vivobr  | QANOV-6108 |

  @jira.<jira_id> @<product> @android @automatic @har @jira.cv.11.8 @jira.link.relates_to.NOV-201245 @mobile @smoke
  Scenario Outline: A <product> user with a device with biometric capabilities and No fingerprint registered in the device can access to the PIN/Biometric screen on Android devices
    Given user has a device with "biometric" capabilities
      And user is in the "Security And Privacy" page
      And the device has no fingerprint registered
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "pin_code_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "pin_code_switch" switch is displayed
      And the "change_pin_link" link with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_link]" text is displayed
      And the "biometric_textfield" textfield is not displayed

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | jira_id      |
          | moves   | QANOV-570513 |

    @jira.link.parent_test_plan.QANOV-200803 @live @next @qa @old_app @har
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-570514 |

  @jira.QANOV-451395 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @smoke @vivobr
  @har
  Scenario: A user with a device with biometric capabilities and No fingerprint registered in the device can access to the PIN/Biometric screen
    Given user has a device with "biometric" capabilities
      And user is in the "Security And Privacy" page
      And the device has no fingerprint registered
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "Acesso biométrico e PIN" header is displayed
      And the "pin_code_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "pin_code_description" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_description]" text is displayed
      And the "pin_code_switch" switch is displayed
      And the "change_pin_link" link with "Alterar código PIN" text is displayed
      And the "biometric_textfield" textfield is not displayed

  @jira.QANOV-6105 @android @automatic @cert0 @cert1 @har @jira.cv.11.8 @jira.link.parent_test_plan.QANOV-35253
  @jira.link.relates_to.NOV-201245 @live @mobile @next @o2uk @smoke
  Scenario: A MyO2 user with a device with biometric capabilities and No fingerprint registered in the device can access to the PIN/Biometric screen on Android devices
    other_affected_versions="2021-07"
    Given user has a device with "biometric" capabilities
      And user is in the "Security And Privacy" page
      And the device has no fingerprint registered
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "pin_code_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "change_pin_link" link with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_link]" text is displayed
      And the "biometric_textfield" textfield is not displayed

  @jira.QANOV-570052 @automatic @cert0 @cert1 @har @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-35253
  @jira.link.relates_to.NOV-201245 @live @mobile @next @o2uk @smoke
  Scenario: A MyO2 user with a device with biometric capabilities and No fingerprint registered in the device can access to the PIN/Biometric screen on iOS devices
    Given user has a device with "biometric" capabilities
      And user is in the "Security And Privacy" page
      And the device has no fingerprint registered
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "pin_code_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "change_pin_link" link with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_link]" text is displayed
      And the "biometric_textfield" textfield is displayed

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-201245 @manual @mobile @smoke @har
  Scenario Outline: A <product> user with a device with biometric capabilities and No fingerprint registered in the device can access to the PIN/Biometric screen on Android devices
    Given user has a device with "biometric" capabilities
      And user is in the "Security And Privacy" page
      And the device has no fingerprint registered
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "pin_code_title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "pin_code_description" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_description]" text is displayed
      And the "change_pin_link" link with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_link]" text is displayed
      And the "biometric_access_title" textfield is not displayed
      And the "biometric_access_description" textfield is not displayed
      And the "biometric_access_switch" switch is not displayed

    Examples:
          | product | cv    | jira_id      |
          | blaude  | 13.10 | QANOV-286639 |
          | o2de    | 14.2  | QANOV-286640 |

  @jira.<jira_id> @<product> @ios @jira.cv.24.1 @jira.link.relates_to.NOV-201245 @manual @mobile @smoke @har
  Scenario Outline: A <product> user with a device with biometric capabilities and No fingerprint registered in the device can access to the PIN/Biometric screen on iOS devices
    Given user has a device with "biometric" capabilities
      And user is in the "Security And Privacy" page
      And the device has no fingerprint registered
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "pin_code_title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "pin_code_description" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_description]" text is displayed
      And the "change_pin_link" link with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_link]" text is displayed
      And the "biometric_access_title" textfield is displayed
      And the "biometric_access_description" textfield is displayed
      And the "biometric_access_switch" switch is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-570053 |
          | o2de    | QANOV-570055 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.11.8 @jira.link.relates_to.NOV-201242 @mobile @no_automatable
  @smoke
  Scenario Outline: A <product> user with a device with biometric capabilities and fingerprint registered in the device can access to the PIN/Biometric screen
    Given user is in the "Security And Privacy" page
      And user has a device with "biometric" capabilities
      And the device has a "Fingerprint" registered
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "pin_code_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "pin_code_switch" switch is displayed
      And the "change_pin_link" link with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_link]" text is displayed
      And the "biometric_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.biometric_switch_text]" text is displayed
      And the "biometric_access_switch" switch is displayed

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | jira_id    |
          | moves   | QANOV-6112 |

    @old_app
    Examples:
          | product | jira_id    |
          | vivobr  | QANOV-6121 |

  @jira.QANOV-451396 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @smoke @vivobr
  @har
  Scenario: A user with a device with biometric capabilities and fingerprint registered in the device can access to the PIN/Biometric screen
    Given user is in the "Security And Privacy" page
      And user has a device with "biometric" capabilities
      And the device has a "Fingerprint" registered
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "Acesso biométrico e PIN" header is displayed
      And the "pin_code_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "pin_code_description" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_description]" text is displayed
      And the "pin_code_switch" switch is displayed
      And the "change_pin_link" link with "Alterar código PIN" text is displayed
      And the "biometric_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.biometric_switch_text]" text is displayed
      And the "biometric_access_description" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.biometric_switch_description]" text is displayed
      And the "biometric_access_switch" switch is displayed

  @jira.QANOV-6117 @android @ios @jira.cv.11.8 @jira.link.parent_test_plan.QANOV-35253 @jira.link.relates_to.NOV-201242
  @mobile @no_automatable @o2uk @smoke @har
  Scenario: A MyO2 user with a device with biometric capabilities and fingerprint registered in the device can access to the PIN/Biometric screen
    other_affected_versions="2021-07"
    Given user is in the "Security And Privacy" page
      And user has a device with "biometric" capabilities
      And the device has a "Fingerprint" registered
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "pin_code_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "change_pin_link" link with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_link]" text is displayed
      And the "biometric_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.biometric_switch_text]" text is displayed
      And the "biometric_access_switch" switch is displayed

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.relates_to.NOV-201242 @mobile @no_automatable @smoke @har
  Scenario Outline: A <product> user with a device with biometric capabilities and fingerprint registered in the device can access to the PIN/Biometric screen on <client> devices
    Biometric access is named "TouchID" on iOS devices and "Fingerprint" on Android devices.
    Given user has a device with "biometric" capabilities
      And user is in the "Security And Privacy" page
      And the device has a "Fingerprint" registered
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "pin_code_title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "pin_code_description" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_description]" text is displayed
      And the "change_pin_link" link with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_link]" text is displayed
      And the "biometric_access_title" textfield with "<biometric_access_title>" text is displayed
      And the "biometric_access_description" textfield with "<biometric_access_description>" text is displayed
      And the "biometric_access_switch" switch is displayed

    Examples:
          | product | cv    | client  | biometric_access_title                                                                 | biometric_access_description                                                                  | jira_id      |
          | blaude  | 13.10 | android | [LANG:profile.security_and_privacy.biometric_pin_access.biometric_switch_text_android] | [LANG:profile.security_and_privacy.biometric_pin_access.biometric_switch_description_android] | QANOV-286641 |
          | blaude  | 13.10 | ios     | [LANG:profile.security_and_privacy.biometric_pin_access.biometric_switch_text]         | [LANG:profile.security_and_privacy.biometric_pin_access.biometric_switch_description]         | QANOV-286642 |
          | o2de    | 14.2  | android | [LANG:profile.security_and_privacy.biometric_pin_access.biometric_switch_text_android] | [LANG:profile.security_and_privacy.biometric_pin_access.biometric_switch_description_android] | QANOV-286643 |
          | o2de    | 14.2  | ios     | [LANG:profile.security_and_privacy.biometric_pin_access.biometric_switch_text]         | [LANG:profile.security_and_privacy.biometric_pin_access.biometric_switch_description]         | QANOV-286644 |

  @jira.<jira_id> @<product> @android @automatic @har @jira.cv.11.6 @jira.link.relates_to.NOV-174704 @mobile @smoke
  Scenario Outline: A user with a device without biometric capabilities can access to the PIN/Biometric screen in Android devices
    internal_checkpoint="Currently there are only Android devices without biometric capabilities"
    Given user has a device without "biometric" capabilities
      And user is in the "Security And Privacy" page
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "pin_code_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "pin_code_switch" switch is displayed
      And the "change_pin_link" link with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_link]" text is displayed
      And the "biometric_access_title" textfield is not displayed
      And the "biometric_access_description" textfield is not displayed
      And the "biometric_access_switch" switch is not displayed

    @cert2 @deprecate_profile_moves @jira.dv.Future @live @next
    Examples:
          | product | jira_id    |
          | moves   | QANOV-6198 |

    @live @next @qa @har @old_app
    Examples:
          | product | jira_id    |
          | vivobr  | QANOV-6199 |

  @jira.QANOV-451397 @android @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr
  @har
  Scenario: A user with a device without biometric capabilities can access to the PIN/Biometric screen in Android devices
    Given user has a device without "biometric" capabilities
      And user is in the "Security And Privacy" page
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "Acesso biométrico e PIN" header is displayed
      And the "pin_code_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "pin_code_description" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_description]" text is displayed
      And the "pin_code_switch" switch is displayed
      And the "change_pin_link" link with "Alterar código PIN" text is displayed
      And the "biometric_access_title" textfield is not displayed
      And the "biometric_access_description" textfield is not displayed
      And the "biometric_access_switch" switch is not displayed

  @jira.QANOV-6200 @android @automatic @cert0 @cert1 @har @jira.cv.11.6 @jira.link.parent_test_plan.QANOV-35253
  @jira.link.relates_to.NOV-174704 @live @mobile @next @o2uk @smoke
  Scenario: A MyO2 user with a device without biometric capabilities can access to the PIN/Biometric screen in Android devices
    internal_checkpoint="Currently there are only Android devices without biometric capabilities"
    other_affected_versions="2021-07"
    Given user has a device without "biometric" capabilities
      And user is in the "Security And Privacy" page
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "pin_code_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "change_pin_link" link with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_link]" text is displayed
      And the "biometric_textfield" textfield is not displayed

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-174704 @manual @mobile @smoke @har
  Scenario Outline: A <product> user with a device without biometric capabilities can access to the PIN/Biometric screen in Android devices
    Given user has a device without "biometric" capabilities
      And user is in the "Security And Privacy" page
      And the device has no fingerprint registered
     When clicks on the "biometric_pin_access_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "pin_code_title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "pin_code_description" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_description]" text is displayed
      And the "change_pin_link" link with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_link]" text is displayed
      And the "biometric_access_title" textfield is not displayed
      And the "biometric_access_description" textfield is not displayed
      And the "biometric_access_switch" switch is not displayed

    Examples:
          | product | cv    | jira_id      |
          | blaude  | 13.10 | QANOV-286645 |
          | o2de    | 14.2  | QANOV-286646 |

  @jira.<jira_id> @<product> @android @automation.hard @jira.cv.<cv> @jira.link.relates_to.NOV-47624 @manual @mobile
  @regression
  Scenario Outline: A <product> user can navigate to the "<page>" entry point in landscape mode on Android devices
     When sets the device to "landscape" orientation
      And navigates to "<page>" page
     Then the page will be displayed in "landscape" orientation
      And the display will adjust to the width of the screen
      And sets the device to "portrait" orientation

    @deprecate_profile_moves @jira.dv.Future
    Examples:
          | product | cv   | page                 | jira_id    |
          | moves   | 10.3 | Profile              | QANOV-6183 |
          | moves   | 10.3 | Security And Privacy | QANOV-6184 |
          | moves   | 10.3 | Pin Biometric        | QANOV-6185 |

    Examples:
          | product | cv    | page                 | jira_id      |
          | vivobr  | 10.3  | Profile              | QANOV-6186   |
          | vivobr  | 10.3  | Security And Privacy | QANOV-6187   |
          | vivobr  | 10.3  | Pin Biometric        | QANOV-6188   |
          | o2uk    | 10.3  | Profile              | QANOV-6189   |
          | o2uk    | 10.3  | Security And Privacy | QANOV-6190   |
          | o2uk    | 10.3  | Pin Biometric        | QANOV-6191   |
          | blaude  | 13.10 | Profile              | QANOV-286647 |
          | blaude  | 13.10 | Security And Privacy | QANOV-286648 |
          | blaude  | 13.10 | Pin Biometric        | QANOV-286649 |
          | o2de    | 14.2  | Profile              | QANOV-286650 |
          | o2de    | 14.2  | Security And Privacy | QANOV-286651 |
          | o2de    | 14.2  | Pin Biometric        | QANOV-286652 |

  @jira.QANOV-6192 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.10.3 @jira.dv.Future
  @jira.link.relates_to.NOV-47287 @live @mobile @moves @next @regression
  Scenario: Moves user can access to the service and commercial notifications management screen
    Given user is in the "App Configuration" page
     When clicks on the "notifications_management_entrypoint" entrypoint
     Then the "Notifications Management" page is displayed
      And the "service_notification_title" textfield with "Notificaciones de consumo y factura" text is displayed
      And the "service_notification_description" textfield that contains the "notificaciones de servicio a través de la app" text is displayed
      And the "service_notification_switch" switch is displayed
      And the "commercial_notification_title" textfield with "Notificaciones comerciales" text is displayed
      And the "commercial_notification_description" textfield that contains the "notificaciones comerciales de Movistar en la app" text is displayed
      And the "commercial_notification_switch" switch is displayed

  @jira.QANOV-410699 @android @ber @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A user with a device without biometric capabilities can access to the PIN/Biometric screen in Android devices
    internal_checkpoint="Currently there are only Android devices without biometric capabilities"
    Given user has a device without "biometric" capabilities
     When clicks on the "biometric_access" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "pin_code_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.pin_code_switch_text]" text is displayed
      And the "pin_code_switch" switch is displayed
      And the "change_pin_link" link with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_link]" text is displayed
      And the "biometric_access_title" textfield is not displayed
      And the "biometric_access_description" textfield is not displayed
      And the "biometric_access_switch" switch is not displayed

  @jira.QANOV-410700 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A user can access to the app notifications management screen
     When clicks on the "notifications_management_entrypoint" entrypoint
     Then the "Notifications Management" page is displayed
      And the "Ajustes de notificaciones" header is displayed
      And the "notifications_title" textfield with "Activa las notificaciones que quieres recibir" text is displayed
      And the "bill_notification_title" textfield with "Factura" text is displayed
      And the "bill_notification_description" textfield with "Recibirás una notificación cuando tengas disponible la factura." text is displayed
      And the "bill_notification_switch" switch is displayed
      And the "news_notification_title" textfield with "Novedades O2" text is displayed
      And the "news_notification_description" textfield that contains the "Recibirás una notificación sobre nuevas opciones de la app, del servicio contratado o nueves beneficios." text is displayed
      And the "news_notification_switch" switch is displayed
      And the "consumption_notification_title" textfield with "Consumo" text is displayed
      And the "consumption_notification_description" textfield that contains the "Recibirás una notificación cuando hayas consumido el 80% y el 100% de los datos." text is displayed
      And the "consumption_notification_switch" switch is displayed

  @jira.QANOV-410701 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: An admin-light user can not toggle the bill notification switch: Escalation page is displayed
    Given user has a "admin-light" role
     When clicks on the "notifications_management_entrypoint" entrypoint
      And the "Notifications Management" page is displayed
      And clicks on the "bill_notification_switch" switch
     Then the "Login Escalation Required" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Notifications Management" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario Outline: An <user_type> user can activate/deactivate the <switch> switch
    Given user has a "<user_type>" role
      And clicks on the "notifications_management_entrypoint" entrypoint
      And the "Notifications Management" page is displayed
      And the "<switch>" switch is "<status>"
     When clicks on the "<switch>" switch
     Then the "<switch>" switch is "<new_status>"

    Examples:
          | user_tpye   | switch                          | status   | new_status | jira_id      |
          | admin       | bill_notification_switch        | enabled  | disabled   | QANOV-410702 |
          | admin       | news_notification_switch        | enabled  | disabled   | QANOV-410703 |
          | admin       | consumption_notification_switch | enabled  | disabled   | QANOV-410704 |
          | admin       | bill_notification_switch        | disabled | enabled    | QANOV-410705 |
          | admin       | news_notification_switch        | disabled | enabled    | QANOV-410706 |
          | admin       | consumption_notification_switch | disabled | enabled    | QANOV-410707 |
          | admin-light | news_notification_switch        | enabled  | disabled   | QANOV-410708 |
          | admin-light | consumption_notification_switch | enabled  | disabled   | QANOV-410709 |
          | admin-light | news_notification_switch        | disabled | enabled    | QANOV-410710 |
          | admin-light | consumption_notification_switch | disabled | enabled    | QANOV-410711 |

  @jira.<jira_id> @<product> @android @automatable @jira.cv.14.9 @manual @mobile @smoke @har
  Scenario Outline: As a <product> android user, I can access to screenshot configuration screen
    Given user is in the "Security And Privacy" page
     When clicks on the "screenshots_configuration_entrypoint" entrypoint
     Then the "Screenshots Configuration" page is displayed
      And the "[LANG:profile.security_and_privacy.screenshots_configuration.page_header]" header is displayed
      And the "screenshot_title" textfield that contains the "[LANG:profile.security_and_privacy.screenshots_configuration.title]" text is displayed
      And the "screenshot_message" textfield that contains the "[LANG:profile.security_and_privacy.screenshots_configuration.message]" text is displayed
      And the "screenshot_switch" switch is displayed
      And the "screenshot_description" textfield that contains the "[LANG:profile.security_and_privacy.screenshots_configuration.description]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Security And Privacy" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-453811 |
          | o2de    | QANOV-453812 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can close a feedback message
    Feedback message appears when changing/deleting profile avatar, managing sessions, activate/change PIN...
    Given the "feedback" element is on display
     When clicks on the "feedback.close_button" button
     Then the "feedback" element is not on display

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv    | jira_id      |
          | moves   | 14.10 | QANOV-489982 |

    Examples:
          | product | cv     | jira_id      |
          | o2uk    | 14.10  | QANOV-489983 |
          | o2de    | 14.10  | QANOV-489984 |
          | blaude  | 14.10  | QANOV-489985 |
          | o2es    | Future | QANOV-489986 |

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv    | jira_id      |
          | vivobr  | 14.10 | QANOV-489987 |

  @jira.QANOV-578760 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @smoke
  Scenario: Moves user with PIN activated can access the Pin Biometric entrypoint
     When clicks on the "pin_biometric_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "PIN/Acceso biométrico" header is displayed
      And the "pin_code_switch" switch is enabled

  @jira.QANOV-578761 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: Moves user with PIN deactivated can access the Pin Biometric entrypoint
     When clicks on the "pin_biometric_entrypoint" entrypoint
     Then the "Pin Biometric" page is displayed
      And the "PIN/Acceso biométrico" header is displayed
      And the "pin_code_switch" switch is disabled
