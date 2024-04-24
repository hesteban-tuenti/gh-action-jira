# -*- coding: utf-8 -*-
@jira.QANOV-7863
Feature: Change Pin

  Actions Before each Scenario:
    Given user is in the "Pin Biometric" page

  Actions After the Feature:
     Then user has "PIN" feature "disabled" in the application


  @jira.QANOV-7994 @android @har @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves @smoke
  Scenario: An Android user can access to the App Pin Code screen
    Given user has "PIN" feature "disabled" in the application
     When clicks on the "pin_code_switch" switch
     Then the "App Pin Code" page is displayed
      And the "title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.create_pin]" textfield is displayed
      And the "set_your_pin_subtitle" textfield is not displayed
      And the "pin_placeholder" element is on display
      And the "numbers_keyboard" element is on display

  @jira.QANOV-451401 @android @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @smoke @vivobr @har
  Scenario: An Android user can access to the App Pin Code screen
    Given user has "PIN" feature "disabled" in the application
     When clicks on the "pin_code_switch" switch
     Then the "App Pin Code" page is displayed
      And the "title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.create_pin]" textfield is displayed
      And the "pin_placeholder" element is on display
      And the "numbers_keyboard" element is on display
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-478585 @har @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves @smoke
  Scenario: An iOS user can access to the App Pin Code screen
    Given user has "PIN" feature "disabled" in the application
     When clicks on the "pin_code_switch" switch
     Then the "App Pin Code" page is displayed
      And the "title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.create_pin]" textfield is displayed
      And the "set_your_pin_subtitle" textfield with "[LANG:launch_app.app_pin_code.set_pin_subtitle]" text is displayed
      And the "pin_placeholder" element is on display
      And the "numbers_keyboard" element is on display
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-451402 @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @smoke @vivobr @har
  Scenario: An iOS user can access to the App Pin Code screen
    Given user has "PIN" feature "disabled" in the application
     When clicks on the "pin_code_switch" switch
     Then the "App Pin Code" page is displayed
      And the "title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.create_pin]" textfield is displayed
      And the "pin_placeholder" element is on display
      And the "numbers_keyboard" element is on display
      And the "navigation_top_bar.close_button" button is displayed

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.<cv> @jira.link.relates_to.NOV-201247 @manual @mobile @smoke
  Scenario Outline: A user can enable the PIN in a device with biometric capabilities and No fingerprint registered
    commented_tags="@depends_on.NOV-201245"
    Given user has a device with "biometric" capabilities
      And the device has no fingerprint registered
      And user has "PIN" feature "disabled" in the application
     When clicks on the "pin_code_switch" switch
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "Pin Biometric" page is displayed
      And the "pin_code_switch" switch is enabled
      And the "pin_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.create_pin_feedback_text]" text is displayed
      And the "pin_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.create_pin_feedback_close]" text is displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 11.8 | QANOV-7999 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv   | jira_id    |
          | moves   | 11.8 | QANOV-8002 |

    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-410777 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.11.8 @jira.link.detects.IOS-7288 @jira.link.relates_to.NOV-47577
  @mobile @no_automatable @smoke
  Scenario Outline: A user can enable the PIN in a device with biometric capabilities and a fingerprint registered
    commented_tags="@depends_on.NOV-174704"
    Given user has a device with "biometric" capabilities
      And the device has a "FingerPrint" registered
      And user has "PIN" feature "disabled" in the application
     When clicks on the "pin_code_switch" switch
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "Popup Set FingerPrint" popup is displayed
      And clicks on the "not_now" button
     Then the "Pin Biometric" page is displayed
      And the "pin_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.create_pin_feedback_text]" text is displayed
      And the "pin_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.create_pin_feedback_close]" text is displayed
      And the "pin_code_switch" switch is enabled
      And the "change_pin_link" link is enabled
      And the "biometric_access_switch" switch is disabled

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 11.8 | QANOV-8005 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv   | jira_id    |
          | moves   | 11.8 | QANOV-8007 |

    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-410778 |

  @jira.<jira_id> @<product> @android @har @jira.cv.<cv> @jira.link.relates_to.NOV-47572 @mobile @no_automatable @sanity
  Scenario Outline: User can enable the PIN and Biometric access in a device with biometric capabilities and a fingerprint registered in Android devices
    commented_tags="@depends_on.NOV-201242"
    Given user has a device with "biometric" capabilities
      And the device has a "FingerPrint" registered
      And user has "PIN" feature "disabled" in the application
     When clicks on the "pin_code_switch" switch
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "Popup Set FingerPrint" popup is displayed
      And puts the fingerprint in the device fingerprint reader
     Then the "Pin Biometric" page is displayed
      And the "pin_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.create_pin_feedback_text]" text is displayed
      And the "pin_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.create_pin_feedback_close]" text is displayed
      And the "pin_code_switch" switch is enabled
      And the "change_pin_link" link is enabled
      And the "biometric_access_switch" switch is enabled

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 11.8 | QANOV-8009 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv   | jira_id    |
          | moves   | 11.8 | QANOV-8010 |

    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-410779 |

  @jira.<jira_id> @<product> @har @ios @jira.cv.<cv> @jira.link.relates_to.NOV-107725 @mobile @no_automatable @sanity
  Scenario Outline: User can enable the PIN and Biometric access in a device with biometric capabilities and a fingerprint registered in iOS devices
    commented_tags="@depends_on.NOV-201242"
    Given user has a device with "biometric" capabilities
      And the device has a "FingerPrint" registered
      And user has "PIN" feature "disabled" in the application
     When clicks on the "pin_code_switch" switch
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "Popup Set FingerPrint" popup is displayed
      And clicks on the "activate_fingerprint" button
     Then the "Pin Biometric" page is displayed
      And the "pin_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.create_pin_feedback_text]" text is displayed
      And the "pin_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.create_pin_feedback_close]" text is displayed
      And the "pin_code_switch" switch is enabled
      And the "change_pin_link" link is enabled
      And the "biometric_access_switch" switch is enabled

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 11.8 | QANOV-8012 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv   | jira_id    |
          | moves   | 11.8 | QANOV-8013 |

    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-410780 |

  @jira.<jira_id> @<client> @<execution_mode> @<product> @jira.cv.<cv> @jira.link.detects.IOS-6582
  @jira.link.relates_to.NOV-107725 @mobile @regression
  Scenario Outline: User who enabled the PIN will see the link to change it enabled
    Given user has "PIN" feature "enabled" in the application
     Then the "change_pin_link" link is enabled

    @jira.link.parent_test_plan.QANOV-437387 @live @next @qa
    Examples:
          | client  | execution_mode | product | cv   | jira_id      |
          | android | automatic      | vivobr  | 11.8 | QANOV-106793 |
          | ios     | manual         | vivobr  | 11.8 | QANOV-106796 |

    @cert2 @jira.link.parent_test_plan.QANOV-525498 @live @next
    Examples:
          | client  | execution_mode | product | cv   | jira_id      |
          | android | automatic      | moves   | 11.8 | QANOV-106794 |
          | ios     | manual         | moves   | 11.8 | QANOV-106795 |

    Examples:
          | client  | execution_mode | product | cv     | jira_id      |
          | android | manual         | o2es    | Future | QANOV-410781 |
          | ios     | manual         | o2es    | Future | QANOV-410782 |

  @jira.<jira_id> @<client> @<execution_mode> @<product> @jira.cv.<cv> @jira.link.detects.IOS-6582
  @jira.link.relates_to.NOV-107725 @mobile @regression
  Scenario Outline: User who disabled the PIN will see the link to change it disabled
    Given user has "PIN" feature "disabled" in the application
     Then the "change_pin_link" link is disabled

    @jira.link.parent_test_plan.QANOV-437387 @live @next @qa
    Examples:
          | client  | execution_mode | product | cv   | jira_id      |
          | android | automatic      | vivobr  | 11.8 | QANOV-106797 |
          | ios     | manual         | vivobr  | 11.8 | QANOV-106800 |

    @cert2 @jira.link.parent_test_plan.QANOV-525498 @live @next
    Examples:
          | client  | execution_mode | product | cv   | jira_id      |
          | android | automatic      | moves   | 11.8 | QANOV-106798 |
          | ios     | manual         | moves   | 11.8 | QANOV-106799 |

    Examples:
          | client  | execution_mode | product | cv     | jira_id      |
          | android | manual         | o2es    | Future | QANOV-410783 |
          | ios     | manual         | o2es    | Future | QANOV-410784 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-47189 @manual @mobile @smoke @har
  Scenario Outline: A user can change the security PIN
    internal_checkpoint="Pin is restored after changing it to be able to include it as automatic"
    commented_tags="@depends_on.NOV-47577 @depends_on.NOV-201247 @depends_on.NOV-201248"
    Given user has "PIN" feature "enabled" in the application
     When clicks on the "change_pin_link" link
      And the "App Pin Code" page is displayed
      And the "enter_your_pin_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.enter_your_pin]" text is displayed
      And inserts the current pin
      And the "set_your_pin_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.set_your_pin]" text is displayed
      And inserts the new pin
      And the "Pin Biometric" page is displayed
      And clicks on the "change_pin_link" link
      And inserts the new pin
      And inserts the current pin
     Then the "Pin Biometric" page is displayed

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | depends_on                       | cv   | jira_id    |
          | moves   | QANOV-7994:QANOV-8002:QANOV-8007 | 11.8 | QANOV-8017 |

    Examples:
          | product | depends_on | cv     | jira_id      |
          | o2es    |            | Future | QANOV-410785 |

  @jira.QANOV-8014 @android @ber @ios @jira.cv.11.8 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.parent_test_plan.QANOV-437387 @mobile @smoke @vivobr @har
  Scenario: A user can change the security PIN
    Given user has "PIN" feature "enabled" in the application
     When clicks on the "change_pin_link" link
      And the "App Pin Code" page is displayed
      And the "enter_your_pin_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.enter_your_pin]" text is displayed
      And inserts the current pin
      And the "set_your_pin_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.set_your_pin]" text is displayed
      And the "set_your_pin_subtitle" textfield is not displayed
      And inserts the new pin
      And the "Pin Biometric" page is displayed
      And clicks on the "change_pin_link" link
      And inserts the new pin
      And inserts the current pin
     Then the "Pin Biometric" page is displayed

  @jira.QANOV-519050 @android @ber @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @smoke @vivobr @har
  Scenario: A user can disabled the security PIN
    Given user has "PIN" feature "enabled" in the application
     When clicks on the "pin_code_switch" switch
     Then the "Pin Biometric Disabled" page is displayed
      And the "enter_your_pin_textfield" textfield with "Insira o código PIN" text is displayed
      And the "pin_placeholder" element is on display
      And the "forget_pin_link" link with "Esqueci o meu código PIN ›" text is displayed
      And the "numbers_keyboard" element is on display
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-8015 @android @har @ios @jira.cv.11.8 @jira.link.detects.ANDROID-10516 @jira.link.detects.APPS-7362
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-47189 @live @manual @mobile @next @o2uk @sanity
  Scenario: A MyO2 user can change the security PIN
    internal_checkpoint="Pin is restored after changing it to be able to include it as automatic"
     When clicks on the "change_pin_link" link
      And the "App Pin Code" page is displayed
      And the "enter_your_pin_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.enter_your_pin]" text is displayed
      And inserts the current pin
      And the "set_your_pin_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.set_your_pin]" text is displayed
      And the "set_your_pin_subtitle" textfield is not displayed
      And inserts the new pin
      And the "Pin Biometric" page is displayed
      And clicks on the "change_pin_link" link
      And inserts the new pin
      And inserts the current pin
     Then the "Pin Biometric" page is displayed
      And the "pin_activated_text" warning with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_feedback_text]" text is displayed
      And the "pin_activated_cta" button with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_feedback_close]" text is displayed

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @sanity @har
  Scenario Outline: A <product> user can change the security PIN
    PIN is restored after changing it to be able to include it as automatic.
     When clicks on the "change_pin_link" link
      And the "App Pin Code" page is displayed
      And the "enter_your_pin_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.enter_your_pin]" text is displayed
      And inserts the current pin
      And the "set_your_pin_textfield" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.set_your_pin]" text is displayed
      And the "set_your_pin_subtitle" textfield is not displayed
      And inserts the new pin
      And the "Pin Biometric" page is displayed
      And clicks on the "change_pin_link" link
      And inserts the new pin
      And inserts the current pin
     Then the "Pin Biometric" page is displayed
      And the "warning.text" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_feedback_text]" text is displayed
      And the "warning.button" button with "[LANG:profile.security_and_privacy.biometric_pin_access.change_pin_feedback_close]" text is displayed

    @cert3 @live @next
    Examples:
          | product | cv    | jira_id      |
          | blaude  | 13.10 | QANOV-286659 |

    @cert2 @live @next
    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-286660 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.11.8 @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-201250 @mobile @smoke
  Scenario Outline: A user can disable the PIN in a device with biometric capabilities and No fingerprint registered
    commented_tags="@depends_on.NOV-201247"
    Given user has a device with "biometric" capabilities
      And the device has no fingerprint registered
      And user has "PIN" feature "enabled" in the application
     When clicks on the "pin_code_switch" switch
      And the "App Pin Code" page is displayed
      And inserts the current pin
     Then the "Pin Biometric" page is displayed
      And the "pin_code_switch" switch is disabled

    @automatic @jira.link.parent_test_plan.QANOV-437387 @live @next @qa
    Examples:
          | product | depends_on | cv   | jira_id    |
          | vivobr  | QANOV-7999 | 11.8 | QANOV-8020 |

    @automatic @cert2 @jira.link.parent_test_plan.QANOV-525498 @live @next
    Examples:
          | product | depends_on | cv   | jira_id    |
          | moves   | QANOV-8002 | 11.8 | QANOV-8022 |

    @manual
    Examples:
          | product | depends_on | cv     | jira_id      |
          | o2es    |            | Future | QANOV-410787 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-201252 @mobile @no_automatable @smoke
  Scenario Outline: A user can disable the PIN in a device with biometric capabilities and a fingerprint registered when the biometric access is disabled
    commented_tags="@depends_on.NOV-47577"
    Given user has a device with "biometric" capabilities
      And the device has a "Fingerprint" registered
      And user has "PIN" feature "enabled" in the application
      And user has "Biometric" feature "disabled" in the application
     When clicks on the "pin_code_switch" switch
      And the "App Pin Code" page is displayed
      And inserts the current pin
     Then the "Pin Biometric" page is displayed
      And the "pin_code_switch" switch is disabled
      And the "change_pin_link" link is disabled
      And the "biometric_access_switch" switch is disabled

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | depends_on | cv   | jira_id    |
          | vivobr  | QANOV-8005 | 11.8 | QANOV-8023 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | depends_on | cv   | jira_id    |
          | moves   | QANOV-8007 | 11.8 | QANOV-8024 |

    Examples:
          | product | depends_on | cv     | jira_id      |
          | o2es    |            | Future | QANOV-410788 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.relates_to.NOV-47583 @manual @mobile @regression
  Scenario Outline: A user who skips the PIN enabling will see a confirmation popup
    commented_tags="@depends_on.NOV-174704 @depends_on.NOV-201242 @depends_on.NOV-201245"
    Given user has "PIN" feature "disabled" in the application
     When clicks on the "pin_code_switch" switch
      And the "App Pin Code" page is displayed
      And "<step>"
     Then the "Popup Skip Pin" popup is displayed
      And the "popup.title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_title]" text is displayed
      And the "popup.message" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_body]" text is displayed
      And the "popup.accept" button with "<accept_text>" text is displayed
      And the "popup.cancel" button with "<cancel_text>" text is displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | client  | step                                                   | accept_text                                                                                   | cancel_text                                                                                   | cv   | jira_id     |
          | vivobr  | android | clicks on the native "back" button                     | [LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_accept_android] | [LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_cancel_android] | 11.8 | QANOV-8025  |
          | vivobr  | ios     | clicks on the "navigation_top_bar.close_button" button | [LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_accept_ios]     | [LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_cancel_ios]     | 11.8 | QANOV-67196 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | client  | step                                                   | accept_text                                                                                   | cancel_text                                                                                   | cv    | jira_id     |
          | moves   | android | clicks on the native "back" button                     | [LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_accept_android] | [LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_cancel_android] | 11.8  | QANOV-8027  |
          | moves   | android | clicks on the "navigation_top_bar.close_button" button | [LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_accept_android] | [LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_cancel_android] | 14.11 | QANOV-8027  |
          | moves   | ios     | clicks on the "navigation_top_bar.close_button" button | [LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_accept_ios]     | [LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_cancel_ios]     | 11.8  | QANOV-67198 |

    Examples:
          | product | client  | step                                                   | accept_text                                                                                   | cancel_text                                                                                   | cv     | jira_id      |
          | o2es    | android | clicks on the native "back" button                     | [LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_accept_android] | [LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_cancel_android] | Future | QANOV-410789 |
          | o2es    | ios     | clicks on the "navigation_top_bar.close_button" button | [LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_accept_ios]     | [LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_cancel_ios]     | Future | QANOV-410790 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: An ios user who cancels the PIN enabling by accepting the warning popup is redirected to the Pin Biometric screen and will have the PIN feature disabled
    Given user has "PIN" feature "disabled" in the application
     When clicks on the "pin_code_switch" switch
      And the "App Pin Code" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Popup Skip Pin" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Pin Biometric" page is displayed
      And the "pin_code_switch" switch is disabled

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 11.8 | QANOV-451408 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv   | jira_id    |
          | moves   | 11.8 | QANOV-8030 |

    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-410791 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: An android user who cancels the PIN enabling by accepting the warning popup is redirected to the Pin Biometric screen and will have the PIN feature disabled
    Given user has "PIN" feature "disabled" in the application
     When clicks on the "pin_code_switch" switch
      And the "App Pin Code" page is displayed
      And clicks on the native "back" button
      And the "Popup Skip Pin" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Pin Biometric" page is displayed
      And the "pin_code_switch" switch is disabled

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 11.8 | QANOV-478586 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv   | jira_id      |
          | moves   | 11.8 | QANOV-478587 |

    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-478588 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: An ios user who cancels the PIN enabling and rejects the confirmation popup remains in the App Pin Code screen
    internal_checkpoint="In order to continue the execution of automatic scenarios, the flow to go out from the App Pin
    Code screen has been added"
    commented_tags="@depends_on.NOV-47583"
    Given user has "PIN" feature "disabled" in the application
     When clicks on the "pin_code_switch" switch
      And the "App Pin Code" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Popup Skip Pin" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "App Pin Code" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Popup Skip Pin" popup is displayed
      And clicks on the "popup.accept" button
      And the "Pin Biometric" page is displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | depends_on | cv   | jira_id    |
          | vivobr  | QANOV-8025 | 11.8 | QANOV-8031 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | depends_on | cv   | jira_id    |
          | moves   | QANOV-8027 | 11.8 | QANOV-8032 |

    Examples:
          | product | depends_on | cv     | jira_id      |
          | o2es    |            | Future | QANOV-410792 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: An android user who cancels the PIN enabling and rejects the confirmation popup remains in the App Pin Code screen
    internal_checkpoint="In order to continue the execution of automatic scenarios, the flow to go out from the App Pin
    Code screen has been added"
    Given user has "PIN" feature "disabled" in the application
     When clicks on the "pin_code_switch" switch
      And the "App Pin Code" page is displayed
      And clicks on the native "back" button
      And the "Popup Skip Pin" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "App Pin Code" page is displayed
      And clicks on the native "back" button
      And the "Popup Skip Pin" popup is displayed
      And clicks on the "popup.accept" button
      And the "Pin Biometric" page is displayed

    @automatic @jira.link.parent_test_plan.QANOV-437387 @live @next @qa
    Examples:
          | product | depends_on | cv   | jira_id      |
          | vivobr  | QANOV-8025 | 11.8 | QANOV-478589 |

    @automatic @cert2 @jira.link.parent_test_plan.QANOV-525498 @live @next
    Examples:
          | product | depends_on | cv   | jira_id      |
          | moves   | QANOV-8027 | 11.8 | QANOV-478590 |

    @manual
    Examples:
          | product | depends_on | cv     | jira_id      |
          | o2es    |            | Future | QANOV-478591 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-47590 @mobile
  @regression
  Scenario Outline: A user cannot change the PIN if he/she inserts a wrong current PIN in iOS devices
    internal_checkpoint="In order to continue the execution of automatic scenarios, the flow to go out from the App Pin
    Code screen has been added"
    commented_tags="@depends_on.NOV-47577 @depends_on.NOV-201247 @depends_on.NOV-201248"
    Given user has "PIN" feature "enabled" in the application
     When clicks on the "change_pin_link" link
      And the "App Pin Code" page is displayed
      And inserts a wrong current pin
     Then the "wrong_pin_textfield" textfield with "[LANG:launch_app.app_pin_code.wrong_pin_text]" text is displayed
      And removes the wrong pin
      And inserts the current pin
      And inserts the current pin
      And the "Pin Biometric" page is displayed

    @automatic @cert2 @jira.link.parent_test_plan.QANOV-525498 @live @next
    Examples:
          | product | depends_on                       | cv   | jira_id    |
          | moves   | QANOV-7994:QANOV-8002:QANOV-8007 | 11.8 | QANOV-8037 |

    @manual
    Examples:
          | product | depends_on | cv     | jira_id      |
          | o2es    |            | Future | QANOV-410793 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-47590
  @mobile @regression
  Scenario Outline: A user cannot change the PIN if he/she inserts a wrong current PIN in Android devices
    internal_checkpoint="In order to continue the execution of automatic scenarios, the flow to go out from the App Pin
    Code screen has been added
    After issue ANDROID-9079 wrong pin text has been defined in the accessibility id field"
    commented_tags="@depends_on.NOV-47577 @depends_on.NOV-201247 @depends_on.NOV-201248"
    Given user has "PIN" feature "enabled" in the application
     When clicks on the "change_pin_link" link
      And the "App Pin Code" page is displayed
      And inserts a wrong current pin
     Then the element with accessibility text "[LANG:launch_app.app_pin_code.wrong_pin_text]" is displayed
      And removes the wrong pin
      And inserts the current pin
      And inserts the current pin
      And the "Pin Biometric" page is displayed

    @automatic @cert2 @jira.link.parent_test_plan.QANOV-525498 @live @next
    Examples:
          | product | depends_on                       | cv   | jira_id     |
          | moves   | QANOV-7994:QANOV-8002:QANOV-8007 | 11.8 | QANOV-67219 |

    @manual
    Examples:
          | product | depends_on | cv     | jira_id      |
          | o2es    |            | Future | QANOV-410794 |

  @jira.QANOV-451409 @android @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression
  @vivobr
  Scenario: A user cannot change the PIN if he/she inserts a wrong current PIN
    To continue the execution of automatic scenarios, the flow to go out from the App Pin Code screen has been added
    Given user has "PIN" feature "enabled" in the application
     When clicks on the "change_pin_link" link
      And the "App Pin Code" page is displayed
      And inserts a wrong current pin
     Then the "wrong_pin_textfield" textfield with "Código incorreto. Você tem mais 2 tentativas" text is displayed
      And inserts a wrong current pin
      And the "wrong_pin_textfield" textfield with "Código incorreto. Se tentar de novo e errar, a conta será desconectada" text is displayed
      And removes the wrong pin
      And inserts the current pin
      And the "Pin Biometric" page is displayed

  @jira.QANOV-8036 @automatic @cert0 @cert1 @har @ios @jira.cv.11.8 @jira.link.relates_to.NOV-47590 @live @mobile @next
  @o2uk @regression
  Scenario: A MyO2 user cannot change the PIN if he/she inserts a wrong current PIN in iOS devices
    internal_checkpoint="In order to continue the execution of automatic scenarios, the flow to go out from the App Pin
    Code screen has been added"
     When clicks on the "change_pin_link" link
      And the "App Pin Code" page is displayed
      And inserts a wrong current pin
     Then the "wrong_pin_textfield" textfield with "[LANG:launch_app.app_pin_code.wrong_pin_text]" text is displayed
      And removes the wrong pin
      And inserts the current pin
      And inserts the current pin
      And the "Pin Biometric" page is displayed

  @jira.QANOV-67220 @android @automatic @cert0 @cert1 @har @jira.cv.11.8 @jira.link.relates_to.NOV-47590 @live @mobile
  @next @o2uk @regression
  Scenario: A MyO2 user cannot change the PIN if he/she inserts a wrong current PIN in Android devices
    internal_checkpoint="In order to continue the execution of automatic scenarios, the flow to go out from the App Pin
    Code screen has been added
    After issue ANDROID-9079 wrong pin text has been defined in the accessibility id field"
     When clicks on the "change_pin_link" link
      And the "App Pin Code" page is displayed
      And inserts a wrong current pin
     Then the element with accessibility text "[LANG:launch_app.app_pin_code.wrong_pin_text]" is displayed
      And removes the wrong pin
      And inserts the current pin
      And inserts the current pin
      And the "Pin Biometric" page is displayed

  @jira.<jira_id> @<product> @automatic @ios @jira.cv.<cv> @mobile @regression
  Scenario Outline: A <product> user cannot change the PIN if he/she inserts a wrong current PIN on iOS devices
    In order to continue the execution of automatic scenarios, the flow to go out from the "App Pin Code" screen has
    been added.
     When clicks on the "change_pin_link" link
      And the "App Pin Code" page is displayed
      And inserts a wrong current pin
     Then the "wrong_pin_textfield" textfield with "[LANG:launch_app.app_pin_code.wrong_pin_text]" text is displayed
      And removes the wrong pin
      And inserts the current pin
      And inserts the current pin
      And the "Pin Biometric" page is displayed

    @cert3 @live @next
    Examples:
          | product | cv    | jira_id      |
          | blaude  | 13.10 | QANOV-286661 |

    @cert2 @live @next
    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-286662 |

  @jira.<jira_id> @<product> @android @automatic @jira.cv.<cv> @mobile @regression
  Scenario Outline: A <product> user cannot change the PIN if he/she inserts a wrong current PIN on Android devices
    In order to continue the execution of automatic scenarios, the flow to go out from the "App Pin Code" screen has
    been added.
     When clicks on the "change_pin_link" link
      And the "App Pin Code" page is displayed
      And inserts a wrong current pin
     Then the element with accessibility text "[LANG:launch_app.app_pin_code.wrong_pin_text]" is displayed
      And removes the wrong pin
      And inserts the current pin
      And inserts the current pin
      And the "Pin Biometric" page is displayed

    @cert3 @live @next
    Examples:
          | product | cv    | jira_id      |
          | blaude  | 13.10 | QANOV-286663 |

    @cert2 @live @next
    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-286664 |

  @jira.<jira_id> @<product> @android @automation.hard @har @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual
  @mobile @smoke
  Scenario Outline: A user who changes the PIN and inserts it 3 times wrongly will see an error popup
    commented_tags="@depends_on.NOV-174704 @depends_on.NOV-201242 @depends_on.NOV-201245"
    Given user has "PIN" feature "enabled" in the application
     When clicks on the "change_pin" link
      And the "App Pin Code" page is displayed
      And inserts "3" times a wrong current pin
     Then the "Popup Max Retries Pin" popup is displayed
      And the "title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_max_retries_pin_title]" text is displayed
      And the "message" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_max_retries_pin_message]" text is displayed
      And the "accept" button with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_max_retries_pin_accept]" text is displayed

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | depends_on                       | cv   | jira_id    |
          | moves   | QANOV-7994:QANOV-8002:QANOV-8007 | 11.8 | QANOV-8039 |

    Examples:
          | product | depends_on | cv     | jira_id      |
          | o2es    |            | Future | QANOV-410795 |

  @jira.QANOV-451410 @android @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression
  @vivobr
  Scenario: A user who changes the PIN and inserts it 3 times wrongly will see an error popup
    Given user has "PIN" feature "enabled" in the application
     When clicks on the "change_pin_link" link
      And the "App Pin Code" page is displayed
      And inserts "3" times a wrong current pin
     Then the "Popup Max Retries Pin" popup is displayed
      And the "title" textfield with "Você passou do número máximo de tentativas" text is displayed
      And the "message" textfield with "Por segurança a sua conta foi desconectada e você precisa entrar de novo" text is displayed
      And the "accept" button with "Ir para o inicio" text is displayed

  @jira.QANOV-8040 @android @automation.hard @har @ios @jira.cv.11.8 @manual @mobile @o2uk @smoke
  Scenario: A MyO2 user who changes the PIN and inserts it 3 times wrongly will see an error popup
     When clicks on the "change_pin" link
      And the "App Pin Code" page is displayed
      And inserts "3" times a wrong current pin
     Then the "Popup Max Retries Pin" popup is displayed
      And the "title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_max_retries_pin_title]" text is displayed
      And the "message" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_max_retries_pin_message]" text is displayed
      And the "accept" button with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_max_retries_pin_accept]" text is displayed

  @jira.<jira_id> @<client> @<product> @TBD @automation.hard @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user who changes the PIN and inserts it 3 times wrongly will see an error popup
     When clicks on the "change_pin_link" link
      And the "App Pin Code" page is displayed
      And inserts "3" times a wrong current pin
     Then the "Popup Max Retries Pin" popup is displayed
      And the "title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_max_retries_pin_title]" text is displayed
      And the "message" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_max_retries_pin_message]" text is displayed
      And the "accept" button with "<button_text>" text is displayed

    Examples:
          | product | cv    | client  | button_text | jira_id      |
          | blaude  | 13.10 | android | WEITER      | QANOV-286665 |
          | blaude  | 13.10 | ios     | Fortfahren  | QANOV-287460 |
          | o2de    | 14.2  | android | WEITER      | QANOV-286666 |
          | o2de    | 14.2  | ios     | Fortfahren  | QANOV-287461 |

  @jira.<jira_id> @<product> @android @automation.hard @har @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual
  @mobile @smoke
  Scenario Outline: A user who confirms the error popup after inserting 3 times a wrong PIN when changing the PIN is forced logged out
    Given user is in the "Popup Max Retries Pin" popup
     When clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | depends_on | jira_id    |
          | vivobr  | 11.8 | QANOV-8038 | QANOV-8043 |

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | cv   | depends_on | jira_id    |
          | moves   | 11.8 | QANOV-8039 | QANOV-8045 |

    Examples:
          | product | cv     | depends_on                | jira_id      |
          | o2uk    | 11.8   | QANOV-8040                | QANOV-8044   |
          | blaude  | 13.10  | QANOV-286665:QANOV-287460 | QANOV-286667 |
          | o2de    | 14.2   | QANOV-286666:QANOV-287461 | QANOV-286668 |
          | o2es    | Future |                           | QANOV-410796 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-65703 @mobile
  @regression
  Scenario Outline: A user cannot disable the PIN if he/she inserts a wrong current PIN in iOS devices
    internal_checkpoint="For Vivo due to multi-logging, the user selected in the app has to be the one with the PIN
    enabled"
    commented_tags="@depends_on.NOV-174704 @depends_on.NOV-201242 @depends_on.NOV-201245"
    Given user has "PIN" feature "enabled" in the application
     When clicks on the "pin_code_switch" switch
      And the "App Pin Code" page is displayed
      And inserts a wrong current pin
     Then the "wrong_pin_textfield" textfield with "[LANG:launch_app.app_pin_code.wrong_pin_text]" text is displayed
      And removes the wrong pin
      And inserts the current pin
      And the "Pin Biometric" page is displayed

    @automatic @cert2 @jira.link.parent_test_plan.QANOV-525498 @live @next
    Examples:
          | product | depends_on                       | cv   | jira_id    |
          | moves   | QANOV-7994:QANOV-8002:QANOV-8007 | 11.8 | QANOV-8050 |

    @manual
    Examples:
          | product | depends_on | cv     | jira_id      |
          | o2es    |            | Future | QANOV-410797 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-65703
  @mobile @regression
  Scenario Outline: A user cannot disable the PIN if he/she inserts a wrong current PIN in Android devices
    internal_checkpoint="For Vivo due to multi-logging, the user selected in the app has to be the one with the PIN
    enabled"
    commented_tags="@depends_on.NOV-174704 @depends_on.NOV-201242 @depends_on.NOV-201245"
    Given user has "PIN" feature "enabled" in the application
     When clicks on the "pin_code_switch" switch
      And the "App Pin Code" page is displayed
      And inserts a wrong current pin
     Then the element with accessibility text "[LANG:launch_app.app_pin_code.wrong_pin_text]" is displayed
      And removes the wrong pin
      And inserts the current pin
      And the "Pin Biometric" page is displayed

    @automatic @cert2 @jira.link.parent_test_plan.QANOV-525498 @live @next
    Examples:
          | product | depends_on                       | cv   | jira_id      |
          | moves   | QANOV-7994:QANOV-8002:QANOV-8007 | 11.8 | QANOV-106802 |

    @manual
    Examples:
          | product | depends_on | cv     | jira_id      |
          | o2es    |            | Future | QANOV-410798 |

  @jira.<jira_id> @<client> @<product> @automation.hard @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile
  @regression
  Scenario Outline: A user who disables the PIN and inserts it 3 times wrongly will see an error popup
    commented_tags="@depends_on.NOV-174704 @depends_on.NOV-201242 @depends_on.NOV-201245"
    Given user has "PIN" feature "enabled" in the application
     When clicks on the "pin_code_switch" switch
      And the "App Pin Code" page is displayed
      And inserts "3" times a wrong current pin
     Then the "Popup Max Retries Pin" popup is displayed
      And the "title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_max_retries_pin_title]" text is displayed
      And the "message" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_max_retries_pin_message]" text is displayed
      And the "accept" button with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_max_retries_pin_accept]" text is displayed

    @jira.link.parent_test_plan.QANOV-525498
    Examples:
          | product | client  | depends_on                       | cv   | jira_id    |
          | moves   | android | QANOV-7994:QANOV-8002:QANOV-8007 | 11.8 | QANOV-8052 |
          | moves   | ios     | QANOV-7994:QANOV-8002:QANOV-8007 | 11.8 | QANOV-8057 |

    Examples:
          | product | client  | depends_on | cv     | jira_id      |
          | o2es    | android |            | Future | QANOV-410799 |
          | o2es    | ios     |            | Future | QANOV-410800 |

  @jira.QANOV-451411 @android @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @smoke @vivobr @har
  Scenario: A user who disables the PIN and inserts it 3 times wrongly will see an error popup
    Given user has "PIN" feature "enabled" in the application
     When clicks on the "pin_code_switch" switch
      And the "App Pin Code" page is displayed
      And inserts "3" times a wrong current pin
     Then the "Popup Max Retries Pin" popup is displayed
      And the "title" textfield with "Você passou do número máximo de tentativas" text is displayed
      And the "message" textfield with "Por segurança a sua conta foi desconectada e você precisa entrar de novo" text is displayed
      And the "accept" button with "Ir para o inicio" text is displayed
