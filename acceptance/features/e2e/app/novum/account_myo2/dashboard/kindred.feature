# -*- coding: utf-8 -*-
@jira.QANOV-212641
Feature: Kindred

  Actions Before each Scenario:
    Given user is in the "Account" page


  @jira.<jira_id> @ber @jira.link.parent_test_plan.QANOV-206624 @mobile @o2uk @sanity
  Scenario Outline: A user can see the Kindred entrypoint in the account dashboard if their <os> version is at least <os_version>
    Only to be displayed for users with iOS version 15 or up as the plugin functionality in Safari is needed
    other_affected_versions="2022-18"
    Given the device version is "equal_or_greater" than "<os_version>"
      And user has any "postpay;prepay" account types
      And user has the matching subscription selected in the account
      And user has the "kindred" module configured in CMS for "dashboard" page for the "mobile" product
     Then the "kindred_card" module is displayed
      And the "kindred_card.title" textfield is displayed
      And the "kindred_card.button" button is displayed
      And the "kindred_card.image" icon is displayed

    @automatic @cert0 @cert1 @ios @jira.cv.13.3 @live @next
    Examples:
          | os_version | os    | jira_id      |
          | 15.0       | "iOS" | QANOV-212642 |

    @android @jira.cv.14.3 @automatic @cert0 @cert1 @live @next
    Examples:
          | os_version | os        | jira_id      |
          | 6.0        | "Android" | QANOV-344947 |

  @jira.QANOV-212643 @automatic @cert0 @cert1 @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-212642
  @jira.link.parent_test_plan.QANOV-206624 @live @mobile @next @o2uk @smoke @har
  Scenario: A user can access the Kindred entrypoint in the account dashboard if version iOS>=15.0
    Only to be displayed for users with iOS version 15 or up as the plugin functionality in Safari is needed
    other_affected_versions="2022-18"
    Given the device version is "equal_or_greater" than "15.0"
      And user has any "postpay;prepay" account types
      And user has the matching subscription selected in the account
      And user has the "kindred" module configured in CMS for "dashboard" page for the "mobile" product
     When clicks on the "kindred_card.button" button
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Account" page is displayed

  @jira.QANOV-212644 @automatic @cert0 @cert1 @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-206624 @live @mobile @next
  @o2uk @sanity @har
  Scenario: A user cannot see the Kindred entrypoint in the account dashboard if their iOS version is lower than 15
    Only to be displayed for users with iOS version 15 or up as the plugin functionality in Safari is needed
    other_affected_versions="2022-18"
    Given the device version is "lower" than "15.0"
      And user has any "postpay;prepay" account types
      And user has the matching subscription selected in the account
      And user has the "kindred" module configured in CMS for "dashboard" page for the "mobile" product
     Then the "kindred" module is not displayed

  @jira.QANOV-344948 @android @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-206624 @manual @mobile @o2uk @sanity
  Scenario: An Android user can access the Kindred page from the account dashboard
    Given user has any "postpay;prepay" account types
      And user has the matching subscription selected in the account
      And user has the "kindred" module configured in CMS for "dashboard" page for the "mobile" product
     When clicks on the "kindred_card.button" button
     Then the "Kindred" page is displayed
      And the "Kindred | My O2" header is displayed
      And the "title" textfield is displayed
      And the "description" textfield is displayed
      And the "item1" textfield is displayed
      And the "item2" textfield is displayed
      And the "item3" textfield is displayed
      And the "powered_by" textfield is displayed
      And the "kindred" icon is displayed
      And the "kindred_description" textfield is displayed
      And the "activate_now_button" button is displayed
      And the "login_link" link is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

  @jira.QANOV-344949 @android @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-206624 @manual @mobile @o2uk @regression
  Scenario: An Android user can see the Accessibility permissions page with information about data usage if it has not been activated previously
    Given user has any "postpay;prepay" account types
      And user has the matching subscription selected in the account
      And user has the "kindred" module configured in CMS for "dashboard" page for the "mobile" product
      And user has not activated Kindred previously in the device
      And clicks on the "kindred_card.button" button
      And the "Kindred" page is displayed
     When clicks on the "activate_now_button" button
     Then the "Kindred Activation" page is displayed
      And the "My O2" header is displayed
      And the "main_title" textfield with "Accessibility permissions" text is displayed
      And the "main_subtitle" textfield with the "• By allowing the Accessibility permission, you permit our Shopping Extension to scan and access data. We do this to enable you to save money when you are shopping on your favourite brands in your web browser. By accepting these terms, you allow us to use ([\w|\W| ]+)?…" format is displayed
      And the "more_information" link with "More information" text is displayed
      And the "instructions.title" module with "INSTRUCTIONS" title is displayed
      And the "instructions.first" textfield with "1. Click 'Agree' to open settings." text is displayed
      And the "instructions.second" textfield with "2. Click 'Feel Good Shopping' in the 'Installed Apps' section." text is displayed
      And the "instructions.third" textfield with "3. Click the toggle to activate." text is displayed
      And the "agree_button" button with "Agree" text is displayed
      And the "disagree_button" button with "Disagree" text is displayed

  @jira.QANOV-344950 @android @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-206624 @manual @mobile @o2uk @regression
  Scenario: An Android user can see the full Accessibility permissions text
    Given user has any "postpay;prepay" account types
      And user has the matching subscription selected in the account
      And user has the "kindred" module configured in CMS for "dashboard" page for the "mobile" product
      And user has not activated Kindred previously in the device
      And clicks on the "kindred_card.button" button
      And the "Kindred" page is displayed
      And clicks on the "activate_now_button" button
      And the "Kindred Activation" page is displayed
     When clicks on the "more_information" link
     Then the "main_subtitle" textfield with "• By allowing the Accessibility permission, you permit our Shopping Extension to scan and access data. We do this to enable you to save money when you are shopping on your favourite brands in your web browser. By accepting these terms, you allow us to use the Accessibility permission to access your app usage and activate only when you are shopping in the browsers.\n\n• To do so, we will scan and store the web URL of a site you visit along with a random click ID, in order to ensure that the Shopping Extension detects and notifies you if you visit a URL with an active coupon code, and to identify you and contribute to O2's green initiatives on your behalf for purchases made in your mobile browser for the app's Shopping Extension feature.\n\n• The Accessibility permission will display graphics allowing you to copy coupon codes and check out rewards. In addition, our app shares your locale and domains of websites that you visit with a third party in order to retrieve and display coupons and offers when applicable for the app's Shopping Extension feature." text is displayed

  @jira.QANOV-344951 @android @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-206624 @manual @mobile @o2uk @sanity @har
  Scenario: An Android user can see the status of the accessibility permissions after activation
    Given user has any "postpay;prepay" account types
      And user has the matching subscription selected in the account
      And user has the "kindred" module configured in CMS for "dashboard" page for the "mobile" product
      And user has not activated Kindred previously in the device
     When clicks on the "kindred_card.button" button
      And the "Kindred" page is displayed
      And clicks on the "activate_now_button" button
      And the "Kindred Activation" page is displayed
      And clicks on the "agree_button" button
      And the "Native Accesibility Settings" page is displayed
      And activates the accessibility permission for Kindred
     Then the "Kindred Success Feedback" page is displayed
      And the "info_title" textfield with "You have updated your accessibility preferences" text is displayed
      And the "info_text" textfield with "You can change them whenever you need to in your profile in the O2 app." text is displayed
      And the "continue_button" button with "Continue" text is displayed

  @jira.QANOV-344952 @android @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-206624 @manual @mobile @o2uk @regression
  Scenario: An Android user goes back to Account after enabling the accessibility settings page
    Given user has any "postpay;prepay" account types
      And user has the matching subscription selected in the account
      And user has the "kindred" module configured in CMS for "dashboard" page for the "mobile" product
      And user has not activated Kindred previously in the device
     When clicks on the "kindred_card.button" button
      And the "Kindred" page is displayed
      And clicks on the "activate_now_button" button
      And the "Kindred Activation" page is displayed
      And clicks on the "agree_button" button
      And the "Native Accesibility Settings" page is displayed
      And activates the accessibility permission for Kindred
      And the "Kindred Success Feedback" page is displayed
      And the "continue_button" button is displayed
      And clicks on the "continue_button" button
     Then the "Account" page is displayed

  @jira.QANOV-344953 @android @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-206624 @manual @mobile @o2uk @regression
  Scenario: An Android user will return to Kindred page when rejecting to accept the conditions
    Given user has any "postpay;prepay" account types
      And user has the matching subscription selected in the account
      And user has the "kindred" module configured in CMS for "dashboard" page for the "mobile" product
      And user has not activated Kindred previously in the device
     When clicks on the "kindred_card.button" button
      And the "Kindred" page is displayed
      And clicks on the "activate_now_button" button
      And the "Kindred Activation" page is displayed
      And clicks on the "disagree_button" button
     Then the "Kindred" page is displayed

  @jira.QANOV-344954 @android @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-206624 @manual @mobile @o2uk @smoke
  Scenario: An Android user can see the status of the accessibility permissions if it has been activated previously
    Given user has any "postpay;prepay" account types
      And user has the matching subscription selected in the account
      And user has the "kindred" module configured in CMS for "dashboard" page for the "mobile" product
      And user has activated Kindred previously in the device
     When clicks on the "kindred_card.button" button
      And the "Kindred" page is displayed
      And clicks on the "activate_now_button" button
     Then the "Kindred Success Feedback" page is displayed
      And the "info_title" textfield with "You have updated your accessibility preferences" text is displayed
      And the "info_text" textfield with "You can change them whenever you need to in your profile in the O2 app." text is displayed
      And the "continue_button" button with "Continue" text is displayed

  @jira.QANOV-344955 @android @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-206624 @manual @mobile @o2uk @regression
  Scenario: An Android user can go back to Account after seeing the status of the accessibility permissions
    Given user has any "postpay;prepay" account types
      And user has the matching subscription selected in the account
      And user has the "kindred" module configured in CMS for "dashboard" page for the "mobile" product
      And user has activated Kindred previously in the device
     When clicks on the "kindred_card.button" button
      And the "Kindred" page is displayed
      And clicks on the "activate_now_button" button
      And the "Kindred Success Feedback" page is displayed
      And clicks on the "continue_button" button
     Then the "Account" page is displayed

  @jira.QANOV-344956 @android @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-206624 @manual @mobile @o2uk @sanity
  Scenario: An Android user can access from the Kindred to login to their account
    Given user has any "postpay;prepay" account types
      And user has the matching subscription selected in the account
      And user has the "kindred" module configured in CMS for "dashboard" page for the "mobile" product
      And user has activated Kindred previously in the device
     When clicks on the "kindred_card.button" button
      And the "Kindred" page is displayed
      And clicks on the "login_link" link
     Then the external webview is displayed

  @jira.QANOV-344957 @android @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-206624 @manual @mobile @o2uk @regression
  Scenario: An Android user retrives an error when tapping on the "Login to your account" link without enabling Kindred
    Given user has any "postpay;prepay" account types
      And user has the matching subscription selected in the account
      And user has the "kindred" module configured in CMS for "dashboard" page for the "mobile" product
      And user has not activated Kindred previously in the device
     When clicks on the "kindred_card.button" button
      And the "Kindred" page is displayed
      And clicks on the "login_link" link
     Then the "Kindred Error Feedback" page is displayed
      And the "info_title" textfield with "You have not updated your accessibility preferences" text is displayed
      And the "info_body" textfield with "You need agree to the permissions and enable Kindred on your accessibility settings to open your wallet" text is displayed
      And the "continue_button" button with "Go back" text is displayed

  @jira.QANOV-344958 @android @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-206624 @manual @mobile @o2uk @regression
  Scenario: An Android user can go back to Account from the Kindred Error Feedback page
    Given user has any "postpay;prepay" account types
      And user has the matching subscription selected in the account
      And user has the "kindred" module configured in CMS for "dashboard" page for the "mobile" product
      And user has not activated Kindred previously in the device
     When clicks on the "kindred_card.button" button
      And the "Kindred" page is displayed
      And clicks on the "login_link" link
      And the "Kindred Error Feedback" page is displayed
      And clicks on the "continue_button" button
     Then the "Account" page is displayed
