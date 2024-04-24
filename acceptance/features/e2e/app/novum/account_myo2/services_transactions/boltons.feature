# -*- coding: utf-8 -*-
@jira.QANOV-7896
Feature: Boltons

  Actions Before the Feature:
    Given user has the "services" module configured in CMS for "dashboard" page
      And user has the "View your Bolt Ons" entrypoint configured in CMS for the "subscription-contract-dashboard" list

  Actions After the Feature:
     Then navigates to "Account" page


  @jira.QANOV-7897 @android @automatic @cert0 @cert1 @ios @jira.cv.10.5 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-162519 @live @mobile @netcracker @next @o2uk @sanity @webapp @ao2_api_issues
  Scenario: A user access to Your Bolt Ons screen from "Manage your account" screen
    commented_tags="@depends_on.NOV-63954"
    Given user has bolt ons
      And user is in the "Services" page
     When clicks on the "view_your_bolt_ons" entrypoint
     Then the "Bolt Ons" page is displayed
      And the "Your Bolt Ons" header is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Services" page is displayed

  @jira.QANOV-7899 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.relates_to.NOV-112168 @live @mobile
  @netcracker @next @o2uk @smoke @webapp
  Scenario: A postpay user with bolt ons can see them in the Bolt ons screen
    Bolt ons APIC postpay endpoint: /{msisdn}/postpay/boltons
    commented_tags="@depends_on.NOV-91957"
    Given user has a "postpay" account type
      And user has bolt ons
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then the "Your Bolt Ons" header is displayed
      And the "header_section.title" textfield with "Need a little bit extra?" text is displayed
      And the "header_section.button" button with "Buy Bolt Ons" text is displayed
      And the "your_boltons.title" textfield with "YOUR CURRENT BOLT ONS" text is displayed
      And the "your_boltons.info_icon" icon is displayed
      And the "your_boltons.list" list is displayed
      And each element in the "your_boltons.list" list has the "title" field
      And each element in the "your_boltons.list" list has the "label" field

  @jira.QANOV-200598 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141 @mobile
  @o2uk @qa @smoke @webapp
  Scenario: A prepay user with bolt ons can see them in the Bolt ons screen
    Bolt ons APIC prepay endpoint: /{msisdn}/prepay/boltons
    other_affected_versions="2022-13"
    Given user has a "prepay" account type
      And user has bolt ons
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then the "Your Bolt Ons" header is displayed
      And the "header_section.title" textfield with "Need a little bit extra?" text is displayed
      And the "header_section.button" button with "Buy Bolt Ons" text is displayed
      And the "your_boltons.title" textfield with "YOUR CURRENT BOLT ONS" text is displayed
      And the "your_boltons.info_icon" icon is displayed
      And the "your_boltons.list" list is displayed
      And each element in the "your_boltons.list" list has the "title" field
      And each element in the "your_boltons.list" list has the "label" field

  @jira.QANOV-7900 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-7899 @jira.link.relates_to.NOV-162521 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A user with bolt ons access to the legal information by tapping the (i) link next to the "Your current Bolt Ons" title in the Your Bolt Ons screen
    Given user has bolt ons
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the "info" icon
     Then the "Bolt Ons Legal Information" internal webview is displayed
      And the "Price information" header is displayed
      And the "info" icon is displayed
      And the "title_text" textfield with "Spend Cap" text is displayed
      And the "legal_text" textfield with "VAT Included. If you have a Spend Cap, the price of the Bolt On will not be included within your Spend Cap." text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bolt Ons" page is displayed

  @jira.QANOV-7903 @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-162558 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A user access to Your Bolt Ons screen without connectivity
    commented_tags="@depends_on.NOV-91957"
    Given user is in the "Services" page
      And user turns on the Airplane mode
     When clicks on the "view_your_bolt_ons" entrypoint
     Then the "No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-7904 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.relates_to.NOV-162548 @live @mobile
  @netcracker @next @o2uk @smoke @webapp
  Scenario: A user without bolt ons can access to Your Bolt Ons screen
    internal_checkpoint="CERT0: paygo2@mailinator.com"
    commented_tags="@depends_on.NOV-91957"
    other_affected_versions="2021-46"
    Given user does not have any bolt on
      And user has the matching subscription selected in the account
      And user is in the "Services" page
     When clicks on the "view_your_bolt_ons" entrypoint
     Then the "Bolt Ons" page is displayed
      And the "header_section.title" textfield with "Need a little bit extra?" text is displayed
      And the "header_section.button" button with "Buy Bolt Ons" text is displayed
      And the "empty_case.icon" icon is displayed
      And the "empty_case.title" textfield with "Your current Bolt Ons" text is displayed
      And the "empty_case.description" textfield with "You don't have any Bolt Ons at the moment" text is displayed

  @jira.QANOV-7905 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-7897
  @jira.link.detects.OBO2UK-1450 @jira.link.parent_test_plan.QANOV-24140 @jira.link.relates_to.NOV-209306 @mobile @o2uk
  @smoke
  Scenario: An AO2 user can access to Buy Bolt Ons webview from Your Bolt Ons screen
    Given user has a "AO2" account type
      And user has the matching subscription selected in the account
      And user is in the "Services" page
      And user is in the "Bolt Ons" page
     When clicks on the "header_section.button" button
     Then the internal webview with "Boltons" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bolt Ons" page is displayed

  @jira.QANOV-7906 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.9 @jira.link.depends_on.QANOV-7897
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-209306 @live @mobile @next @o2uk @smoke
  Scenario: A legacy user can access to Buy Bolt Ons webview from Your Bolt Ons screen
    Given user has a "legacy" account type
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     When clicks on the "header_section.button" button
     Then the internal webview with "Boltons" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bolt Ons" page is displayed

  @jira.QANOV-7912 @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-162523 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user with more than one bolt on in active status can see the Bolt ons screen
    internal_checkpoint="- Bolt ons APIC endpoint: /{msisdn}/postpay/boltons
    - Bolt ons in active status have 'status': 'Active' in the response to the boltons APIC endpoint
    - The bolt ons in active status will be ordered as follow: first, those with expiration date in ascending order,
    second, those with start date (and no expiration date) in ascending order and last, those with no dates information,
    ordered randomly"
    commented_tags="@depends_on.NOV-91957"
    Given user has a "postpay" account type
      And user has several bolt on in "active" status
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then the "boltons" list is displayed
      And the "active_bolton" elements in the "boltons" list are ordered "ascendant" by "expiration_date;start_date"
      And each "active_bolton" element in the "boltons" list has the "status" textfield with "Active" text

  @jira.QANOV-7913 @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-162524 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user with more than one bolt on in pending status can see the Bolt ons screen
    internal_checkpoint="- Bolt ons APIC endpoint: /{msisdn}/postpay/boltons
    Bolt ons in active status have 'status': 'Pending for Addition' in the response to the boltons APIC endpoint"
    commented_tags="@depends_on.NOV-91957"
    Given user has a "postpay" account type
      And user has several bolt on in "pending_to_add" status
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then the "boltons" list is displayed
      And the "pending_bolton" elements in the "boltons" list are ordered "ascendant" by "expiration_date;start_date"
      And each "pending_bolton" element in the "boltons" list has the "status" textfield with "Pending" text

  @jira.QANOV-7914 @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-162525 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user with more than one bolt on in pending to remove status can see the Bolt ons screen
    internal_checkpoint="- Bolt ons APIC endpoint: /{msisdn}/postpay/boltons
    Bolt ons in active status have 'status': 'Pending for removal' in the response to the boltons APIC endpoint"
    commented_tags="@depends_on.NOV-91957"
    Given user has a "postpay" account type
      And user has several bolt on in "pending_to_remove" status
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then the "boltons" list is displayed
      And the "removed_bolton" elements in the "boltons" list are ordered "ascendant" by "expiration_date;start_date"
      And each "removed_bolton" element in the "boltons" list has the "status" textfield with "Removed by you" text

  @jira.QANOV-7916 @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-162536 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user with bolt ons in Active, Pending to add and Pending to remove status can see the Bolt ons screen
    commented_tags="@depends_on.NOV-91957"
    CERT0: testinguser1@o2.com (07801003168) (29/07/2021)
    Given user has a "postpay" account type
      And user has a bolt on in "active" status
      And user has a bolt on in "pending_to_add" status
      And user has a bolt on in "pending_to_remove" status
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then the "boltons" list is displayed
      And the "boltons" list is ordered by the "active_bolton;pending_bolton;removed_bolton" priorities

  @jira.QANOV-7917 @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-162526 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user with a bolt on having expirity date & start date can see it in the Bolt Ons screen
    CERT0 user: 447568415477 / 12oc72476237@stf.ref.o2.co.uk
    testinguser1@o2.com (07801003168) (29/07/2021)
    commented_tags="@depends_on.NOV-91957"
    Given user has a "postpay" account type
      And user has a bolt on with the fields "expiry_date;start_date"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then an element in the "boltons" list has the "name" field with "[CONTEXT:selected_bolton.name]" value
      And the "[CONTEXT:boltons.element]" element has the textfield with "Expires on DD Mmm'YY" format

  @jira.QANOV-7919 @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-162528 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user with a bolt on having only expiry date can see it in the Your Bolt Ons screen
    commented_tags="@depends_on.NOV-91957"
    Given user has a "postpay" account type
      And user has a bolt on with the fields "expiry_date;NOT start_date"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then an element in the "boltons" list has the "name" field with "[CONTEXT:selected_bolton.name]" value
      And the "[CONTEXT:boltons.element.expiry_date]" element has the textfield with "Expires on DD Mmm'YY" format
      And the "[CONTEXT:boltons.element.start_date]" element is not displayed

  @jira.QANOV-7921 @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-162530 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user with a bolt on having only start date can see it in the Your Bolt Ons screen
    commented_tags="@depends_on.NOV-91957"
    CERT0: testinguser1@o2.com (07801003168) (29/07/2021)
    Given user has a "postpay" account type
      And user has a bolt ons with the fields "NOT expiry_date;start_date"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then an element in the "boltons" list has the "name" field with "[CONTEXT:selected_bolton.name]" value
      And the "[CONTEXT:boltons.element.start_date]" element has the textfield with "Starts DD Mmm'YY" format
      And the "[CONTEXT:boltons.element.expiry_date]" element is not displayed

  @jira.QANOV-7924 @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-162532 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user with a bolt on not having start or expiry date can see it in the Your Bolt Ons screen
    internal_checkpoint="CERT0 user: 447568415307 / in06427n_660108@o2.com"
    commented_tags="@depends_on.NOV-91957"
    Given user has a "postpay" account type
      And user has a bolt on without the fields "expiry_date;start_date"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then an element in the "boltons" list has the "name" field with "[CONTEXT:selected_bolton.name]" value
      And the "[CONTEXT:boltons.element.start_date]" element is not displayed
      And the "[CONTEXT:boltons.element.expiry_date]" element is not displayed

  @jira.<jira_id> @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-162541 @manual @mobile @netcracker @o2uk
  @regression
  Scenario Outline: A postpay user with a bolt on having price <price> can see it in the Your Bolt Ons screen
    commented_tags="@depends_on.NOV-91957"
    internal_checkpoint="The step:
    user has a bolt on with '<price>' monthly charge
    means that the API is returning a price with value 0 or >0, if the API doesn't return any monthly charge value,
    no price will be displayed"
    Given user has a "postpay" account type
      And user has a bolt on with "<price>" monthly charge
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then an element in the "boltons" list has the "name" field with "[CONTEXT:selected_bolton.name]" value
      And the "[CONTEXT:boltons.element.monthly_charge]" element has the textfield with "<format>" format

    Examples:
          | price | format | jira_id    |
          | 0     | £0.00  | QANOV-7941 |
          | >0    | £XX.XX | QANOV-7942 |

  @jira.QANOV-7943 @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-162543 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user with a bolt on not having price can see it in the Bolt Ons screen
    commented_tags="@depends_on.NOV-91957"
    internal_checkpoints="To find a user without monthly charge check the response
    /{msisdn}/postpay/boltons or /{msisdn}/prepay/boltons: The boltons without monthly charge are the ones that
    doesn't have the field 'monthly_charge' (postpay) or 'charge' (prepay)"
    Given user has a "postpay" account type
      And user has a bolt on without monthly charge
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then an element in the "boltons" list has the "name" field with "[CONTEXT:selected_bolton.name]" value
      And the "[CONTEXT:boltons.element.monthly_charge]" element is not displayed

  @jira.QANOV-7945 @android @ios @jira.cv.11.5 @jira.link.detects.O2UK-3816 @jira.link.relates_to.NOV-162546 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A user with an o2 travel bolt on can see it in the Bolt Ons screen
    internal_checkpoint="In order to consider a bolt on as O2 Travel Bolt On, the response to the bolt ons APIC must
    contain the field 'product_family' = 'O2TRAVEL'"
    commented_tags="@depends_on.NOV-91957"
    Given user has a bolt on from the O2 Travel family
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then an element in the "boltons" list has the "name" field with "[CONTEXT:selected_bolton.name]" value
      And the "[CONTEXT:boltons.element.monthly_charge]" element is not displayed

  @jira.QANOV-7961 @android @ios @jira.cv.9.12 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-17565
  @manual @mobile @o2uk @regression
  Scenario: A legacy postpay user with recommendations from the OB add boltons after bill paid
    internal_checkpoint="- CERT0: rbmuatlokesh_donotusee2113@stf.ref.o2.co.uk
    inl_may8842@o2.com (29/07/2021)
    - DEV: 111112189@gmail.com, 447711111111@gmail.com
    - We can search users with extraChargesRecommendation in bill_profile table.
    - Typical case where the OB has recommendations: if the average consumption of last months is over the contracted
    bundles)"
    Given user has a "legacy postpay" account type
      And user has latest airtime bill in "paid" status
      And user has "boltons" recommendations in bill
      And user has the matching subscription selected in the account
      And user is in the "Latest Airtime Bill" page
     When clicks on the "add_boltons" button
     Then the internal webview is displayed
      And the "O2 | My device" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Latest Airtime Bill" page is displayed

  @jira.QANOV-7966 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.6
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-80896 @manual @mobile @o2uk @regression
  Scenario: A legacy postpay can add bolt ons to his companion device from latest airtime bill details
    internal_checkpoint="- The option to change his tariff depends on the OB sending the action 'action': 'ADD_BOLTONS',
    in the extraChargesRecommendation element of the response to /{msisdn}/postpay/bill/profile"
    Given user has a "legacy companion" account type
      And user has "boltons" recommendations in bill
      And user has the matching subscription selected in the account
      And user is in the "Latest Airtime Bill" page
     When clicks on the "add_boltons" button
     Then the internal webview is displayed
      And the "O2 | My device" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Latest Airtime Bill" page is displayed

  @jira.QANOV-7950 @android @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-162545
  @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user with more than one bolt on in active status can see them in the Bolt ons screen
    - Bolt ons APIC endpoint: /{msisdn}/prepay/boltons
    - Bolt ons in active status have 'status': 'Active' in the response to the boltons APIC endpoint
    - Bolt ons will be ordered as follow: first, those with expiration date in ascending order, second, those with start
    date (and no expiration date) in ascending order, third, those with renewal date (and no expiration or start date)
    in ascending order and last, those with no dates information, ordered randomly
    - CERT0: good@test.com
    commented_tags="@depends_on.NOV-91957"
    other_affected_versions="2022-13"
    Given user has a "legacy prepay" account type
      And user has several bolt on in "active" status
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then the "boltons" list is displayed
      And each "active_bolton" element in the "boltons" list has the "status" textfield with "Active" text
      And the "active_bolton" elements in the "boltons" list are ordered "ascendant" by "expiration_date;start_date;renewal_date"

  @jira.QANOV-7952 @android @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-162549
  @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user with more than one bolt on in pending status access to Your Bolt Ons screen from "manage your account" section of the account dashboard
    - Bolt ons APIC endpoints: /{msisdn}/prepay/boltons
    - Bolt ons in pending status have 'status': 'PENDING_RECHARGE' in the response to the boltons APIC endpoint
    - Bolt ons will be ordered as follow: first, those with expiration date in ascending order, second, those with start
    date (and no expiration date) in ascending order, third, those with renewal date (and no expiration or start date)
    in ascending order and last, those with no dates information, ordered randomly
    commented_tags="@depends_on.NOV-91957"
    other_affected_versions="2022-13"
    Given user has a "legacy prepay" account type
      And user has several bolt on in "pending_recharge" status
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then the "boltons" list is displayed
      And each "pending_bolton" element in the "boltons" list does not have the "status" textfield
      And each "pending_bolton" element in the "boltons" list has the "description" textfield with "Top up to use this Bolt On" text
      And the "pending_bolton" elements in the "boltons" list are ordered "ascendant" by "expiration_date;start_date;renewal_date"

  @jira.QANOV-7953 @android @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-162550
  @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user with more than one bolt on in pending to remove status can see them in the Bolt ons screen
    - Bolt ons APIC endpoints: /{msisdn}/prepay/boltons
    - Bolt ons in 'removed by you' status have 'status': 'Pending for removal' in the response to the boltons APIC
    endpoint
    - Removed status depends on the operator systems. Many prepay bolt-ons do not go through this state when removed
    - Bolt ons will be ordered as follow: first, those with expiration date in ascending order, second, those with start
    date (and no expiration date) in ascending order, third, those with renewal date (and no expiration or start date)
    in ascending order and last, those with no dates information, ordered randomly
    commented_tags="@depends_on.NOV-91957"
    other_affected_versions="2022-13"
    Given user has a "legacy prepay" account type
      And user has several bolt on in "pending_to_remove" status
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then the "boltons" list is displayed
      And each "removed_bolton" element in the "boltons" list does not have the "status" textfield
      And each "removed_bolton" element in the "boltons" list has the "description" textfield with the "To be removed on \d{2} \w{3} '\d{2}" format
      And the "removed_bolton" elements in the "boltons" list are ordered "ascendant" by "expiration_date;start_date;renewal_date"

  @jira.QANOV-242627 @android @ios @jira.cv.12.5 @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user with more than one bolt on in rolledover topup status can see them in the Bolt ons screen
    - Bolt ons APIC endpoints: /{msisdn}/prepay/boltons
    - Bolt ons in 'removed by you' status have 'status': 'Pending for removal' in the response to the boltons APIC
    endpoint
    - Removed status depends on the operator systems. Many prepay bolt-ons do not go through this state when removed
    - Bolt ons will be ordered as follow: first, those with expiration date in ascending order, second, those with start
    date (and no expiration date) in ascending order, third, those with renewal date (and no expiration or start date)
    in ascending order and last, those with no dates information, ordered randomly
    commented_tags="@depends_on.NOV-91957"
    other_affected_versions="2022-29"
    Given user has a "legacy prepay" account type
      And user has several bolt on in "rolledover_topup" status
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then the "boltons" list is displayed
      And each "removed_bolton" element in the "boltons" list has the "description" textfield with the "Carried over" format
      And the "removed_bolton" elements in the "boltons" list are ordered "ascendant" by "expiration_date;start_date;renewal_date"

  @jira.QANOV-244188 @android @ios @jira.cv.12.5 @manual @mobile @o2uk @regression
  Scenario: An AO2 postpay user with more than one bolt on in rolledover topup status can see them in the Bolt ons screen
    other_affected_versions="2022-29"
    Given user has a "ao2 postpay" account type
      And user has several bolt on in "rolledover_topup" status
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then the "boltons" list is displayed
      And each "removed_bolton" element in the "boltons" list has the "status" textfield
      And each "removed_bolton" element in the "boltons" list has the "description" textfield with the "Carried over" format
      And the "removed_bolton" elements in the "boltons" list are ordered "ascendant" by "expiration_date;start_date;renewal_date"

  @jira.QANOV-7954 @android @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-162719
  @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user with a bolt on having start date (and no expiry date) can see it in the Bolt Ons screen
    - Start date will be extracted from status_message string like 'start on DD Mmm 'YY' in the
    response to the boltons APIC endpoint only for boltons in PENDING_ADDITION status
    commented_tags="@depends_on.NOV-91957"
    other_affected_versions="2022-13"
    Given user has a "legacy prepay" account type
      And user has a bolt on in "active" status
      And user has a bolt ons with the fields "NOT expiry_date;start_date"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then an element in the "boltons" list has the "name" field with "[CONTEXT:selected_bolton.name]" value
      And the "[CONTEXT:boltons.element.start_date]" element has the textfield with "Starts DD Mmm'YY" format

  @jira.QANOV-7955 @android @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-162551
  @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user with a bolt on having renewal date (and no start neither expiry dates) can see it in the Bolt Ons screen
    - Renewal date is only shown in the bolt on card of the 'Your Bolt Ons' screen if the
    renewal_date_message field of the bolt ons APIC response contanins a date.
    - Start will be extracted from status_message string like 'start on DD Mmm 'YY' in the response to the boltons APIC
    endpoint only for boltons in PENDING_ADDITION status
    commented_tags="@depends_on.NOV-91957"
    other_affected_versions="2022-13"
    Given user has a "legacy prepay" account type
      And user has a bolt on in "active" status
      And user has a bolt ons with the fields "renewal_date;NOT expiry_date;NOT start_date"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then an element in the "boltons" list has the "name" field with "[CONTEXT:selected_bolton.name]" value
      And the "[CONTEXT:boltons.element.renewal_date]" element has the textfield with "Renewal Date DD Mmm'YY" format

  @jira.QANOV-7958 @android @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-162553
  @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user with a bolt on not having date information can see it in the Bolt Ons screen
    - Bolt Ons without renewal date do not have a date in 'renewal_date_message' field in the
    response to the boltons APIC endpoint.
    - Start date will be extracted from status_message string like 'start on DD Mmm 'YY' in the response to the boltons
    APIC endpoint only for boltons in PENDING_ADDITION status
    commented_tags="@depends_on.NOV-91957"
    other_affected_versions="2022-13"
    Given user has a "legacy prepay" account type
      And user has a bolt on in "active" status
      And user has a bolt ons with the fields "NOT renewal_date;NOT expiry_date;NOT start_date"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then an element in the "boltons" list has the "name" field with "[CONTEXT:selected_bolton.name]" value
      And the "[CONTEXT:boltons.element.start_date]" element is not displayed
      And the "[CONTEXT:boltons.element.expiry_date]" element is not displayed
      And the "[CONTEXT:boltons.element.renewal_date]" element is not displayed

  @jira.<jira_id> @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy prepay user with a <bolton_type> bolton status can see a copy to distinguish it
    other_affected_versions="2022-13"
    Given user has a "legacy prepay" account type
      And user has a "<bolton_type>" bolt on
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then the element in the "boltons_list" list with "[CONTEXT:bolton_name]" text in the "name" textfield have the "price" textfield with the "<price_format>" format

    Examples:
          | bolton_type | price_format        | jira_id      |
          | one_off     | £\d+.\d\d one-off   | QANOV-200599 |
          | monthly     | £\d+.\d\d per month | QANOV-200600 |
          | free        | Free                | QANOV-200601 |

  @jira.QANOV-387399 @android @ios @jira.cv.14.5 @manual @mobile @o2uk @smoke @cert0 @cert1 @ber
  Scenario: A legacy user won't be able to see specific boltons defined for the Williams/Aviator project
    Aviator ids: 18643 and 18644 (ttaa06283552@stf.ref.o2.co.uk/test123), Williams ids: 18705
    Given user has a "legacy" account type
      And user has a bolt on with any ids in "18643;18644;18705"
      And user has the matching subscription selected in the account
      And user is in the "Bolt Ons" page
     Then no element in the "boltons" list has the "name" field with any "[CONTEXT:selected_boltons_name_list]" value