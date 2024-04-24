# -*- coding: utf-8 -*-
@jira.QANOV-8198
Feature: Network Preferences

  Actions Before each Scenario:
    Given user is in the "Security And Privacy" page


  @jira.QANOV-8199 @automatic @cert0 @cert1 @har @ios @jira.cv.11.10 @jira.link.relates_to.NOV-210116 @live @mobile @next
  @o2uk @sanity
  Scenario: A user can access to the "Network preferences" screen in iOS devices
     When clicks on the "network_preferences_entrypoint" entrypoint
     Then the "Network Preferences" page is displayed
      And the "Network preferences" header is displayed
      And the "network_optimization_module" module with "Allow network optimization" title is displayed
      And the "network_optimization_module.body_textfield" textfield with "We use data obtained from your device to optimize network performance and give you the best possible experience. More information" text is displayed
      And the "network_optimization_module.more_information_link" link with "More information" text is displayed
      And the "network_optimization_module.switch" switch is displayed
      And the "network_optimization_module.status_textfield" textfield is displayed

  @jira.QANOV-57117 @android @automatic @cert0 @cert1 @har @jira.cv.11.10 @jira.link.detects.ANDROID-9017
  @jira.link.relates_to.NOV-210116 @live @mobile @next @o2uk @sanity
  Scenario: A user can access to the "Network preferences" screen in Android devices
    More information link will be shown within the network_optimization module and cannot be retrieved through
    UI inspection
     When clicks on the "network_preferences_entrypoint" entrypoint
     Then the "Network Preferences" page is displayed
      And the "Network preferences" header is displayed
      And the "network_optimization_module" module with "Allow network optimization" title is displayed
      And the "network_optimization_module.body_textfield" textfield with "We use data obtained from your device to optimize network performance and give you the best possible experience. More information" text is displayed
      And the "network_optimization_module.switch" switch is displayed
      And the "network_optimization_module.status_textfield" textfield is displayed

  @jira.QANOV-44516 @android @automation.hard @ios @jira.cv.11.10 @jira.link.relates_to.NOV-210116 @manual @mobile @o2uk
  @regression
  Scenario: A user will see the "Network optimization" information truncated to 3 lines
     When clicks on the "network_preferences_entrypoint" entrypoint
     Then the "Network Preferences" page is displayed
      And the "network_optimization_module.body_textfield" textfield is truncated to "3" lines

  @jira.QANOV-8200 @android @automation.pending_env @har @ios @jira.cv.11.10 @jira.link.depends_on.QANOV-8199
  @jira.link.relates_to.NOV-210117 @manual @mobile @o2uk @smoke
  Scenario: A user who hasn't changed the default "Network optimization" configuration will see it accepted
    - Network optimization will be activated by default
    - Network optimization is the friendly name for the Spatial Buzz Sdk
    Given user has not changed the network optimization default configuration
     When clicks on the "network_preferences_entrypoint" entrypoint
     Then the "Network Preferences" page is displayed
      And the "network_optimization_module" module with "Allow network optimization" title is displayed
      And the "network_optimization_module.switch" switch is enabled
      And the "network_optimization_module.status_textfield" textfield with "Accepted" text is displayed
      And the "save_changes" button is not displayed

  @jira.QANOV-8201 @automatic @cert0 @cert1 @har @ios @jira.cv.11.10 @jira.link.relates_to.NOV-210118 @live @mobile @next
  @o2uk @regression
  Scenario: A user can access to the "Network optimization" more information screen in iOS devices
    Given user is in the "Network Preferences" page
     When clicks on the "network_optimization_module.more_information_link" link
     Then the internal webview is displayed
      And the "Allow network optimization" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Network Preferences" page is displayed

  @jira.QANOV-60198 @android @automatic @cert0 @cert1 @har @jira.cv.11.10 @jira.link.detects.ANDROID-9017
  @jira.link.relates_to.NOV-210118 @live @mobile @next @o2uk @regression
  Scenario: A user can access to the "Network optimization" more information screen in Android devices
    More information link will be shown within the network_optimization module and cannot be retrieved through
    UI inspection
    Given user is in the "Network Preferences" page
     When clicks on the more information link
     Then the internal webview is displayed
      And the "Allow network optimization" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Network Preferences" page is displayed

  @jira.QANOV-8204 @android @automatic @cert0 @cert1 @har @ios @jira.cv.11.10 @jira.link.depends_on.QANOV-8200
  @jira.link.relates_to.NOV-210120 @live @mobile @next @o2uk @regression
  Scenario: A user can set the "Network optimization" configuration to reject it
    Given user is in the "Network Preferences" page
      And user has the network optimization in "enabled" status
     When clicks on the "network_optimization_module.switch" switch
     Then the "network_optimization_module.status_textfield" textfield with "Rejected" text is displayed
      And the "network_optimization_module.switch" switch is disabled
      And the "save_changes" button is displayed
      And clicks on the "network_optimization_module.switch" switch

  @jira.QANOV-8205 @android @automatic @cert0 @cert1 @har @ios @jira.cv.11.10 @jira.link.detects.ANDROID-9363
  @jira.link.relates_to.NOV-210121 @live @mobile @next @o2uk @smoke
  Scenario: A user can save the "Network optimization" configuration when it has been modified
    Given user is in the "Network Preferences" page
     When clicks on the "network_optimization_module.switch" switch
      And clicks on the "save_changes" button
     Then the "Feedback Configuration" page is displayed
      And the "ok_icon" icon is displayed
      And the "feedback_textfield" textfield with "Changes correctly implemented" text is displayed
      And the "accept_button" button with "Understood" text is displayed

  @jira.QANOV-8206 @android @automatic @cert0 @cert1 @har @ios @jira.cv.11.10 @jira.link.relates_to.NOV-210122 @live
  @mobile @next @o2uk @regression
  Scenario: A user who is in the Feedback screen can go back to the "Network Preferences" screen
    Given user is in the "Network Preferences" page
     When clicks on the "network_optimization_module.switch" switch
      And clicks on the "save_changes" button
      And the "Feedback Configuration" page is displayed
      And clicks on the "accept_button" button
     Then the "Network Preferences" page is displayed
      And the "save_changes" button is not displayed

  @jira.QANOV-8207 @android @automatic @cert0 @cert1 @har @ios @jira.cv.11.10 @jira.link.relates_to.NOV-210123 @live
  @mobile @next @o2uk @regression
  Scenario: A user who can revert the "Network optimization" configuration without saving it
    Given user is in the "Network Preferences" page
     When clicks on the "network_optimization_module.switch" switch
      And the "save_changes" button is displayed
      And clicks on the "network_optimization_module.switch" switch
     Then the "save_changes" button is not displayed

  @jira.<jira_id> @<client> @automatic @cert0 @cert1 @har @jira.cv.11.10 @jira.link.relates_to.NOV-210124 @live @mobile
  @next @o2uk @regression
  Scenario Outline: A user who modified the "Network optimization" configuration will see a warning popup when leaving the screen without saving the configuration
    Given user is in the "Network Preferences" page
     When clicks on the "network_optimization_module.switch" switch
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Are You Sure Popup" popup is displayed
      And the "popup.title" textfield with "Are you sure you want to quit?" text is displayed
      And the "popup.message" textfield with "If you quit this process, your changes will not be saved" text is displayed
      And the "popup.accept" button with "<accept_text>" text is displayed
      And the "popup.cancel" button with "<cancel_text>" text is displayed

    Examples:
          | client  | accept_text                                                                               | cancel_text                                                                               | jira_id     |
          | android | [LANG:profile.security_and_privacy.network_preferences.are_you_sure_popup.accept_android] | [LANG:profile.security_and_privacy.network_preferences.are_you_sure_popup.cancel_android] | QANOV-8208  |
          | ios     | [LANG:profile.security_and_privacy.network_preferences.are_you_sure_popup.accept_ios]     | [LANG:profile.security_and_privacy.network_preferences.are_you_sure_popup.cancel_ios]     | QANOV-60199 |

  @jira.<jira_id> @android @automatic @cert0 @cert1 @har @ios @jira.cv.11.10 @jira.link.depends_on.QANOV-8208
  @jira.link.relates_to.NOV-210125 @live @mobile @next @o2uk @regression
  Scenario Outline: A user who sees a warning popup after leaving the "Network optimization" configuration screen without saving and accepts it will see the configuration with the same status
    Given user is in the "Network Preferences" page
      And user has the network optimization in "<status>" status
     When clicks on the "network_optimization_module.switch" switch
      And clicks on the "navigation_top_bar.back_button" button
      And the "Are You Sure Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Security And Privacy" page is displayed
      And clicks on the "network_preferences_entrypoint" entrypoint
      And the "Network Preferences" page is displayed
     Then the "network_optimization_module.switch" switch is <status>
      And the "network_optimization_module.status_textfield" textfield with "<status_text>" text is displayed

    Examples:
          | status   | status_text | jira_id    |
          | enabled  | Accepted    | QANOV-8209 |
          | disabled | Rejected    | QANOV-8210 |

  @jira.<jira_id> @android @automatic @cert0 @cert1 @har @ios @jira.cv.11.10 @jira.link.depends_on.QANOV-8208
  @jira.link.relates_to.NOV-210126 @live @mobile @next @o2uk @regression
  Scenario Outline: A user who sees a warning popup after leaving the "Network optimization" configuration screen without saving and rejects it will see the configuration with the unsaved value
    Given user is in the "Network Preferences" page
      And user has the network optimization in "<status_before>" status
     When clicks on the "network_optimization_module.switch" switch
      And clicks on the "navigation_top_bar.back_button" button
      And the "Are You Sure Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Network Preferences" page is displayed
      And the "save_changes" button is displayed
      And the "network_optimization_module.switch" switch is <status_after>

    Examples:
          | status_before | status_after | jira_id    |
          | enabled       | disabled     | QANOV-8212 |
          | disabled      | enabled      | QANOV-8213 |
