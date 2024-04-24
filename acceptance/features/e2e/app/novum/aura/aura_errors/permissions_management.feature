# -*- coding: utf-8 -*-
@jira.QANOV-6556
Feature: Permissions management

  Actions Before the Feature:
    Given user has the Aura feature

  Actions After the Feature:
     Then clicks on the "close_aura" button
      And user is in the "Support" page


  @jira.QANOV-6582 @o2uk @android @automatic @jira.cv.11.2 @jira.link.relates_to.NOV-23110 @mobile @regression @cert0 @cert1
  @live @next
  Scenario: Aura notifies user when microphone permission is disabled in Android devices
    internal_checkpoint="To disable the permission in Android: o to Settings > Applications > Open the application under test > Tap Permissions > Disable Microphone settings."
    Given user has "denied" "microphone" permissions
      And terminates the app
      And launches the app
      And initiate the app
      And user is in the "Aura" page
      And user has a "postpay" account type
     When clicks on the "speech_button" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Aura" page is displayed
      And the "aura_error_message" textfield with "[LANG:aura.general.no_microphone_permission_response]" text is displayed
      And the "aura_error_button" button with "[LANG:aura.general.go_to_settings_button]" text is displayed
      And clicks on the "close_aura" button
      And the "Support" page is displayed

  @jira.QANOV-6585 @o2uk @automatic @ios @jira.cv.11.2 @jira.link.relates_to.NOV-23110 @mobile @regression @cert0 @cert1 @live
  @next
  Scenario: Aura notifies user when microphone permission is disabled in iOS devices
    internal_checkpoint="To disable the permission in iOS: go to Settings > Privacy > Microphone > Disable micro for application under test"
    Given user has "denied" "microphone" permissions
      And launches the app
      And initiate the app
      And user is in the "Aura" page
      And user has a "postpay" account type
     When clicks on the "speech_button" button
     Then the "aura_error_message" textfield with "[LANG:aura.general.no_microphone_permission_response_ios]" text is displayed
      And the "aura_error_button" button with "[LANG:aura.general.go_to_settings_button]" text is displayed

  @jira.QANOV-49065 @o2uk @automatic @ios @jira.cv.12.0 @mobile @regression @cert0 @cert1 @live @next @har
  Scenario: User can grant microphone permission in Aura in iOS devices
    internal_checkpoint="App should be deleted to test the Permission Popup on iOS as the first time user uses the app"
    Given uninstalls the app
      And installs the app from the "AppStore"
      And launches the app
      And initiate the app
      And set environment, disable app rating and in-app messages
      And user is logged in
      And user is in the "Aura" page
      And user has a "postpay" account type
     When clicks on the "speech_button" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
      And waits "1" seconds
      And the "Aura" page is displayed
      And clicks on the "speech_button" button
      And waits until the "listening_message" element is visible
     Then the "listening_message" textfield with "[LANG:aura.general.listening_message]" text is displayed

  @jira.QANOV-6596 @o2uk @android @automatic @jira.cv.11.2 @jira.link.detects.ANDROID-9997 @mobile @regression @cert0 @cert1
  @live @next @har
  Scenario: User can grant microphone permission in Aura in Android devices
    internal_checkpoint="To disable the permission in Android: o to Settings > Applications > Open the application under test > Tap Permissions > Disable Microphone settings."
    Given user has "denied" "microphone" permissions
      And terminates the app
      And launches the app
      And initiate the app
      And user is in the "Aura" page
      And user has a "postpay" account type
     When clicks on the "speech_button" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Aura" page is displayed
     Then the "listening_message" textfield with "[LANG:aura.general.listening_message]" text is displayed

  @jira.QANOV-6589 @o2uk @android @automatic @jira.cv.11.2 @mobile @regression @cert0 @cert1 @live @next @har
  Scenario: User can go to the settings from Aura when microphone permission is disabled in Android devices
    internal_checkpoint="To disable the permission in Android: o to Settings > Applications > Open the application under test > Tap Permissions > Disable Microphone settings."
    Given user has "denied" "microphone" permissions
      And launches the app
      And initiate the app
      And user is in the "Aura" page
      And user has a "postpay" account type
     When clicks on the "speech_button" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
      And the "Aura" page is displayed
      And clicks on the "aura_error_button" button
     Then the "App Details" page is displayed

  @jira.QANOV-6592 @o2uk @automatic @ios @jira.cv.11.2 @mobile @regression @cert0 @cert1 @live @next @har
  Scenario: User can go to the settings from Aura when microphone permission is disabled in iOS devices
    internal_checkpoint="To disable the permission in iOS: go to Settings > Privacy > Microphone > Disable micro for application under test"
    Given user has "denied" "microphone" permissions
      And terminates the app
      And launches the app
      And initiate the app
      And user is in the "Aura" page
      And user has a "postpay" account type
     When clicks on the "speech_button" button
      And clicks on the "aura_error_button" button
     Then the "App Details" page is displayed

  @jira.QANOV-6599 @o2uk @automation.hard @ios @jira.cv.9.16 @jira.link.relates_to.NOV-25248 @manual @mobile
  @regression
  Scenario: User is notified when dictation is disabled in iOS devices
    internal_checkpoint=" - Disable Siri: Settings > Siri & Search and disable the checks
    - Disable dictation: Settings > General > Keyboard > Dictation"
    Given user is in the "Aura" page
      And user has a "postpay" account type
      And Siri is in "disabled" status
      And dictation is in "disabled" status
     When clicks on the "speech_button" button
     Then the "response_description" textfield with "[LANG:aura.general.dictation_disabled_response]" text is displayed
