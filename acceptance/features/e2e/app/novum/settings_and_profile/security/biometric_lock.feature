# -*- coding: utf-8 -*-
@jira.QANOV-7839
Feature: Biometric lock

  Actions Before each Scenario:
    Given user is in the "Pin Biometric" page


  @jira.<jira_id> @<product> @android @har @ios @jira.cv.11.8 @jira.link.relates_to.NOV-47585 @mobile @no_automatable
  @sanity
  Scenario Outline: A <product> user who enabled the PIN can enable the Biometric access in a device with biometric capabilities and a fingerprint registered
    internal_checkpoint="in IOS firgerprint capability is TouchID"
    commented_tags="@depends_on.NOV-47572 @depends_on.NOV-107725"
    Given user has a device with "biometric" capabilities
      And the device has a "FingerPrint" registered
      And user accepted biometrics when logging in for the first time
      And user has "PIN" feature "enabled" in the application
      And "Biometric access" feature is disabled in the app
     When clicks on the "biometric_access_switch" switch
     Then the "pin_code_switch" switch is enabled
      And the "change_pin_link" link is enabled
      And the "biometric_access_switch" switch is enabled
      And the "biometric_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.activate_biometric_feedback_text]" text is displayed
      And the "biometric_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.activate_biometric_feedback_close]" text is displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | jira_id    |
          | vivobr  | QANOV-7840 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | jira_id    |
          | moves   | QANOV-7844 |

  @jira.QANOV-451399 @android @ber @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @sanity
  @vivobr
  Scenario: Android user who enabled the PIN can enable the Biometric access in a device with biometric capabilities and a fingerprint registered
    Given user has a device with "biometric" capabilities
      And the device has a "FingerPrint" registered
      And user accepted biometrics when logging in for the first time
      And user has "PIN" feature "enabled" in the application
      And "Biometric access" feature is disabled in the app
     When clicks on the "biometric_access_switch" switch
     Then the "biometric_access_switch" switch is enabled
      And the "biometric_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.activate_biometric_feedback_text]" text is displayed
      And the "biometric_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.activate_biometric_feedback_close]" text is displayed

  @jira.QANOV-451400 @ber @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @sanity
  @vivobr
  Scenario: iOS user who enabled the PIN can enable the Biometric access in a device with biometric capabilities and a fingerprint registered
    Given user has a device with "biometric" capabilities
      And the device has a "FingerPrint" registered
      And user accepted biometrics when logging in for the first time
      And user has "PIN" feature "enabled" in the application
      And "Biometric access" feature is disabled in the app
     When clicks on the "biometric_access_switch" switch
     Then the "biometric_access_switch" switch is enabled
      And the "biometric_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.activate_biometric_feedback_text]" text is displayed
      And the "biometric_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.activate_biometric_feedback_close]" text is displayed

  @jira.QANOV-7841 @android @har @ios @jira.cv.11.8 @jira.link.relates_to.NOV-47585 @mobile @no_automatable @o2uk @sanity
  Scenario: A MyO2 user can enable the Biometric access in a device with biometric capabilities and a fingerprint registered
    internal_checkpoint="in IOS firgerprint capability is TouchID"
    commented_tags="@depends_on.NOV-47572 @depends_on.NOV-107725"
    Given user has a device with "biometric" capabilities
      And the device has a "FingerPrint" registered
      And user accepted biometrics when logging in for the first time
      And user has "PIN" feature "enabled" in the application
     When clicks on the "biometric_access" switch
     Then the "pin_code" switch is not displayed
      And the "change_pin" link is enabled
      And the "biometric_access" switch is enabled
      And the "biometric_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.activate_biometric_feedback_text]" text is displayed
      And the "biometric_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.activate_biometric_feedback_close]" text is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @sanity @har
  Scenario Outline: A <product> user can enable the Biometric access in a device with biometric capabilities and a fingerprint registered
    Biometric access is named "TouchID" on iOS devices and "Fingerprint" on Android devices.
    Given user has a device with "biometric" capabilities
      And the device has a "FingerPrint" registered
      And user accepted biometrics when logging in for the first time
      And user has "FingerPrint" feature "disabled" in the application
     When clicks on the "biometric_access_switch" switch
     Then the "change_pin_link" link is enabled
      And the "biometric_access_switch" switch is enabled
      And the "biometric_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.activate_biometric_feedback_text]" text is displayed
      And the "biometric_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.activate_biometric_feedback_close]" text is displayed

    Examples:
          | product | cv    | jira_id      |
          | blaude  | 13.10 | QANOV-286655 |
          | o2de    | 14.2  | QANOV-286656 |

  @jira.QANOV-410720 @android @ios @jira.cv.14.10 @mobile @no_automatable @o2es @sanity
  Scenario: User who enabled the PIN can enable the Biometric access in a device with biometric capabilities and a fingerprint registered
    internal_checkpoint="in IOS firgerprint capability is TouchID"
    Given user has a device with "biometric" capabilities
      And the device has a "FingerPrint" registered
      And user accepted biometrics when logging in for the first time
      And user has "PIN" feature "enabled" in the application
      And "Biometric access" feature is disabled in the app
     When clicks on the "biometric_access_switch" switch
     Then the "pin_code_switch" switch is enabled
      And the "change_pin_link" link is enabled
      And the "biometric_access_switch" switch is enabled
      And the "biometric_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.activate_biometric_feedback_text]" text is displayed
      And the "biometric_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.activate_biometric_feedback_close]" text is displayed

  @jira.<jira_id> @<product> @har @ios @jira.cv.14.11 @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @no_automatable @sanity
  Scenario Outline: A <product> user who rejected biometrics when logging for the first time can enable the Biometric access in a device with biometric capabilities and a <biometric_type> registered on iOS devices
    Biometric access is named "TouchID" or "FaceID" on iOS devices. The biometrics are rejected after the PIN configuration in first login.
    Note that to enable biometrics the user must have the PIN configured before
    Given user has a device with "biometric" capabilities
      And the device has a "<biometric_type>" registered
      And user rejected biometrics when logging in for the first time
      And user has "<biometric_type>" feature "disabled" in the application
     When clicks on the "biometric_access_switch" switch
     Then the "biometric_access_switch" switch is disabled
      And the "biometric_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.<text>]" text is displayed
      And the "biometric_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.activate_settings_biometric_feedback_button]" text is displayed

    Examples:
          | product | biometric_type | text                                              | parent_test_plan | jira_id      |
          | blaude  | FaceID         | activate_settings_biometric_faceid_feedback_text  |                  | QANOV-500359 |
          | blaude  | FingerPrint    | activate_settings_biometric_touchid_feedback_text |                  | QANOV-500360 |
          | o2de    | FaceID         | activate_settings_biometric_faceid_feedback_text  |                  | QANOV-500361 |
          | o2de    | FingerPrint    | activate_settings_biometric_touchid_feedback_text |                  | QANOV-500362 |
          | o2es    | FaceID         | activate_settings_biometric_faceid_feedback_text  |                  | QANOV-532037 |
          | o2es    | FingerPrint    | activate_settings_biometric_touchid_feedback_text |                  | QANOV-532038 |
          | moves   | FaceID         | activate_settings_biometric_faceid_feedback_text  | QANOV-525498     | QANOV-532039 |
          | moves   | FingerPrint    | activate_settings_biometric_touchid_feedback_text | QANOV-525498     | QANOV-532040 |
          | vivobr  | FaceID         | activate_settings_biometric_faceid_feedback_text  |                  | QANOV-532041 |
          | vivobr  | FingerPrint    | activate_settings_biometric_touchid_feedback_text |                  | QANOV-532042 |
          | blaude  | FaceID         | activate_settings_biometric_faceid_feedback_text  |                  | QANOV-500359 |
          | blaude  | FingerPrint    | activate_settings_biometric_touchid_feedback_text |                  | QANOV-500360 |
          | o2de    | FaceID         | activate_settings_biometric_faceid_feedback_text  |                  | QANOV-500361 |
          | o2de    | FingerPrint    | activate_settings_biometric_touchid_feedback_text |                  | QANOV-500362 |

  @jira.<jira_id> @<product> @e2e @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A <product> user who hasn't set up the pin cannot enable the biometric switch on iOS devices
    Given user has a device with "biometric" capabilities
      And the device has a "biometric" registered
      And user rejected biometrics when logging in for the first time
      And user has "PIN" feature "disabled" in the application
     When clicks on the "biometric_access" switch
     Then the "biometric_access" switch is disabled

    Examples:
          | product | jira_id      |
          | moves   | QANOV-578636 |
          | o2es    | QANOV-578637 |
          | vivobr  | QANOV-578638 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.11.8 @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-47576 @mobile @no_automatable @smoke
  Scenario Outline: A <product> user with optional pin can disable the Biometric access in a device with biometric capabilities and a fingerprint registered
    internal_checkpoint="in IOS firgerprint capability is TouchID"
    Given user has a device with "biometric" capabilities
      And the device has a "FingerPrint" registered
      And user accepted biometrics when logging in for the first time
      And user has "PIN" feature "enabled" in the application
      And "Biometric access" feature is enabled in the app
     When clicks on the "biometric_access_switch" switch
     Then the "pin_code_switch" switch is enabled
      And the "change_pin_link" link is enabled
      And the "biometric_access_switch" switch is disabled
      And the "biometric_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.deactivate_biometric_feedback_text]" text is displayed
      And the "biometric_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.deactivate_biometric_feedback_close]" text is displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | depends_on | jira_id    |
          | vivobr  | QANOV-7840 | QANOV-7846 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | depends_on | jira_id    |
          | moves   | QANOV-7844 | QANOV-7849 |

  @jira.QANOV-7848 @android @har @ios @jira.cv.11.8 @jira.link.depends_on.QANOV-7841 @jira.link.relates_to.NOV-47576
  @mobile @no_automatable @o2uk @smoke
  Scenario: A MyO2 user can disable the Biometric access in a device with biometric capabilities and a fingerprint registered
    internal_checkpoint="in IOS firgerprint capability is TouchID"
    Given user has a device with "biometric" capabilities
      And the device has a "FingerPrint" registered
      And user accepted biometrics when logging in for the first time
      And user has "PIN" feature "enabled" in the application
      And "Biometric access" feature is enabled in the app
     When clicks on the "biometric_access" switch
     Then the "pin_code" switch is not displayed
      And the "change_pin" link is enabled
      And the "biometric_access" switch is disabled
      And the "biometric_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.deactivate_biometric_feedback_text]" text is displayed
      And the "biometric_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.deactivate_biometric_feedback_close]" text is displayed

  @jira.QANOV-410721 @android @ios @jira.cv.Future @mobile @no_automatable @o2es @smoke
  Scenario: A o2es user can disable the Biometric access in a device with biometric capabilities and a fingerprint registered
    internal_checkpoint="in IOS firgerprint capability is TouchID"
    Given user has a device with "biometric" capabilities
      And the device has a "FingerPrint" registered
      And user accepted biometrics when logging in for the first time
      And user has "PIN" feature "enabled" in the application
      And "Biometric access" feature is enabled in the app
     When clicks on the "biometric_access_switch" switch
     Then the "pin_code_switch" switch is enabled
      And the "change_pin_link" link is enabled
      And the "biometric_access_switch" switch is disabled
      And the "biometric_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.deactivate_biometric_feedback_text]" text is displayed
      And the "biometric_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.deactivate_biometric_feedback_close]" text is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @smoke @har
  Scenario Outline: A <product> user can disable the Biometric access in a device with biometric capabilities and a fingerprint registered
    Biometric access is named "TouchID" on iOS devices and "Fingerprint" on Android devices.
    Given user has a device with "biometric" capabilities
      And the device has a "FingerPrint" registered
      And user accepted biometrics when logging in for the first time
      And user has "FingerPrint" feature "enabled" in the application
     When clicks on the "biometric_access_switch" switch
     Then the "change_pin_link" link is enabled
      And the "biometric_access_switch" switch is disabled
      And the "biometric_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.deactivate_biometric_feedback_text]" text is displayed
      And the "biometric_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.deactivate_biometric_feedback_close]" text is displayed

    Examples:
          | product | cv    | jira_id      |
          | blaude  | 13.10 | QANOV-286657 |
          | o2de    | 14.2  | QANOV-286658 |
