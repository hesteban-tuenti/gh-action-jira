# -*- coding: utf-8 -*-
@jira.QANOV-127762
Feature: Bolton Detail

  Actions After the Feature:
     Then navigates to "Account" page


  @jira.QANOV-7918 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-7917 @jira.link.relates_to.NOV-162527 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A postpay user with a bolt on having expiry date & start date access to Bolt on details screen
    CERT0 user: 447568415477 / 12oc72476237@stf.ref.o2.co.uk
    testinguser1@o2.com (07801003168) (29/07/2021)
    Given user has a "postpay" account type
      And user has a bolt on with the fields "expiry_date;start_date"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "start_date.label" textfield with "Start date" text is displayed
      And the "start_date.value" textfield with the "DD Mmm 'YY" format is displayed
      And the "expiry_date.label" textfield with "Expiry date" text is displayed
      And the "expiry_date.value" textfield with the "DD Mmm 'YY" format is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bolt Ons" page is displayed

  @jira.QANOV-7920 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-7919 @jira.link.relates_to.NOV-162529 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A postpay user with a bolt on having only expiry date access to Bolt on details screen
    Given user has a "postpay" account type
      And user has a bolt on with the fields "expiry_date;NOT start_date"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "expiry_date.label" textfield with "Expiry date" text is displayed
      And the "expiry_date.value" textfield with the "DD Mmm 'YY" format is displayed
      And the "start_date.label" textfield is not displayed

  @jira.QANOV-7923 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-7921 @jira.link.relates_to.NOV-162531 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A postpay user with a bolt on having only start date access to Bolt on details screen
    CERT0: testinguser1@o2.com (07801003168) (29/07/2021)
    Given user has a "postpay" account type
      And user has a bolt on with the fields "NOT expiry_date;start_date"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "start_date.label" textfield with "Start date" text is displayed
      And the "start_date.value" textfield with the "DD Mmm 'YY" format is displayed
      And the "expiry_date.label" textfield is not displayed

  @jira.QANOV-7925 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-7924 @jira.link.relates_to.NOV-162533 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A postpay user with a bolt on not having start or expiry date access to Bolt on details screen
    internal_checkpoint="CERT0 user: 447568415307 / in06427n_660108@o2.com"
    Given user has a "postpay" account type
      And user has a bolt on without the fields "expiry_date;start_date"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "start_date.label" textfield is not displayed
      And the "expiry_date.label" textfield is not displayed

  @jira.QANOV-7927 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-7916
  @jira.link.relates_to.NOV-162538 @live @mobile @netcracker @next @o2uk @smoke @qa @webapp
  Scenario: A user with a Removable Bolt on in active status access to Bolt on details screen
    - Note: optional fields to be tested separately (start date, expiry date, renewal date,
    monthly charge, remaining allowances, learn more, what you get).
    - Removable Bolt Ons have 'can_be_removed': true in the response to the boltons APIC endpoint
    CERT0 user: 447568416502 / 13au77589841@stf.ref.o2.co.uk
    other_affected_versions="2022-13"
    Given user has a "postpay" account type
      And user has a bolt on in "active" status and "removable"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "0" index in the "bolt_on_details_list" list has the "title" field with "Status" text
      And the "0" index in the "bolt_on_details_list" list has the "detail" field with "Active" text
      And the "remove_button" button with "Remove Bolt On" text is displayed

  @jira.QANOV-7928 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-7927
  @jira.link.detects.O2UK-3970 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-162539 @live @mobile
  @next @o2uk @regression @qa
  Scenario: A legacy user with a Removable Bolt on in active status taps on "Remove Bolt On" at the Bolt on details screen
    - Removable Bolt Ons have 'can_be_removed': true in the response to the boltons APIC endpoint
    CERT0 user: 447568416502 / 13au77589841@stf.ref.o2.co.uk
    other_affected_versions="2022-13"
    Given user has a "legacy" account type
      And user has a bolt on in "active" status and "removable"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
      And the "Bolt On Details" page is displayed
      And clicks on the "remove_button" button
     Then the internal webview with "O2 | Phone, SIM & Tech Deals - See What You Can Do " header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bolt On Details" page is displayed

  @jira.QANOV-7930 @android @ber @ios @jira.cv.12.4 @automatic @mobile @o2uk
  @regression @jira.link.relates_to.NOV-162539 @jira.link.depends_on.QANOV-7927 @jira.link.detects.OBO2UK-1404
  @jira.link.parent_test_plan.QANOV-24140 @cert0 @cert1 @qa
  Scenario: An AO2 user with a Removable Bolt on in active status taps on "Remove Bolt On" at the Bolt on details screen
    Given user has a "AO2" account type
      And user has a bolt on in "active" status and "removable"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
      And the "Bolt On Details" page is displayed
      And clicks on the "remove_button" button
     Then the internal webview is displayed
      And the "Remove Bolt on" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bolt On Details" page is displayed

  @jira.QANOV-7932 @android @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-7916 @jira.link.relates_to.NOV-100981 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A postpay user with a no Removable Bolt on in pending status access to Bolt on details screen
    internal_checkpoint="- Note: optional fields to be tested separately (start date, expiry date, renewal date,
    monthly charge, remaining allowances, learn more, what you get).
    - No Removable Bolt Ons have 'can_be_removed': false in the response to the boltons APIC endpoint"
    Given user has a "postpay" account type
      And user has a bolt on in "pending_to_add" status and "no removable"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "status.label" textfield with "Status" text is displayed
      And the "status.value" textfield with "Pending" text is displayed
      And the "remove_button" button is not displayed

  @jira.QANOV-44928 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.relates_to.NOV-100982 @live @mobile
  @netcracker @next @o2uk @sanity @qa @webapp
  Scenario: A postpay user with a no Removable Bolt on in active status access to Bolt on details screen
    internal_checkpoint="no Removable Bolt Ons have 'can_be_removed': false in the response to the boltons APIC endpoint
    The optional fields could appear (they are tested in another scenarios)"
    Given user has a "postpay" account type
      And user has a bolt on in "active" status and "no removable"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
      And waits until the "your_boltons.list" list is displayed
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "0" index in the "bolt_on_details_list" list has the "title" field with "Status" text
      And the "0" index in the "bolt_on_details_list" list has the "detail" field with "Active" text
      And the "remove_button" button is not displayed

  @jira.QANOV-7933 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-7916 @jira.link.relates_to.NOV-100974 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A postpay user with a Removable Bolt on in pending status access to Bolt on details screen
    internal_checkpoint="- Note: optional fields to be tested separately (start date, expiry date, renewal date,
    monthly charge, remaining allowances, learn more, what you get).
    - Removable Bolt Ons have 'can_be_removed': true in the response to the boltons APIC endpoint.
    - CERT0: good@test.com - 07347162012"
    Given user has a "postpay" account type
      And user has a bolt on in "pending_to_add" status and "removable"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "status.label" textfield with "Status" text is displayed
      And the "status.value" textfield with "Pending" text is displayed
      And the "remove_button" button with "Remove Bolt On" text is displayed

  @jira.QANOV-7934 @android @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-7933 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100977 @manual @mobile @o2uk @regression
  Scenario: A legacy user with a Removable Bolt on in pending status taps on "Remove Bolt On" button at the Bolt on details screen
    internal_checkpoint="- Removable Bolt Ons have 'can_be_removed': true in the response to the boltons APIC endpoint.
    - CERT0: good@test.com - 07347162012"
    Given user has a "legacy" account type
      And user has a bolt on in "pending_to_add" status and "removable"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
      And the "Bolt On Details" page is displayed
      And clicks on the "remove_button" button
     Then the browser webview is displayed
      And the "O2 | My device" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bolt On Details" page is displayed

  @jira.QANOV-7935 @android @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-7933 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.relates_to.NOV-100977 @manual @mobile @o2uk @regression
  Scenario: An AO2 user with a Removable Bolt on in pending status taps on "Remove Bolt On" button at the Bolt on details screen
    Given user has a "AO2" account type
      And user has a bolt on in "pending_to_add" status and "removable"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
      And the "Bolt On Details" page is displayed
      And clicks on the "remove_button" button
     Then the internal webview is displayed
      And the "Remove Bolt On" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bolt On Details" page is displayed

  @jira.QANOV-7936 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-7935 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-162540 @manual @mobile @o2uk @regression
  Scenario: A legacy user that reached the O2 webview for Bolton removal completes removal of a bolt on
    internal_checkpoint="- NOTE: the content in 'Your bolt ons screen' will not be updated until the user leaves the
    section and access again through the link in the Account Dashboard or the link in the 'Manage your account' screen.
    - NOTE: different boltons have different life cycles in the operator. Some boltons will be set to pending to
    removal, some boltons will not change its status and will simply dissappear when the removal date is reached. Note
    also that any change of bolton status needs a minimum of 2 minutes to be reflected"
    Given user has a "legacy" account type
      And user has a bolt on in "pending_to_add" status and "removable"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
      And the "Bolt On Details" page is displayed
      And clicks on the "remove_button" button
      And the browser webview is displayed
      And confirms the bolt on removal
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Bolt Ons" page is displayed
      And sms with the confirmation of the bolt on removal is received

  @jira.QANOV-7937 @android @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-7935 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.relates_to.NOV-162540 @manual @mobile @o2uk @regression
  Scenario: An AO2 user that reached the O2 webview for Bolton removal completes removal of a bolt on
    Given user has a "AO2" account type
      And user has a bolt on in "pending_to_add" status and "removable"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
      And the "Bolt On Details" page is displayed
      And clicks on the "remove_button" button
      And the browser webview is displayed
      And confirms the bolt on removal
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Bolt Ons" page is displayed
      And sms with the confirmation of the bolt on removal is received

  @jira.QANOV-7938 @android @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-7916 @jira.link.relates_to.NOV-100985 
  @automatic @mobile @netcracker @o2uk @smoke @qa @webapp
  Scenario: A postpay user with a Bolt on in pending for removal status access to Bolt on details screen
    Bolt ons APIC endpoints:
    - /{msisdn}/postpay/boltons
    - /{msisdn}/prepay/boltons
    Postpay bolt ons in 'Removed' status have 'status': 'Pending for removal' in the response to the boltons APIC
    endpoint.
    Prepay bolt ons in 'Removed' status have 'status': 'PENDING_DELETION' in the response to the boltons APIC endpoint
    - Note: optional fields to be tested separately
    - Note: removed status depends on the operator systems. Many prepay bolt-ons do not go through this state when
    removed
    CERT0: testinguser1@o2.com (07801003168) (29/07/2021)
    Given user has a "postpay" account type
      And user has a bolt on in "pending_to_remove" status
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
      And waits until the "your_boltons.list" list is displayed
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "0" index in the "bolt_on_details_list" list has the "title" field with "Status" text
      And the "0" index in the "bolt_on_details_list" list has the "detail" field with "Removed by you" text
      And the "remove_button" button is not displayed

  @jira.QANOV-7944 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-7943 @jira.link.relates_to.NOV-162544 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A user with a bolt on not having price access to Bolt on details screen
    internal_checkpoints="To find a user without monthly charge check the response
    /{msisdn}/postpay/boltons or /{msisdn}/prepay/boltons: The boltons without monthly charge are the ones that
    doesn't have the field 'monthly_charge' (postpay) or 'charge' (prepay)"
    other_affected_versions="2022-13"
    Given user has a bolt on without monthly charge
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "monthly_charge.label" textfield is not displayed

  @jira.QANOV-200602 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-7943 @jira.link.relates_to.NOV-162544 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A user with a bolt on with monthly charges access to Bolt on details screen
    To find a user without monthly charge check the response
    /{msisdn}/postpay/boltons or /{msisdn}/prepay/boltons: The boltons without monthly charge are the ones that
    have the field 'monthly_charge' (postpay) or 'charge' (prepay)
    other_affected_versions="2022-13"
    Given user has a bolt on with monthly charge
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "monthly_charge.label" textfield with "Monthly charge" text is displayed
      And the "monthly_charge.value" textfield is displayed
      And the "monthly_charge.sublabel" textfield with "VAT included" text is displayed

  @jira.QANOV-7946 @android @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-7945 @jira.link.detects.O2UK-3816
  @jira.link.relates_to.NOV-100986 @manual @mobile @netcracker @o2uk @regression
  Scenario: A postpay user with an o2 travel bolt on access to Bolt on details screen
    internal_checkpoint="In order to consider a bolt on as O2 Travel Bolt On, the response to the bolt ons APIC must
    contain the field 'product_family' = 'O2TRAVEL'"
    Given user has a "postpay" account type
      And user has a bolt on from the O2 Travel family
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "status.label" textfield with "Status" text is displayed
      And the "status.value" textfield is displayed
      And the "start_date.label" textfield with "Start date" text is displayed
      And the "start_date.value" textfield with the "DD Mmm 'YY" format is displayed
      And the "monthly_charge.label" textfield is not displayed
      And the "learn_more_link" link with "Learn more" text is displayed

  @jira.QANOV-7947 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-7916 @jira.link.relates_to.NOV-162547 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A user with a bolt on having "Learn more" link  access to Bolt on details screen
    Learn more link is extracted from the 'custom_links' element in the reponse to the bolt-ons APIC
    other_affected_versions="2022-13"
    Given user has a bolt on with the fields "learn_more"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "learn_more_link" link with "Learn more" text is displayed

  @jira.QANOV-7948 @android @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-7947 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100983 @manual @mobile @o2uk @regression
  Scenario: A legacy user taps on "Learn more" link at Bolt on details screen
    CERT1: in00322v_036322@o2.com / 07731296918
    - Mobile Broadband: 12oc71800680@stf.ref.o2.co.uk
    - DEV: 121111112@gmail.com
    - Not all boltons have the learn more link
    other_affected_versions="2022-13"
    Given user has a "legacy" account type
      And user has a bolt on with the fields "learn_more"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
      And the "Bolt On Details" page is displayed
      And clicks on the "learn_more_link" link
     Then the browser webview is displayed
      And the "TBD" header is displayed

  @jira.QANOV-7949 @android @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-7947 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.relates_to.NOV-100983 @manual @mobile @o2uk @regression
  Scenario: An AO2 user taps on "Learn more" link at Bolt on details screen
    Given user has a "AO2" account type
      And user has a bolt on with the fields "learn_more"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
      And the "Bolt On Details" page is displayed
      And clicks on the "learn_more_link" link
     Then the browser webview is displayed
      And the "TBD" header is displayed

  @jira.QANOV-84610 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-7916 @jira.link.relates_to.NOV-162547 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A postpay user with a bolt on having "What you get" section access to Bolt on details screen
    Given user has a "postpay" account type
      And user is in the "Bolt Ons" page
      And user has a bolt on with the fields "what_you_get"
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "what_you_get_label" textfield with "What you get" text is displayed
      And the "what_you_get_value" textfield is displayed

  @jira.QANOV-7956 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-7955 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-162552 @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user with a bolt on having renewal date message access to Bolt on details screen
    - Renewal date is only shown in the bolt on card of the 'Your Bolt Ons' screen if the
    renewal_date_message field of the bolt ons APIC response contanins a date.
    - Start will be extracted from status_message string like 'start on DD Mmm 'YY' in the response to the boltons APIC
    endpoint only for boltons in PENDING_ADDITION status
    - The renewal date value will have the date format if it is a date
    other_affected_versions="2022-13"
    Given user has a "legacy prepay" account type
      And user has a bolt on in "active" status
      And user has a bolt on with the fields "renewal_date;NOT expiry_date;NOT start_date"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "renewal_date.label" textfield with "Renewal date" text is displayed
      And the "renewal_date.value" textfield with the "DD Mmm 'YY" format is displayed
      And the "expiry_date.label" textfield is not displayed
      And the "start_date.label" textfield is not displayed

  @jira.QANOV-7959 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-7958 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-162554 @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user with a bolt on not having renewal date message access to Bolt on details screen
    - Bolt Ons without renewal date message do not have 'renewal_date_message' field in the
    response to the boltons APIC endpoint
    other_affected_versions="2022-13"
    Given user has a "legacy prepay" account type
      And user has a bolt on in "pending_to_recharge;pending_to_remove" status
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And the "renewal_date.label" textfield is not displayed

  @jira.QANOV-200603 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141 @automatic @mobile @o2uk @smoke
  @cert0 @cert1 @next @live @qa @webapp
  Scenario: A legacy prepay user with a bolt on in active status can see the details of the bolt on
    other_affected_versions="2022-13"
    Given user has a "legacy prepay" account type
      And user has a bolt on in "active" status
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And no element in the "bolt_on_details_list" list has the value "Status" in the "title" field
      And the "0" index in the "bolt_on_details_list" list has the "title" field with "Cost" text
      And the element in "0" position in the "bolt_on_details_list" list has the "detail" field with the "(£\d+.\d\d one-off|£\d+.\d\d per month|Free)" format
      And the "0" index in the "bolt_on_details_list" list has the "description" field with "VAT included" text

  @jira.QANOV-200604 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141 @automatic @mobile @o2uk @smoke
  @qa @webapp
  Scenario: A legacy prepay user with a bolt on in pending recharge status can see the details of the bolt on
    other_affected_versions="2022-13"
    Given user has a "legacy prepay" account type
      And user has a bolt on in "pending_to_recharge" status
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And no element in the "bolt_on_details_list" list has the value "Status" in the "title" field
      And the "top_up_alert.title" textfield with "Top up to use this Bolt On" text is displayed
      And the "top_up_alert.single_action_link" link with "Top up now" text is displayed
      And the "0" index in the "bolt_on_details_list" list has the "title" field with "Cost" text
      And the element in "0" position in the "bolt_on_details_list" list has the "detail" field with the "(£\d+.\d\d one-off|£\d+.\d\d per month|Free)" format
      And the "0" index in the "bolt_on_details_list" list has the "description" field with "VAT included" text
      And the "what_you_get_textfield" textfield with "What you get" text is displayed

  @jira.QANOV-200605 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141 @impeded_env @mobile @o2uk @smoke
  Scenario: A legacy prepay user with a bolt on in pending recharge status can access the Top up webview from the Bolt on details screen
    other_affected_versions="2022-13"
    Given user has a "legacy prepay" account type
      And user has a bolt on in "pending_to_recharge" status
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
      And the "Bolt On Details" page is displayed
      And clicks on the "top_up_alert.single_action_link" link
     Then the internal webview is displayed
      And the "O2 | My device" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bolt On Details" page is displayed

  @jira.QANOV-200606 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141 @automatic @mobile @o2uk @smoke
  @qa @webapp
  Scenario: A legacy prepay user with a bolt on in pending to remove status can see the details of the bolt on
    other_affected_versions="2022-13"
    Given user has a "legacy prepay" account type
      And user has a bolt on in "pending_to_remove" status
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the element with "title" field with "[CONTEXT:selected_bolton]" value of the "your_boltons.list" list
     Then the "Bolt On Details" page is displayed
      And the "[CONTEXT:selected_bolton]" header is displayed
      And no element in the "bolt_on_details_list" list matches the value "Status" in the "title" field
      And the "1" index in the "bolt_on_details_list" list has the "title" field with "Status details" text
      And the element in "1" position in the "bolt_on_details_list" list has the "description" field with the "To be removed on \d{2} \w{3} '\d{2}" format
      And the "what_you_get_textfield" textfield with "What you get" text is displayed
