# -*- coding: utf-8 -*-
@jira.QANOV-7971
Feature: Change Tariff

  Actions Before the Feature:
    Given user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list

  @jira.QANOV-7972 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.2 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-249029 @jira.link.relates_to.NOV-122407 @live @mobile @next @o2uk @sanity
  Scenario: A legacy prepay user can access to the webview for tariff change from the "Change your tariff" button from the current tariff details screen
    commented_tags="@depends_on.NOV-122403 @depends_on.NOV-122404 @depends_on.NOV-122405 @depends_on.NOV-122406"
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" tariff
      And user has no pending tariff change
      And user has the matching subscription selected in the account
      And user is in the "Tariff Details" page
     When clicks on the "change_your_tariff_prepay" button
      And waits "5" seconds
     Then the internal webview is displayed
      And the "Choose your tariff" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Tariff Details" page is displayed

  @jira.QANOV-7974 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-7972 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-249029 @jira.link.relates_to.NOV-122409 @mobile @no_automatable @o2uk @regression
  Scenario: A legacy prepay user can complete a tariff change started on the current tariff details page
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" tariff
      And user has no pending tariff change
      And user has the matching subscription selected in the account
      And user is in the "Change Your Tariff" page
     When clicks on any element in the "available_tariff" list
      And confirms the tariff change
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Future Tariff Details" page is displayed
      And the "Your tariff details" header is displayed

  @jira.QANOV-7976 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100939 @jira.link.relates_to.NOV-91716 @live @mobile @next @o2uk @smoke
  Scenario: A legacy postpay user without a pending tariff change can access to the webview for tariff change from the Tariff details screen
    commented_tags="@depends_on.NOV-122425 @depends_on.NOV-101012"
    Given user has a "legacy postpay" account type
      And user has no pending tariff change
      And user has the matching subscription selected in the account
      And user is in the "Tariff Details" page
     When clicks on the "change_your_tariff_postpay" button
     Then the internal webview with "Choose your tariff" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Tariff Details" page is displayed

  @jira.QANOV-7977 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.detects.OBO2UK-1450
  @jira.link.parent_test_plan.QANOV-24140 @jira.link.relates_to.NOV-100939 @jira.link.relates_to.NOV-91716 @mobile @o2uk
  @sanity
  Scenario: An AO2 postpay user without a pending tariff change can access to the webview for tariff change from the Tariff details screen
    commented_tags="@depends_on.NOV-122425 @depends_on.NOV-101012"
    Given user has a "AO2 postpay" account type
      And user has no pending tariff change
      And user has the matching subscription selected in the account
      And user is in the "Tariff Details" page
     When clicks on the "change_your_tariff_postpay" button
     Then the internal webview with "Choose your tariff" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Tariff Details" page is displayed

  @jira.QANOV-7980 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-7976 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-122436 @jira.link.relates_to.NOV-91717 @mobile @no_automatable @o2uk @regression
  Scenario: A legacy postpay user completes a tariff change at the Change tariff webview
    Given user has a "legacy postpay" account type
      And user has no pending tariff change
      And user has the matching subscription selected in the account
      And user is in the "Change Your Tariff" page
     When clicks on any element in the "available_tariff" list
      And confirms the tariff change
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Future Tariff Details" page is displayed
      And the "Your tariff details" header is displayed

  @jira.QANOV-7982 @android @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-7977 @jira.link.detects.OBO2UK-1403
  @jira.link.parent_test_plan.QANOV-24140 @jira.link.relates_to.NOV-122436 @jira.link.relates_to.NOV-91717 @mobile
  @no_automatable @o2uk @regression
  Scenario: An AO2 postpay user completes a tariff change at the Change tariff webview
    Given user has a "AO2 postpay" account type
      And user has no pending tariff change
      And user has the matching subscription selected in the account
      And user is in the "Change Your Tariff" page
     When clicks on any element in the "available_tariff" list
      And confirms the tariff change
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Future Tariff Details" page is displayed
      And the "Your tariff details" header is displayed

  @jira.<jira_id> @<client> @automatic @ber @cert0 @cert1 @jira.cv.11.2 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-122441 @mobile @o2uk @smoke
  Scenario Outline: A legacy postpay user can request the cancellation of a pending tariff change
    internal_checkpoint="To search for a user with a cancellation pending tariff, we need to look at
    postpay_currentandpendingtariff where pending_tariff != null and cancellable == true.
    CERT0: o2smartdrive+gt05@gmail.com"
    commented_tags="@depends_on.NOV-122440"
    Given user has a "legacy postpay" account type
      And user has pending tariff change cancellable in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "view_or_change_your_tariff_service" button
      And the "Future Tariff Details" page is displayed
      And clicks on the "cancel_tariff_change" button
     Then the "Cancel Tariff Change" popup is displayed
      And the "popup.title" textfield with "Cancel tariff change" text is displayed
      And the "popup.message" textfield with "You're going to cancel your tariff change. Are you sure?" text is displayed
      And the "popup.accept" button with "<accept_text>" text is displayed
      And the "popup.cancel" button with "<cancel_text>" text is displayed

    Examples:
          | client  | accept_text | cancel_text | jira_id      |
          | android | YES         | NO          | QANOV-7983   |
          | ios     | Yes         | No          | QANOV-142395 |

  @jira.QANOV-7984 @android @automatic @cert0 @cert1 @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-7983
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-122442 @mobile @o2uk @smoke
  Scenario: A legacy postpay user can abort the cancellation of a tariff change
    CERT0: 30ap61106529@stf.ref.o2.co.uk
    Given user has a "legacy postpay" account type
      And user has pending tariff change cancellable in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "view_or_change_your_tariff_service" button
      And the "Future Tariff Details" page is displayed
      And clicks on the "cancel_tariff_change" button
      And the "Cancel Tariff Change" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Future Tariff Details" page is displayed

  @jira.QANOV-7985 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-7983 @jira.link.detects.OBO2UK-1263
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-122444 @manual @mobile @o2uk @smoke
  Scenario: A legacy postpay user can confirm a pending tariff change cancellation
    Given user has a "legacy postpay" account type
      And user has pending tariff change cancellable in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Future Tariff Details" page
     When clicks on the "cancel_tariff_change" button
      And the "Pending Tariff Change Cancellation" popup is displayed
      And clicks on the "yes" button
     Then the "Feedback Success" page is displayed
      And the "white_tick" icon is displayed
      And the "title" textfield with "Cancel tariff change" text is displayed
      And the "message" textfield with "The tariff change cancellation has been requested" text is displayed
      And the "back_to_account" button with "Return to dashboard" text is displayed
      And the "tariff_change_cancellation_request" notification is received

  @jira.QANOV-7986 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-7985 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-122445 @manual @mobile @o2uk @regression
  Scenario: A legacy postpay user can return to the dashboard after completing the cancellation of a tariff change
    Given user has a "legacy postpay" account type
      And user has pending tariff change cancellable in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Future Tariff Details" page
     When clicks on the "cancel_tariff_change" button
      And the "Pending Tariff Change Cancellation" popup is displayed
      And clicks on the "yes" button
      And the "Feedback Success" page is displayed
      And clicks on the "back_to_account" button
     Then the "Account" page is displayed
      And the "Account" header is displayed

  @jira.QANOV-7988 @android @automation.hard @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-7983
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-122453 @manual @mobile @o2uk @regression
  Scenario: A legacy postpay user confirms the tariff change cancellation but there is an error
    internal_checkpoint="Can be tested in QA with users 011111441@gmail.com, 011111116@gmail.com."
    Given user has a "legacy postpay" account type
      And user has pending tariff change cancellable in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Future Tariff Details" page
     When clicks on the "cancel_tariff_change" button
      And the "Pending Tariff Change Cancellation" popup is displayed
      And clicks on the "yes" button
      And an error happens during the operation
     Then the "Feedback Error" page is displayed
      And the "Cancel tariff request" header is displayed
      And the "red" icon is displayed
      And the "title" textfield with "Your tariff change could not be cancelled" text is displayed
      And the "message" textfield with "Your tariff change has not been cancelled. Please try again later" text is displayed
      And the "tariff_change_cancellation_fail" notification is received

  @jira.QANOV-7989 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.6
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-80895 @manual @mobile @o2uk @regression
  Scenario: A legacy postpay user can change the tariff of his companion device from latest airtime bill details
    internal_checkpoint="the option to change his tariff depends on the OB sending a CHANGE_TARIFF action in the
    extraChargesRecommendation element of the response to{msisdn}/postpay/bill/billedcharges?filteringmsisdn={msisdn}"
    Given user has a "legacy PAYM" account type with companion line associated
      And user has a tariff change recommendation for the "companion" account
      And user has the matching subscription selected in the account
      And user is in the "Latest Airtime Bill" page
     When clicks on the "companion_friendly_name_entry" entrypoint
      And the "Bill Concepts" page is displayed
      And clicks on the "change_your_tariff" button
     Then the "Change Your Tariff" internal webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bill Concepts" page is displayed

  @jira.QANOV-7992 @android @ios @jira.cv.11.1 @jira.link.relates_to.NOV-100916 @manual @mobile @netcracker @o2uk @smoke
  Scenario: User can see the option to save some money adding boltons in the next bill inside of the Bill Concepts screen
    internal_checkpoint="CERT2:
    - 011111081@gmail.com
    - 121111112@gmail.com has change tariff
    - 112111082@gmail.com has add bolt-on
    CERT1/CERT0:
    - set532@test.com has Add Bolt Ons (2021/07/09)
    recommendations are included in the answer to postpay/bill/billedcharges. Typical case where the OB has recommendations:
    if the average consumption of last months is over the contracted bundles)"
    Given user has a "postpay" account type
      And user has the last bill available
      And user has "boltons" recommendations in bill
      And user has the matching subscription selected in the account
      And user is in the "Latest Airtime Bill" page
     Then the "add_boltons" button is displayed

  @jira.QANOV-7993 @android @ios @jira.cv.11.1 @jira.link.relates_to.NOV-100916 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: User only see one change tariff button when the user is recommended to change tariff by the OB in the Latest Airtime Bill screen
    internal_checkpoint="CERT2:
    - 011111081@gmail.com
    - 121111112@gmail.com has change tariff
    - 112111082@gmail.com has add bolt-on
    CERT1:
    - 07521109498/inl_may8842@o2.com has both
    - 07731296914 has Add Bolt Ons
    recommendations are included in the answer to postpay/bill/billedcharges. Typical case where the OB has recommendations:
    if the average consumption of last months is over the contracted bundles)"
    Given user has a "postpay" account type
      And user has the last bill available
      And user has "tariff change" recommendations in bill
      And user has the matching subscription selected in the account
      And user is in the "Latest Airtime Bill" page
     Then the "change_tariff_recommendation_button" button is not displayed

  @jira.QANOV-7996 @android @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-7992 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100916 @manual @mobile @o2uk @regression
  Scenario: A legacy user who has a bolt-on proposal from the OB can access to the bolt-on purchase screen from the Latest Airtime Bill screen
    Given user has a "legacy postpay" account type
      And user has an active bundle
      And user has the last bill available
      And user has "boltons" recommendations in bill
      And user has the matching subscription selected in the account
      And user is in the "Latest Airtime Bill" page
     When clicks on the "add_boltons" button
     Then the "Buy Bolt Ons" internal webview is displayed
      And the "O2 | My device" header is displayed

  @jira.QANOV-8006 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.6
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-80894 @manual @mobile @o2uk @regression
  Scenario: A legacy postpay user can change the tariff of his companion device from the Previous Usage screen
    internal_checkpoint="the option to change his tariff depends on the OB sending a CHANGE_TARIFF action in the extraChargesRecommendation element of the response to {msisdn}/postpay/bill/billedcharges?filteringmsisdn={msisdn}"
    Given user has a "legacy companion" account type
      And user has "tariff change" recommendations in bill
      And user has the matching subscription selected in the account
      And user is in the "Data Previous Usage" page
     When clicks on the "change_tariff" button
     Then the internal webview with "Choose your tariff" header is displayed
      And the "current_tariff" textfield is displayed
