# -*- coding: utf-8 -*-
@jira.QANOV-427955 @not_hardening
Feature: eSIM

  Actions Before the Feature:
    Given user has an eSIM profile to install
      And user has a device with eSIM capabilities


  @jira.QANOV-427956 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-426918 @manual @mobile @sanity @vivobr
  @old_app
  Scenario: A beatrix/multivivo/convergente user that has an eSIM to install and a compatible device can access the eSIM module
    All flow is from the ob and the other pages are from native device flow
    Given user has any "beatrix;multivivo;convergente" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "snapcard_esim_card" card
      And completes the eSIM installation flow
      And user is in the "Activate Esim Device" page
      And clicks on the "activate_on_device" button
     Then the "Esim Native Installation" page is displayed

  @jira.QANOV-427957 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-426918 @manual @mobile @smoke @vivobr
  @old_app
  Scenario: A prepay/control_n user that has an eSIM to install and a compatible device can access the eSIM module
    All flow is from the ob and the other pages are from native device flow
    Given user has any "control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has any "platinum;V" segmentation
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "snapcard_esim_card" card
      And completes the eSIM installation flow
      And user is in the "Activate Esim Device" page
      And clicks on the "activate_on_device" button
     Then the "Esim Native Installation" page is displayed

  @jira.QANOV-427958 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-426918 @manual @mobile @smoke @vivobr
  @old_app
  Scenario: A beatrix/multivivo/convergente user that has an eSIM to install and a compatible device successfully installs it on their device
    All flow is from the ob and the other pages are from native device flow
    Given user has any "beatrix;multivivo;convergente" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "snapcard_esim_card" card
      And completes the eSIM installation flow
      And user is in the "Activate Esim Device" page
      And clicks on the "activate_on_device" button
      And the "Esim Native Installation" page is displayed
      And clicks on the "continue" button
      And completes the eSIM installation successfully
      And launches the app
     Then the internal webview is displayed
      And the "esim_installation_successfully" notification is received

  @jira.QANOV-427959 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-426918 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A prepay/control_n that has an eSIM to install and a compatible device successfully installs it on their device
    All flow is from the ob and the other pages are from native device flow
    Given user has any "control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has any "platinum;V" segmentation
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "snapcard_esim_card" card
      And completes the eSIM installation flow
      And user is in the "Activate Esim Device" page
      And clicks on the "activate_on_device" button
      And the "Esim Native Installation" page is displayed
      And clicks on the "continue" button
      And completes the eSIM installation successfully
      And launches the app
     Then the internal webview is displayed
      And the "esim_installation_successfully" notification is received

  @jira.QANOV-427960 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-426918 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A beatrix/multivivo/convergente user that has an eSIM to install and a compatible device cannot install it if an error occurs
    All flow is from the ob and the other pages are from native device flow
    Given user has any "beatrix;multivivo;convergente" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "snapcard_esim_card" card
      And completes the eSIM installation flow
      And user is in the "Activate Esim Device" page
      And clicks on the "activate_on_device" button
      And the "Esim Native Installation" page is displayed
      And clicks on the "continue" button
      And an error has happened during the installation
      And launches the app
     Then the internal webview is displayed
      And the "esim_installation_failure" notification is received

  @jira.QANOV-427961 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-426918 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A prepay/control_n user that has an eSIM to install and a compatible device cannot install it if an error occurs
    All flow is from the ob and the other pages are from native device flow
    Given user has any "control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has any "platinum;V" segmentation
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "snapcard_esim_card" card
      And completes the eSIM installation flow
      And user is in the "Activate Esim Device" page
      And clicks on the "activate_on_device" button
      And the "Esim Native Installation" page is displayed
      And clicks on the "continue" button
      And an error has happened during the installation
      And launches the app
     Then the internal webview is displayed
      And the "esim_installation_failure" notification is received
