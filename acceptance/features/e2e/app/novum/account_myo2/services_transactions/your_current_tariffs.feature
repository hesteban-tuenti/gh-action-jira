# -*- coding: utf-8 -*-
@jira.QANOV-6928
Feature: Your current tariffs


  @jira.QANOV-6930 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.2 @jira.link.detects.O2UK-3743
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-249029 @jira.link.relates_to.NOV-122403
  @mobile @o2uk @sanity
  Scenario: A legacy prepay user with a tariff with allowances without pending tariff change can see the current tariff details
    To know if a user has a rolling plan tariff look in '/prepay/currentandpendingtariff' API has the field
    'payment_type': 'Rolling plan based' for the current tariff.
    commented_tags="@depends_on.NOV-63954"
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" tariff
      And user has no pending tariff change
      And user has a tariff with allowances
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "tariff_name" textfield is displayed
      And the "payment_type_title" textfield is displayed
      And the "change_your_tariff_prepay" button with "Change your tariff" text is displayed
      And the "top_up" button with "Top Up" text is displayed
      And the "description_title" textfield with "WHAT YOU GET" text is displayed
      And the "description_text" textfield is displayed
      And the "remaining_allowances_title" textfield with "REMAINING ALLOWANCES" text is displayed
      And the "remaining_allowances_subtitle" textfield is displayed
      And the "status" textfield with "Status" text is displayed
      And the "status_subtitle" textfield is displayed
      And the "payment_type" link with "Payment type" text is displayed
      And the "payment_type_subtitle" textfield is displayed
      And the "payment_type_chevron" icon is displayed
      And the "renewal_date" link with "Renewal date" text is displayed
      And the "renewal_date_subtitle" textfield is displayed
      And the "renewal_date_chevron" icon is displayed
      And the "additional_information" link with "Additional information" text is displayed
      And the "additional_information_subtitle" textfield is displayed
      And the "additional_information_chevron" icon is displayed
      And the "view_standard_rates" entrypoint with "View standard rates" text is displayed
      And the "standard_rates_chevron" icon is displayed

  @jira.QANOV-6931 @android @automatic @cert0 @cert1 @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-6930
  @jira.link.detects.OBO2UK-1098 @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-249029
  @jira.link.relates_to.NOV-122414 @mobile @o2uk @regression
  Scenario: A legacy prepay user accesses to the Additional information in current tariff details
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" tariff
      And user has no pending tariff change
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Tariff Details" page
     When clicks on the "additional_information_chevron" link
     Then the browser webview with "International | Free EU Roaming | O2" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Tariff Details" page is displayed

  @jira.QANOV-6933 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-6930 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-249029 @jira.link.relates_to.NOV-122410 @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user accesses to the Payment type information in current tariff details
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" tariff
      And user has no pending tariff change
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Tariff Details" page
     When clicks on the "payment_type" link
     Then the "Payment Type" internal webview is displayed
      And the "Payment type" header is displayed
      And the "payment_description" textfield is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Tariff Details" page is displayed

  @jira.QANOV-6937 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.2 @jira.link.detects.O2UK-3743
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-249029 @jira.link.relates_to.NOV-122404
  @mobile @o2uk @qa @smoke
  Scenario: A legacy prepay user with a tariff without allowances without pending tariff change can see the current tariff details
    other_affected_versions="2022-06"
    commented_tags="@depends_on.NOV-63954"
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" tariff
      And user has no pending tariff change
      And user has a tariff without allowances
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "tariff_name" textfield is displayed
      And the "payment_type" textfield is displayed
      And the "change_your_tariff_prepay" button with "Change your tariff" text is displayed
      And the "top_up" button with "Top Up" text is displayed
      And the "description_title" textfield with "WHAT YOU GET" text is displayed
      And the "description_text" textfield is displayed
      And the "remaining_allowances_title" textfield is not displayed
      And the "remaining_allowances_subtitle" textfield is not displayed
      And the "status" textfield with "Status" text is displayed
      And the "status_subtitle" textfield is displayed
      And the "payment_type" link with "Payment type" text is displayed
      And the "payment_type_subtitle" textfield is displayed
      And the "payment_type_chevron" icon is displayed
      And the "additional_information" link with "Additional information" text is displayed
      And the "additional_information_subtitle" textfield is displayed
      And the "additional_information_chevron" icon is displayed
      And the "view_standard_rates" entrypoint with "View standard rates" text is displayed
      And the "standard_rates_chevron" icon is displayed

  @jira.QANOV-6938 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-249029 @jira.link.relates_to.NOV-122405
  @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user with a tariff without renewal date and without pending tariff change can not see a renewal date in the tariff details
    internal_checkpoint="The user without renewal date will contain in the O2 Middleware response
    /{msisdn}/prepay/currentandpendingtariff the next field:
    'renewal_date_message': null"
    commented_tags="@depends_on.NOV-63954"
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" tariff
      And user has a tariff without renewal date in the "mobile_line" product
      And user has no pending tariff change
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "renewal_date" link is not displayed

  @jira.QANOV-6939 @android @ios @jira.cv.11.2 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-249029 @jira.link.relates_to.NOV-122406 @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user with a tariff with renewal date and without pending tariff change can see the renewal date of his tariff
    internal_checkpoint="The user with renewal date will contain in the O2 Middleware response
    /{msisdn}/prepay/currentandpendingtariff the next field:
    'renewal_date_message': 'something'"
    commented_tags="@depends_on.NOV-63954"
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" tariff
      And user has a tariff with renewal date in the "mobile_line" product
      And user has no pending tariff change
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "renewal_date" link is displayed

  @jira.QANOV-6940 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-6939 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-249029 @jira.link.relates_to.NOV-122412 @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user can see more info about the tariff renewal date
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" tariff
      And user has a tariff with renewal date in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Tariff Details" page
     When clicks on the "renewal_date" link
     Then the "Renewal Date" internal webview is displayed
      And the "Renewal date" header is displayed
      And the "what_is" textfield with "What is my renewal date?" text is displayed
      And the "when_is" textfield with "When is my renewal date?" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Tariff Details" page is displayed

  @jira.QANOV-6942 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-6930 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-249029 @jira.link.relates_to.NOV-91826 @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user can check standard rates from current tariff details screen
    internal_checkpoint="The items are returned by O2 and may change. Possible items in the list:
    - Top up
    - Tariffs and Bolt On
    - Landlines
    - O2 Mobiles
    - Other network mobiles
    - Text Message
    - Picture Message
    - Data
    - Voicemail
    - O2 Customer Service (through app and through 0344 )
    - International calls and texts from UK
    - Using your phone when abroad
    - Premium rate numbers
    - Service Numbers
    - O2 Directories
    - Video Calls
    - Free Calls
    - Access charge for service numbers"
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" tariff
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Tariff Details" page
     When clicks on the "view_standard_rates" button
     Then the "Standard Rates" page is displayed
      And the "Standard rates" header is displayed
      And the "standard_rates" list is displayed
      And each element in the "standard_rates" list has the "title" textfield
      And each element in the "standard_rates" list has the "subtitle" textfield
      And clicks on the "navigation_top_bar.back_button" button
      And the "Tariff Details" page is displayed

  @jira.QANOV-6946 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2 @jira.link.detects.O2UK-3743
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-249029 @jira.link.relates_to.NOV-122418
  @manual @mobile @o2uk @smoke
  Scenario: A legacy prepay user with pending tariff change can see the current tariff details
    commented_tags="@depends_on.NOV-122417"
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" tariff
      And user has pending tariff change in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Future Tariff Details" page
     When clicks on the "view_your_current_tariff_details" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "tariff_name" textfield is displayed
      And the "payment_type" textfield is displayed
      And the "description_title" textfield with "WHAT YOU GET" text is displayed
      And the "description_text" textfield is displayed
      And the "tariff_details" textfield is displayed
      And the "remaining_allowances_title" textfield with "REMAINING ALLOWANCES" text is displayed
      And the "remaining_allowances_subtitle" textfield is displayed
      And the "status" textfield with "Status" text is displayed
      And the "status_subtitle" textfield is displayed
      And the "payment_type" link with "Payment type" text is displayed
      And the "payment_type_subtitle" textfield is displayed
      And the "payment_type_chevron" icon is displayed
      And the "additional_information" link with "Additional information" text is displayed
      And the "additional_information_subtitle" textfield is displayed
      And the "additional_information_chevron" icon is displayed
      And the "view_standard_rates" entrypoint with "View standard rates" text is displayed
      And the "standard_rates_chevron" icon is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Future Tariff Details" page is displayed

  @jira.QANOV-6948 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-6946
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-249029 @jira.link.relates_to.NOV-122420
  @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user with pending tariff change can check additional information of the future tariff
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" tariff
      And user has pending tariff change in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Future Tariff Details" page
     When clicks on the "additional_information" link
     Then the browser webview is displayed
      And the "O2 | International | International Caller Bolt On" header is displayed

  @jira.QANOV-6949 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-6948
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-249029 @jira.link.relates_to.NOV-122421
  @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user with pending tariff change can go back from the external webview of tariff additional information to future tariff details screen
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" tariff
      And user has pending tariff change in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Future Tariff Details" page
     When clicks on the "additional_information" link
      And the browser webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Future Tariff Details" page is displayed

  @jira.QANOV-6950 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.2 @jira.link.detects.O2UK-3808
  @jira.link.relates_to.NOV-122425 @live @mobile @netcracker @next @o2uk @sanity
  Scenario: A postpay user without pending tariff change can see the current tariff details
    internal_checkpoint="Standard rates entry may contain just a text or a entry point to check standard rates.
    These are tested in separate test cases. A Flexible refresh user will have 'isFlexRefresh'
    field with value 'true' in the response to the postpay/bill/cca/phoneplan APIC endpoint"
    commented_tags="@depends_on.NOV-63954"
    Given user has a "postpay" account type
      And user has no pending tariff change
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "tariff_name" textfield is displayed
      And the "tariff_cost" textfield is displayed
      And the "change_your_tariff_postpay" button with "Change your tariff" text is displayed
      And the "description_title" textfield with "WHAT YOU GET" text is displayed
      And the "tariff_details" textfield is displayed

  @jira.QANOV-6951 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-6950 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-122433 @manual @mobile @netcracker @o2uk @regression
  Scenario: A legacy postpay user accesses to the standard rates from the current tariff details
    internal_checkpoint="Users will have standard rates available if there is a _links
    element in the response to postpay/tariff API. The link points to the specific
    request to be done to the postpay/tariffdetails API to retrieve the standard rates information"
    Given user has a "legacy postpay" account type
      And user has no pending tariff change
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Tariff Details" page
     When clicks on the "standard_rates_chevron" icon
     Then the "Standard Rates" page is displayed
      And the "standard_rates" list is displayed
      And each element in the "standard_rates" list has the "title" textfield
      And each element in the "standard_rates" list has the "text" textfield
      And clicks on the "navigation_top_bar.back_button" button
      And the "Tariff Details" page is displayed

  @jira.QANOV-178920 @android @ios @jira.cv.14.4 @jira.parent_test_plan.QANOV-132515 @jira.parent_test_plan.QANOV-178803
  @manual @mobile @o2uk @smoke
  Scenario: An AO2 postpay user accesses to the standard rates from the current tariff details
    Given user has a "AO2 postpay" account type
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Tariff Details" page
     When clicks on the "view_standard_rates_link" link
     Then the internal webview is displayed
      And the "Tariff details" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Tariff Details" page is displayed

  @jira.QANOV-6953 @android @ios @jira.cv.11.2 @jira.link.detects.O2UK-3293 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-122440 @manual @mobile @o2uk @smoke
  Scenario: A legacy postpay user with cancellable tariff change can see the future tariff details
    internal_checkpoint="To know if a pending tariff can be cancelled check pending_tariff.cancellable
    in the response to postpay/currentandpendingtariff
    If the response for pending_tariff contains a link an entrypoint to standard rates will be displayed
    (tested in a different scenario).
    CERT0: o2smartdrive+gt05@gmail.com"
    commented_tags="@depends_on.NOV-63954"
    Given user has a "legacy postpay" account type
      And user has pending tariff change cancellable in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "alert_title" textfield with "Tariff change pending" text is displayed
      And the "alert_subtitle" textfield with "This will be your new tariff once the new billing period starts. You can still cancel your tariff change" text is displayed
      And the "tariff_name" textfield is displayed
      And the "tariff_cost" textfield is displayed
      And the "cancel_tariff_change" button with "Cancel tariff change" text is displayed
      And the "description_title" textfield with "What you will get" text is displayed
      And the "description_text" textfield is displayed
      And the "tariff_details" textfield is displayed
      And the "your_current_tariff_details" entrypoint with "View your current tariff details" text is displayed

  @jira.QANOV-6954 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2 @jira.link.detects.O2UK-3743
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-249029 @jira.link.relates_to.NOV-122417
  @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user with pending tariff change can see the future tariff details
    commented_tags="@depends_on.NOV-63954"
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" tariff
      And user has pending tariff change in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Future Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "alert_title" textfield with "Tariff change pending" text is displayed
      And the "alert_subtitle" textfield with the "This change will be effective from DD Mmm 'YY" format is displayed
      And the "tariff_name" textfield is displayed
      And the "tariff_cost" textfield is displayed
      And the "payment_type" textfield is displayed
      And the "top_up" button with "Top up" text is displayed
      And the "description_title" textfield with "What you will get" text is displayed
      And the "description_text" textfield is displayed
      And the "status" textfield is displayed
      And the "tariff_details" textfield is displayed
      And the "view_standard_rates" entrypoint with "View standard rates" text is displayed
      And the "standard_rates_chevron" icon is displayed
      And the "your_current_tariff_details" entrypoint with "View your current tariff details" text is displayed
      And the "your_current_tariff_details_chevron" icon is displayed
      And the "additional_information" link with "Additional information" text is displayed
      And the "additional_information_subtitle" textfield is displayed
      And the "additional_information_chevron" icon is displayed

  @jira.QANOV-6955 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2 @jira.link.relates_to.NOV-122437
  @manual @mobile @netcracker @o2uk @regression
  Scenario: A postpay user with no cancellable tariff change can see the future tariff details
    internal_checkpoint="To know if a pending tariff can be cancelled check pending_tariff.cancellable in
    the response to postpay/currentandpendingtariff
    If the response for pending_tariff contains a link an entrypoint to standard rates will be displayed
    (tested in a different scenario)"
    commented_tags="@depends_on.NOV-63954"
    Given user has a "postpay" account type
      And user has pending tariff change non cancellable in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Future Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "alert_title" textfield with "Tariff change pending" text is displayed
      And the "alert_subtitle" textfield with "This will be your new tariff once the new billing period starts. You can't undo this action" text is displayed
      And the "tariff_name" textfield is displayed
      And the "tariff_cost" textfield is displayed
      And the "cancel_tariff_change" button is not displayed
      And the "description_title" textfield with "WHAT YOU GET" text is displayed
      And the "description_text" textfield is displayed
      And the "tariff_details" textfield is displayed
      And the "your_current_tariff_details" entrypoint with "View your current tariff details" text is displayed
      And the "your_current_tariff_details_chevron" icon is displayed

  @jira.QANOV-6956 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-6953
  @jira.link.depends_on.QANOV-6955 @jira.link.relates_to.NOV-122446 @mobile @netcracker @o2uk @smoke
  Scenario: A postpay user with pending tariff change can view his current tariff details
    internal_checkpoint="If the response in postpay/currentandpendingtariff for pending_tariff contains a link an
    entrypoint to standard rates will be displayed (tested in a different scenario)"
    Given user has a "postpay" account type
      And user has pending tariff change in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Account" page
     When clicks on the "view_or_change_your_tariff_service" button
      And the "Future Tariff Details" page is displayed
      And clicks on the "your_current_tariff_details" button
     Then the "Tariff Details" page is displayed
      And the "Your current tariff details" header is displayed
      And the "tariff_name" textfield is displayed
      And the "tariff_cost" textfield is displayed
      And the "description_title" textfield with "WHAT YOU GET" text is displayed
      And the "tariff_details" textfield is displayed

  @jira.QANOV-6959 @android @automatic @ios @jira.cv.11.2 @jira.link.detects.OBO2UK-1399 @jira.link.relates_to.NOV-100902
  @mobile @netcracker @o2uk @qa @regression
  Scenario: Flexible refresh user should not see length of contract and contract renewal date at current tariff details screen
    internal_checkpoint="In order to find out whether a user is a refresh user, check postpay/bill/cca/phoneplan.
    If the response contains 'isFlexRefresh' with value 'true' then don’t show the length of contract and contract
    renewal date in the tariffs page."
    commented_tags="@depends_on.NOV-63954"
    Given user has a "postpay" account type
      And user has no pending tariff change
      And user is a flexible refresh user
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "length_contract" textfield is not displayed
      And the "date_end_contract" textfield is not displayed

  @jira.QANOV-6960 @android @automatic @ber @ios @jira.cv.11.2 @jira.link.relates_to.NOV-122438 @mobile @netcracker @o2uk
  @qa @regression
  Scenario: Flexible refresh user should not see length of contract and contract renewal date at future tariff details screen
    internal_checkpoint="In order to find out whether a user is a refresh user, check postpay/bill/cca/phoneplan.
    If the response contains 'isFlexRefresh' with value 'true' then don’t show the length of contract and contract
    renewal date in the tariffs page."
    commented_tags="@depends_on.NOV-63954"
    Given user has a "postpay" account type
      And user has pending tariff change in the "mobile_line" product
      And user is a flexible refresh user
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Future Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "length_contract" textfield is not displayed
      And the "date_end_contract" textfield is not displayed

  @jira.<jira_id> @android @ios @jira.cv.11.2 @jira.link.relates_to.NOV-122426 @manual @mobile @netcracker @o2uk
  @regression
  Scenario Outline: Non Flexible refresh user should see length of contract and contract renewal date at tariff details view
    commented_tags="@depends_on.NOV-63954"
    internal_checkpoint="In order to find out whether a user is a refresh user, check postpay/bill/cca/phoneplan.
    If the response contains 'isFlexRefresh' with value 'true' then don’t show the length of contract and contract
    renewal date in the tariffs page."
    Given user has a "<account_type>" account type
      And user has no pending tariff change
      And user is a non-flexible refresh user
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "length_contract" textfield is displayed
      And the "date_end_contract" textfield is displayed

    Examples:
          | account_type | jira_id    |
          | PAYM         | QANOV-6961 |
          | MBB          | QANOV-6962 |

  @jira.<jira_id> @android @ios @jira.cv.11.2 @jira.link.relates_to.NOV-122439 @manual @mobile @netcracker @o2uk
  @regression
  Scenario Outline: Non Flexible refresh user should see length of contract and contract renewal date at future tariff details view
    commented_tags="@depends_on.NOV-63954"
    internal_checkpoint="In order to find out whether a user is a refresh user, check postpay/bill/cca/phoneplan.
    If the response contains “isFlexRefresh” with value “true” then don’t show the length of contract and contract
    renewal date in the tariffs page."
    Given user has a "<account_type>" account type
      And user has pending tariff change in the "mobile_line" product
      And user is a non-flexible refresh user
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Future Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "length_contract" textfield is displayed
      And the "date_end_contract" textfield is displayed

    Examples:
          | account_type | jira_id    |
          | PAYM         | QANOV-6963 |
          | MBB          | QANOV-6964 |

  @jira.QANOV-6965 @android @ios @jira.cv.11.2 @jira.link.detects.O2UK-3743 @jira.link.relates_to.NOV-122427 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A postpay user without pending tariff change can see the standard rates link in the current tariff details screen
    internal_checkpoint="Users will have standard rates available if there is a _links element in the response
    to postpay/tariff API. The link points to the specific request to be done to the postpay/tariffdetails
    API to retrieve the standard rates information"
    commented_tags="@depends_on.NOV-63954"
    Given user has a "postpay" account type
      And user has no pending tariff change
      And user has the current tariff with standard rates in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "view_standard_rates" entrypoint with "View standard rates" text is displayed
      And the "standard_rates_chevron" icon is displayed

  @jira.QANOV-6966 @android @ios @jira.cv.11.2 @jira.link.relates_to.NOV-122428 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user without pending tariff change can not see the standard rates link in the current tariff details screen
    internal_checkpoint="Users will not have standard rates available if there is not a _links element in
    the response to postpay/tariff API."
    commented_tags="@depends_on.NOV-63954"
    Given user has a "postpay" account type
      And user has no pending tariff change
      And user has not the current tariff with standard rates in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "standard_rates" textfield with "View standard rates" text is displayed
      And the "standard_rates_subtitle" textfield with "There is no calling plan for this number" text is displayed
      And the "standard_dates_chevron" icon is displayed

  @jira.QANOV-47763 @android @ios @jira.cv.11.15 @jira.link.detects.O2UK-3743 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user with pending tariff change can see the standard rates link in the current tariff details screen
    internal_checkpoint="Users will have standard rates available for the pending tariff if there is a _links element in
    the response to postpay/tariff API under pending_tariff."
    Given user has a "postpay" account type
      And user has pending tariff change in the "mobile_line" product
      And user has the pending tariff with standard rates in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Future Tariff Details" page
     Then the "view_standard_rates" entrypoint with "View standard rates" text is displayed
      And the "standard_rates_chevron" icon is displayed

  @jira.QANOV-47764 @android @ios @jira.cv.11.15 @manual @mobile @netcracker @o2uk @regression
  Scenario: A postpay user with pending cannot see the standard rates link in the current tariff details screen
    internal_checkpoint="Users will not have standard rates available for the pending tariff if there is not a _links
    element in the response to postpay/tariff API under pending_tariff."
    Given user has a "postpay" account type
      And user has pending tariff change in the "mobile_line" product
      And user has not the pending tariff with standard rates in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Future Tariff Details" page
     Then the "view_standard_rates" entrypoint is not displayed
      And the "standard_rates" textfield is not displayed

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.11.15 @manual @mobile @netcracker @o2uk
  @regression
  Scenario Outline: A postpay user can access to the Standard rates entrypoint
    internal_checkpoint="Users will have standard rates available for the pending tariff if there is a _links element in
    the response to postpay/tariff API"
    Given user has a "postpay" account type
      And user has the <tariff> tariff with standard rates in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "<page>" page
     When clicks on the "view_standard_rates" entrypoint
     Then the "Standard Rates" page is displayed
      And the "Standard rates" header is displayed
      And the "standard_rates" list is displayed
      And each element in the "standard_rates" list has the "title" textfield
      And each element in the "standard_rates" list has the "subtitle" textfield
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | tariff  | page                  | impeded_label | automation              | jira_id     |
          | current | Tariff Details        |               |                         | QANOV-47765 |
          | pending | Future Tariff Details | impeded_mock  | automation.pending_mock | QANOV-47766 |

  @jira.QANOV-6967 @android @ios @jira.cv.11.2 @jira.link.relates_to.NOV-122430 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user without pending tariff change and eligible for upgrade can see the upgrades module in the current tariff details screen
    internal_checkpoint="To find a user eligible for upgrade check the response of the O2 MW
    /{msisdn}/postpay/upgradesandpromotions and the eligible user will be
    upgrade.elegibilitystatus = PAID or FREE"
    commented_tags="@depends_on.NOV-63954"
    Given user has a "postpay" account type
      And user has no pending tariff change
      And user is eligible for upgrade
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "upgrade_title" textfield with "Upgrade" text is displayed
      And the "upgrade_subtitle" textfield is displayed
      And the "upgrade_button" button with "Upgrade" text is displayed

  @jira.QANOV-6968 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-6967 @jira.link.relates_to.NOV-38569 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A postpay user eligible for device upgrade can access to Device Upgrade from current tariff details screen
    internal_checkpoint="To find a user eligible for upgrade check the response of the O2 MW
    /{msisdn}/postpay/upgradesandpromotions and the eligible user will be
    upgrade.elegibilitystatus = PAID or FREE"
    Given user has a "postpay" account type
      And user has no pending tariff change
      And user is eligible for upgrade
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Tariff Details" page
     When clicks on the "upgrade_button" button
     Then the "Upgrade" internal webview is displayed
      And the "O2 | My device" header is displayed

  @jira.QANOV-6970 @android @automation.hard @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-6968
  @jira.link.relates_to.NOV-122431 @manual @mobile @netcracker @o2uk @regression
  Scenario: A postpay user completes an upgrade with tariff change from current tariff details screen
    internal_checkpoint="To find a user eligible for upgrade check the response of the O2 MW
    /{msisdn}/postpay/upgradesandpromotions and the eligible user will be
    upgrade.elegibilitystatus = PAID or FREE"
    Given user has a "postpay" account type
      And user has no pending tariff change
      And user is eligible for upgrade
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Upgrade" page
      And user completes an upgrade that includes a tariff change
     When clicks on the "navigation_top_bar.close_button" button
     Then the "Future Tariff Details" page is displayed
      And the "your_current_tariff_details" entrypoint with "Your current tariff details" text is displayed
      And the "your_current_tariff_details_chevron" icon is displayed

  @jira.QANOV-6972 @android @automation.hard @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-6968
  @jira.link.relates_to.NOV-122432 @manual @mobile @netcracker @o2uk @regression
  Scenario: A postpay user completes a upgrade without tariff change from current tariff details screen
    internal_checkpoint="To find a user eligible for upgrade check the response of the O2 MW
    /{msisdn}/postpay/upgradesandpromotions and the eligible user will be
    upgrade.elegibilitystatus = PAID or FREE"
    Given user has a "postpay" account type
      And user has no pending tariff change
      And user is eligible for upgrade
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Upgrade" page
      And user completes an upgrade that doesn't include a tariff change
     When clicks on the "navigation_top_bar.close_button" button
     Then the "Tariff Details" page is displayed
      And the "your_current_tariff_details" entrypoint is not displayed

  @jira.QANOV-6974 @android @ios @jira.cv.11.2 @jira.link.relates_to.NOV-122429 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user without pending tariff change and not eligible for upgrade can not see the upgrades module in the current tariff details screen
    internal_checkpoint="To find a user not eligible for upgrade check the response of
    the O2 MW /{msisdn}/postpay/upgradesandpromotions and the not eligible user will
    be upgrade.eligibilityStatus != paid and != free
    My O2 cert0 data - sandeepumredkar@mailinator.com"
    commented_tags="@depends_on.NOV-63954"
    Given user has a "postpay" account type
      And user has no pending tariff change
      And user is not eligible for upgrade
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "upgrade_title" textfield is not displayed
      And the "upgrade_subtitle" textfield is not displayed
      And the "upgrade_button" button is not displayed

  @jira.QANOV-6975 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-6953 @jira.link.depends_on.QANOV-6955
  @jira.link.relates_to.NOV-122448 @manual @mobile @netcracker @o2uk @regression
  Scenario: A postpay user with pending tariff change and not eligible for upgrade can not see the upgrades module in the future tariff details screen
    internal_checkpoint="To find a user not eligible for upgrade check the response of the
    O2 MW /{msisdn}/postpay/upgradesandpromotions and the not eligible user
    will be upgrade.elegibilitystatus != PAID and != FREE "
    Given user has a "postpay" account type
      And user has pending tariff change in the "mobile_line" product
      And user is not eligible for upgrade
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Future Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "upgrade_title" textfield is not displayed
      And the "upgrade_subtitle" textfield is not displayed
      And the "upgrade_button" button is not displayed

  @jira.QANOV-6976 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-6953 @jira.link.depends_on.QANOV-6955
  @jira.link.relates_to.NOV-122449 @manual @mobile @netcracker @o2uk @regression
  Scenario: A postpay user with pending tariff change and eligible for upgrade can see the upgrades module in the future tariff details screen
    internal_checkpoint="To find a user eligible for upgrade check the response of the
    O2 MW /{msisdn}/postpay/upgradesandpromotions and the eligible user will be
    upgrade.elegibilitystatus = PAID or FREE"
    Given user has a "postpay" account type
      And user has pending tariff change in the "mobile_line" product
      And user is eligible for upgrade
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Future Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "upgrade_title" textfield is displayed
      And the "upgrade_subtitle" textfield is displayed
      And the "upgrade_button" button is displayed

  @jira.QANOV-6977 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-6976 @jira.link.relates_to.NOV-122450 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A postpay user eligible for device upgrade can access to Device Upgrade from future tariff details screen
    internal_checkpoint="To find a user eligible for upgrade check the response of the
    O2 MW /{msisdn}/postpay/upgradesandpromotions and the eligible user will be
    upgrade.elegibilitystatus = PAID or FREE"
    Given user has a "postpay" account type
      And user has pending tariff change in the "mobile_line" product
      And user is eligible for upgrade
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Future Tariff Details" page
     When clicks on the "upgrade_button" button
     Then the "Upgrade" internal webview is displayed
      And the "O2 | My device" header is displayed

  @jira.QANOV-6978 @android @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-36658 @jira.link.relates_to.NOV-101012
  @manual @mobile @netcracker @o2uk @regression
  Scenario: A postpay user can access to the tariff details of its companion device from the top services card of the account dashboard
    commented_tags="@depends_on.NOV-80884"
    Given user has a "companion" account type
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Account" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed

  @jira.QANOV-6979 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2
  @jira.link.parent_test_plan.QANOV-36658 @jira.link.relates_to.NOV-122452 @manual @mobile @netcracker @o2uk @regression
  Scenario: A user access to tariff details screen. Error retrieving tariffs information
    internal_checkpoint="To test this behavior check the MW response
    /{msisdn}/postpay/currentandpendingtariff and verify that is returning an error."
    commented_tags="@depends_on.NOV-63954"
    Given user has a "postpay" account type
      And tariff information is not available
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Account" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "error_message" textfield with "Oops. Something went wrong. We couldn't load this info now. Check it again later" text is displayed

  @jira.QANOV-6980 @android @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-36658 @jira.link.relates_to.NOV-101220
  @manual @mobile @netcracker @o2uk @regression
  Scenario: A user without connectivity access to the the "Tariff details" screen from account dashboard: connectivity error is displayed
    internal_checkpoint="NOTE: you can use user :
    DEV1: novum_uk_14@tuenti.com / tuenti1234
    CERT1: 07521129227 / test123
    CERT2: 011111117@gmail.com / password"
    Given user has a "postpay" account type
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Account" page
      And I turn on airplane mode​
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed
      And I turn off airplane mode

  @jira.<jira_id> @android @ber @cert0 @cert1 @ios @jira.cv.14.3 @manual @mobile @o2uk @regression
  Scenario Outline: Williams <account_type> customers can see a disclaimer message in Tariff Details page
    Williams users are virgin media customers migrated to myO2.
    To test this scenario you can use:
    drew64598186@stf.ref.o2.co.uk / test123 has 17749 (legacy)
    sabr74312915@stf.ref.o2.co.uk / test123 has 17747 (legacy)
    mira22389911@stf.ref.o2.co.uk / test123 has 17744 (legacy)
    ncssptest+210719815087@gmail.com / Qwerty12345! (AO2)
    Given user has a "williams" account type
      And user has a "<account_type>" account type
      And user does not have a "rolling plan based" active tariff
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Account" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "disclaimer_message.title" textfield with "Don’t worry if your tariff price looks a little high" text is displayed
      And the "disclaimer_message.description" textfield with "We’ve made sure your tariff stayed the same when you moved to O2, by adding a monthly airtime discount Bolt On to your account. What you see here is before that monthly discount’s applied." text is displayed
      And the "disclaimer_message.see_boltons_link" link with "See Bolt Ons" text is displayed

    Examples:
          | account_type | jira_id      |
          | legacy       | QANOV-358967 |
          | AO2          | QANOV-402088 |

  @jira.<jira_id> @android @ber @cert0 @cert1 @ios @jira.cv.14.3 @manual @mobile @o2uk @regression
  Scenario Outline: Williams <account_type> customers can access to Boltons page from Tariff Details page
    Williams users are virgin media customers migrated to myO2.
    To test this scenario you can use:
    drew64598186@stf.ref.o2.co.uk / test123 has 17749 (legacy)
    sabr74312915@stf.ref.o2.co.uk / test123 has 17747 (legacy)
    mira22389911@stf.ref.o2.co.uk / test123 has 17744 (legacy)
    ncssptest+210719815087@gmail.com / Qwerty12345! (AO2)
    Given user has a "williams" account type
      And user has a "<account_type>" account type
      And user does not have a "rolling plan based" active tariff
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Account" page
      And clicks on the "view_or_change_your_tariff" button
      And the "Tariff Details" page is displayed
     When clicks on the "disclaimer_message.see_boltons_link" link
     Then the "Bolt Ons" page is displayed

    Examples:
          | account_type | jira_id      |
          | legacy       | QANOV-358968 |
          | AO2          | QANOV-402089 |

  @jira.QANOV-358969 @android @ber @cert0 @cert1 @ios @jira.cv.14.3 @manual @mobile @o2uk @regression
  Scenario: No Williams customers can't see a disclaimer message in Tariff Details page
    Given user does not have a "williams" account type
      And user does not have a "rolling plan based" active tariff
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Account" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "disclaimer_message" module is not displayed

  @jira.QANOV-386246 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.14.4 @mobile @o2uk @regression
  Scenario: A legacy user with O2 Wifi can access to current tariff details screen
    Given user has a "legacy" account type
      And user "has" O2 Wifi
      And user has the "services" module configured in CMS for "dashboard" page
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "view_or_change_your_tariff" button
     Then the "Tariff Details" page is displayed
      And the "Your tariff details" header is displayed
      And the "description_title" textfield is displayed