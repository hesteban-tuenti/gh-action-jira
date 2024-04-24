# -*- coding: utf-8 -*-
@jira.QANOV-60184 @not_hardening
Feature: eSIM

  Actions Before the Feature:
    Given user has a "AO2 postpay" account type
      And user has an eSIM profile to install
      And user has a device with eSIM capabilities
      And user has the matching subscription selected in the account
      And user has the "esim-installation-launcher" module present in CMS for the "dashboard" page


  @jira.QANOV-60185 @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-132515 @cert0 @cert1 @qa
  @jira.link.parent_test_plan.QANOV-60162 @jira.link.parent_test_plan.QANOV-77438 @automatic @mobile @o2uk @sanity
  Scenario: A user that has an eSIM to install and a compatible device can access the eSIM module
    other_affected_version="2022-09"
    Given user is in the "Account" page
     When clicks on the "esim_module.chevron" icon
     Then the "Esim Installation" page is displayed
      And the "[LANG:esim.esim_installation_page.header]" header is displayed
      And the "title" textfield with the "[LANG:esim.esim_installation_page.title]" format is displayed
      And the "what_is_esim_title" textfield with "[LANG:esim.esim_installation_page.what_is_title]" text is displayed
      And the "what_is_esim_description" textfield with "[LANG:esim.esim_installation_page.what_is_description]" text is displayed
      And the "things_to_remember_title" textfield with "[LANG:esim.esim_installation_page.things_to_remember_title]" text is displayed
      And the "things_to_remember_description" is displayed with multiline text
          """
          esims don’t store any messages or contacts they only hold the data needed to connect your device to our network.
          
          Once installed, your esim can’t be moved to another device. So you’ll need to request a new esim when you next upgrade.
          """
      And the "install_button" button with "[LANG:esim.esim_installation_page.install_button]" text is displayed

  @jira.QANOV-95600 @android @automation.hard @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-132515
  @jira.link.parent_test_plan.QANOV-60162 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user who is in the Esim Installation screen will see a confirmation pop up when trying to exit the installation
    other_affected_version="2022-09"
    Given user is in the "Esim Installation" page
     When clicks on the "navigation_top_bar.close_button" button
     Then the "Confirm Exit" popup is displayed
      And the "popup.title" textfield with "Are you sure you want to quit?" text is displayed
      And the "popup.message" textfield with "If you quit this process, you might lose your esim installation progress" text is displayed
      And the "popup.accept" button with "Quit" text is displayed
      And the "popup.cancel" button with "Don't leave" text is displayed

  @jira.QANOV-95601 @android @automation.hard @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-132515
  @jira.link.parent_test_plan.QANOV-60162 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user who is in the Esim Installation screen can exit the esim installation
    other_affected_version="2022-09"
    Given user is in the "Esim Installation" page
     When clicks on the "navigation_top_bar.close_button" button
      And clicks on the "popup.accept" button
     Then the "Account" page is displayed

  @jira.QANOV-95602 @android @automation.hard @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-132515
  @jira.link.parent_test_plan.QANOV-60162 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user who is in the Esim Installation screen can choose not to quit the esim installation
    other_affected_version="2022-09"
    Given user is in the "Esim Installation" page
     When clicks on the "navigation_top_bar.close_button" button
      And clicks on the "popup.cancel" button
     Then the "Esim Installation" page is displayed

  @jira.QANOV-60186 @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-132515
  @jira.link.parent_test_plan.QANOV-60162 @jira.link.parent_test_plan.QANOV-77438 @no_automatable @mobile @o2uk @smoke
  Scenario: A user that has an eSIM to install and a compatible device can accept to install it
    The copies in the install_button should be for Android:
    - Loading (while the profile is being downloaded)
    - Installing (while the profile is being installed)
    For iOS the interactive elements of esim installation page are disabled
    other_affected_version="2022-09"
    Given user is in the "Esim Installation" page
     When clicks on the "install_button" button
     Then the "Esim Installation" page is displayed
      And the "install_button" button shows the installation progress

  @jira.QANOV-60187 @android @ios @jira.cv.13.0 @jira.link.detects.IOS-6794 @jira.link.parent_test_plan.QANOV-132515
  @jira.link.parent_test_plan.QANOV-60162 @jira.link.parent_test_plan.QANOV-77438 @mobile @no_automatable @o2uk @smoke
  Scenario: A user that has an eSIM to install and a compatible device successfully installs it on their device
    The process of installation of eSIMs are OS native
    The only interactive element in this screen should be the 'Back to My O2' button
    other_affected_version="2022-09"
    Given user is in the "Esim Installation" page
     When clicks on the "install_button" button
      And the "Esim Installation" app is displayed
      And completes the eSIM installation successfully
     Then the "Feedback Success" page is displayed
      And the "success_icon" icon is displayed
      And the "title" textfield with "[LANG:esim.feedback_success.title]" text is displayed
      And the "description" textfield with "[LANG:esim.feedback_success.description]" text is displayed
      And the "back_to_account_button" button with "[LANG:esim.feedback_success.back_to_account]" text is displayed

  @jira.QANOV-60188 @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-132515
  @jira.link.parent_test_plan.QANOV-60162 @jira.link.parent_test_plan.QANOV-77438 @mobile @no_automatable @o2uk
  @regression
  Scenario: A user who successfully installed an eSIM can go back to account
    other_affected_version="2022-09"
    Given user is in the "Esim Installation" page
      And clicks on the "install_button" button
      And the "Esim Installation" app is displayed
      And completes the eSIM installation successfully
      And the "Feedback Success" page is displayed
     When clicks on the "back_to_account_button" button
     Then the "Account" page is displayed

  @jira.QANOV-60189 @android @ios @jira.cv.13.0 @jira.link.detects.IOS-6794 @jira.link.parent_test_plan.QANOV-132515
  @jira.link.parent_test_plan.QANOV-60162 @jira.link.parent_test_plan.QANOV-77438 @mobile @no_automatable @o2uk
  @regression
  Scenario: A user that has an eSIM to install and a compatible device cannot install it if an error occurs
    The process of installation of eSIMs are OS native.
    Possible source of error:
    - msisdn not corresponding to an eSIM
    - customer's account in fraud status
    - msisdn suspended
    - activation needs to be completed by QR code
    - eSIM profile status has not been released for activation
    We can simulate an error, activating airplane mode before installation
    other_affected_version="2022-09"
    Given user is in the "Esim Installation" page
     When clicks on the "install_button" button
      And the "Esim Installation" app is displayed
      And completes the installation
      And an error has happened during the intallation
     Then the "Feedback Error" page is displayed
      And the "alert_icon" icon is displayed
      And the "title" textfield with "[LANG:esim.feedback_error.title]" text is displayed
      And the "body" textfield with "[LANG:esim.feedback_error.body]" text is displayed
      And the "install_again_button" button with "[LANG:esim.feedback_error.install_again]" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-60190 @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-132515
  @jira.link.parent_test_plan.QANOV-60162 @jira.link.parent_test_plan.QANOV-77438 @mobile @no_automatable @o2uk
  @regression
  Scenario: A user whose eSIM installation has failed can retry to install it
    other_affected_version="2022-09"
    Given user is in the "Esim Installation" page
      And clicks on the "install_button" button
      And the "Esim Installation" app is displayed
      And completes the installation
      And an error has happened during the intallation
      And the "Feedback Error" page is displayed
     When clicks on the "install_again_button" button
     Then the "Esim Installation" app is displayed

  @jira.QANOV-60191 @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-132515
  @jira.link.parent_test_plan.QANOV-60162 @jira.link.parent_test_plan.QANOV-77438 @mobile @no_automatable @o2uk
  @regression
  Scenario: A user whose eSIM installation has failed can go back to account
    other_affected_version="2022-09"
    Given user is in the "Esim Installation" page
      And clicks on the "install_button" button
      And the "Esim Installation" app is displayed
      And completes the installation
      And an error has happened during the intallation
      And the "Feedback Error" page is displayed
     When clicks on the "navigation_top_bar.close_button" button
     Then the "Account" page is displayed
