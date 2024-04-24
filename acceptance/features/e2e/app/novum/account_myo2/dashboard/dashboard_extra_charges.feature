# -*- coding: utf-8 -*-
@jira.QANOV-5204
Feature: Dashboard Extra Charges


  @jira.<jira_id> @android @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100863
  @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can check the details of their Extra Charges without bills yet
    CERT1: inaveglg_762111@o2.com
    CERT0: abc@dhdd.com (MBB), cpwtest09061054@stf.ref.o2.co.uk (PAYM), snow95261243@stf.ref.o2.co.uk (companion)
    other_affected_versions="2021-46"
    Given user has a "<account_type>" account type
      And user has no bills
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "extra_charges" entrypoint
     Then the "Extra Charges" page is displayed
      And the "Recent charges" header is displayed
      And the "recent_charges_list" list with "<charges_type_list>" entrypoints is displayed
      And each element in the "recent_charges_list" list has the "cost" textfield with the "£X.XX" format
      And the "charges_when_abroad" element in the "recent_charges_list" list has the "chevron" icon
      And the elements in the "recent_charges_list" list with "chevron" are clickable
      And the "total_recent_charges_textfield" textfield with "Total recent charges" text is displayed
      And the "total_recent_charges_amount" textfield with the "£X.XX" format is displayed
      And the "what_are_link" link with "What are recent charges?" text is displayed
      And the "message" textfield with "UK data will be updated within 30 minutes. All UK calls and messages can take up to 12 hours, international calls may take longer. VAT not included" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | account_type     | charges_type_list                                                                             | jira_id    |
          | legacy PAYM      | Minutes;Messages;Data;Charges when abroad;Premium & information services;Things you've bought | QANOV-5248 |
          | legacy MBB       | Minutes;Messages;Data;Charges when abroad;Premium & information services;Things you've bought | QANOV-5249 |
          | legacy companion | Data;Charges when abroad                                                                      | QANOV-5250 |

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-100931 @mobile @o2uk @sanity @webapp
  Scenario Outline: A <account_type> user with extra charges can access the Recent Charges screen
    internal_checkpoint="Users will have standard rates available if there is a _links element in the response to
    postpay/tariff API. The link points to the specific request to be done to the postpay/tariffdetails API to
    retrieve the standard rates information.
    CERT2: 447711111111@gmail.com/447812123456@gmail.com - > with standard rates
    121111112@gmail.com -> without standard rates
    CERT1:07521129227 without standar rates
    CERT1: inl_may8842@o2.com (07521130461) with standard rates (campaign 10.4)
    CERT0: testuser31@o2.com,  gb083240_785792@o2.com (without standard rates)
    MBB (CERT0): 12oc71800680@stf.ref.o2.co.uk (07568411805)
    multiMSISDN kaylan@gmail.com (07521004675)
    singleMSISDN rbmuatlokesh_donotusee2113@stf.ref.o2.co.uk"
    Given user has a "<account_type>" account type
      And user has "any" recent charges
      And user <has_view_standard> the "view_standard_rates" link available
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "extra_charges" entrypoint
     Then the "Extra Charges" page is displayed
      And the "recent_charges_title" textfield with "EXTRA CHARGES" text is displayed
      And the "recent_charges_list" list has the "Minutes;Messages;Data;Charges when abroad;Premium & information services;Things you’ve bought" textfields displayed in the "title" field
      And each element in the "recent_charges_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And the "title" field with "Charges when abroad" text element in the "recent_charges_list" list has the "chevron" icon
      And the elements in the "recent_charges_list" list with "chevron" are clickable
      And the "total_recent_charges_textfield" textfield with "Total recent charges" text is displayed
      And the "total_recent_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "what_are_link" link with "What are recent charges?" text is displayed
      And the "view_standard_rates_link" link <view_standard_rates_link_displayed>
      And the "message" textfield with "UK data will be updated within 30 minutes. All UK calls and messages can take up to 12 hours, international calls may take longer. VAT not included." text is displayed

    @cert0 @cert1
    Examples:
          | account_type | has_view_standard | view_standard_rates_link_displayed           | ber | jira_id    |
          | legacy PAYM  | has               | with "View standard rates" text is displayed | ber | QANOV-5251 |
          | legacy MBB   | has               | with "View standard rates" text is displayed |     | QANOV-5253 |

    @qa
    Examples:
          | account_type | has_view_standard | view_standard_rates_link_displayed | ber | jira_id    |
          | legacy PAYM  | has not           | is not displayed                   |     | QANOV-5252 |
          | legacy MBB   | has not           | is not displayed                   |     | QANOV-5254 |

  @jira.<jira_id> @<automation> @<ber> @<execution_mode> @<impeded_label> @<test_priority> @android @cert0 @cert1 @ios
  @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100878 @mobile @o2uk
  Scenario Outline: A legacy postpay user with a companion device can see the extra charges details of their companion device
    internal_checkpoint="CERT0: acce03103829@stf.ref.o2.co.uk (user with the link available)
    NOTE: In DEV environment the users could be faked and could shown other categories. The categories related to data are mandatory."
    commented_tags="@depends_on.NOV-80884"
    Given user has a "legacy companion" account type
      And user <has_view_standard> the "view_standard_rates" link available
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "extra_charges" entrypoint
     Then the "Extra Charges" page is displayed
      And the "Recent charges" header is displayed
      And the "recent_charges_title" textfield with "EXTRA CHARGES" text is displayed
      And the "recent_charges_list" list with "Data;Charges when abroad" entrypoints is displayed
      And each element in the "recent_charges_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And the "title" field with "Charges when abroad" text element in the "recent_charges_list" list has the "chevron" icon
      And the elements in the "recent_charges_list" list with "chevron" are clickable
      And the "total_recent_charges_textfield" textfield with "Total recent charges" text is displayed
      And the "total_recent_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "what_are_link" link with "What are recent charges?" text is displayed
      And the "view_standard_rates_link" link <view_standard_rates_link_displayed>
      And the "message" textfield with "UK data will be updated within 30 minutes. All UK calls and messages can take up to 12 hours, international calls may take longer. VAT not included." text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | has_view_standard | view_standard_rates_link_displayed           | ber | test_priority | execution_mode | automation              | impeded_label | jira_id    |
          | has               | with "View standard rates" text is displayed | ber | smoke         | automatic      |                         |               | QANOV-5255 |
          | has not           | is not displayed                             |     | regression    | manual         | automation.pending_mock | impeded_mock  | QANOV-5256 |

  @jira.<jira_id> @<automation> @<ber> @<execution_mode> @<impeded_label> @android @cert0 @cert1 @ios @jira.cv.11.1
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-100931 @live
  @mobile @next @o2uk @regression @webapp
  Scenario Outline: A <account_type> user without extra charges can access the Recent Charges screen
    internal_checkpoint="Users will have standard rates available if there is a _links element in the response to
    postpay/tariff API. The link points to the specific request to be done to the postpay/tariffdetails API to
    retrieve the standard rates information.
    CERT2: 447711111111@gmail.com/447812123456@gmail.com - > with standard rates
    121111112@gmail.com -> without standard rates
    CERT1:07521129227 without standar rates
    CERT1: inl_may8842@o2.com (07521130461) with standard rates (campaign 10.4)
    CERT0: testuser31@o2.com
    multiMSISDN kaylan@gmail.com (07521004675)
    singleMSISDN rbmuatlokesh_donotusee2113@stf.ref.o2.co.uk"
    Given user has a "<account_type>" account type
      And user has "none" recent charges
      And user <has_view_standard> the "view_standard_rates" link available
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "extra_charges" entrypoint
     Then the "Extra Charges" page is displayed
      And the "recent_charges_title" textfield with "EXTRA CHARGES" text is displayed
      And the "recent_charges_list" list has the "Minutes;Messages;Data;Charges when abroad;Premium & information services;Things you’ve bought" textfields displayed in the "title" field
      And each element in the "recent_charges_list" list has the "cost" textfield with "£0.00" text
      And the "title" field with "Charges when abroad" text element in the "recent_charges_list" list has the "chevron" icon
      And the elements in the "recent_charges_list" list with "chevron" are clickable
      And the "total_recent_charges_textfield" textfield with "Total recent charges" text is displayed
      And the "total_recent_charges_amount" textfield with "£0.00" text is displayed
      And the "what_are_link" link with "What are recent charges?" text is displayed
      And waits until the "view_standard_rates_link" element is visible
      And the "view_standard_rates_link" link <view_standard_rates_link_displayed>
      And the "message" textfield with "UK data will be updated within 30 minutes. All UK calls and messages can take up to 12 hours, international calls may take longer. VAT not included." text is displayed

    Examples:
          | account_type | has_view_standard | view_standard_rates_link_displayed           | ber | execution_mode | automation              | impeded_label | jira_id    |
          | legacy PAYM  | has               | with "View standard rates" text is displayed | ber | automatic      |                         |               | QANOV-5257 |
          | legacy PAYM  | has not           | is not displayed                             |     | manual         | automation.pending_mock | impeded_mock  | QANOV-5258 |
          | legacy MBB   | has               | with "View standard rates" text is displayed |     | automatic      |                         |               | QANOV-5259 |
          | legacy MBB   | has not           | is not displayed                             |     | manual         | automation.pending_mock | impeded_mock  | QANOV-5260 |

  @jira.<jira_id> @android @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-5254 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-101236 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see their charges when they have a tariff without <allowance_type>
    internal_checkpoint="CERT0: inaveglg_762111@o2.com
    PAYM without allowances: cusera7@o2.com (7568421641) (2021/07/06)
    MBB without messages and data: 12oc90377544@stf.ref.o2.co.uk(7568410358) (2021/07/06)"
    Given user has a "<account_type>" account type
      And user has not "<allowance_type>" allowances in the tariff
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "extra_charges" entrypoint
     Then the "Extra Charges" page is displayed
      And the "Recent charges" header is displayed
      And the "recent_charges_title" textfield with "EXTRA CHARGES" text is displayed
      And the "recent_charges_list" list with "<recent_charges_list>" entrypoints is displayed
      And each element in the "recent_charges_list" list has the "cost" textfield with the "£X.XX" format
      And the "charges_when_abroad" element in the "recent_charges_list" list has the "chevron" icon
      And the elements in the "recent_charges_list" list with "chevron" are clickable
      And the "total_recent_charges_textfield" textfield with "Total recent charges" text is displayed
      And the "total_recent_charges_amount" textfield with the "£X.XX" format is displayed
      And the "what_are_link" link with "What are recent charges?" text is displayed
      And the "message" textfield with "UK data will be updated within 30 minutes. All UK calls and messages can take up to 12 hours, international calls may take longer. VAT not included" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | account_type | allowance_type | recent_charges_list                                                                           | jira_id    |
          | legacy PAYM  | minutes        | Minutes;Messages;Data;Charges when abroad;Premium & information services;Things you've bought | QANOV-5262 |
          | legacy PAYM  | messages       | Minutes;Messages;Data;Charges when abroad;Premium & information services;Things you've bought | QANOV-5263 |
          | legacy MBB   | messages       | Messages;Data;Charges when abroad;Premium & information services;Things you've bought         | QANOV-5265 |

    @automation.pending_mock @impeded_mock
    Examples:
          | account_type | allowance_type | recent_charges_list                                                                           | jira_id    |
          | legacy PAYM  | data           | Minutes;Messages;Data;Charges when abroad;Premium & information services;Things you've bought | QANOV-5261 |
          | legacy MBB   | data           | Messages;Data;Charges when abroad;Premium & information services;Things you've bought         | QANOV-5264 |

  @jira.<jira_id> @android @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-91704
  @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user cannot tap on <recent_charges_type> entrypoint in the Charges when abroad screen if they do not have events for this kind of charges
    internal_checkpoint="CERT0: testuser4@o2.com"
    Given user has a "<account_type>" account type
      And user has "any" events in the "charges when abroad" category of recent charges
      And user has "none" events in the "<recent_charges_type>" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Charges When Abroad Extra Charges" page
     Then the "international_charges_list" list is displayed
      And the "<list_entrypoint>" element in the "international_charges_list" list is not clickable
      And the "<list_entrypoint>" element in the "international_charges_list" list has not the "chevron" icon

    Examples:
          | account_type   | recent_charges_type    | list_entrypoint        | jira_id    |
          | legacy PAYM    | international minutes  | international_minutes  | QANOV-5266 |
          | legacy PAYM    | international messages | international_messages | QANOV-5267 |
          | legacy MBB     | international messages | international_messages | QANOV-5268 |
          | legacy postpay | international data     | international_data     | QANOV-5269 |

  @jira.QANOV-5270 @android @automatic @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-5254
  @jira.link.depends_on.QANOV-5260 @jira.link.relates_to.NOV-100924 @live @mobile @netcracker @next @o2uk @regression
  Scenario: A postpay user can get more info about the Extra charges
    Given user has a "postpay" account type
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "what_are_link" link
     Then the "What Are Recent Charges" page is displayed
      And the "Recent charges" header is displayed
      And the "what_are_title" textfield with "What are recent charges" text is displayed
      And the "what_are_info" textfield is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-5254 @jira.link.depends_on.QANOV-5260
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-101031 @manual @mobile @netcracker @o2uk @smoke
  Scenario Outline: A <account_type> user can get more info about the standard rates
    internal_checkpoint="Users will have standard rates available if there is a _links element in the response to
    postpay/tariff API. The link points to the specific request to be done to the postpay/tariffdetails API to
    retrieve the standard rates information.
    CERT2: 447711111111@gmail.com
    CERT1/CERT0: inl_may8842@o2.com (07521130461) (campaign 10.4), 07568410012,
    stester116e936cd1-dffc-4c9e-9909-af2ffc41467a@gmail.com, abc@dhdd.com (MBB)"
    Given user has a "<account_type>" account type
      And user has the "view_standard_rates" link available
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "view_standard_rates_link" link
     Then the "Standard Rates" page is displayed
      And the "Standard rates" header is displayed
      And the "standard_rates_list" list containing some of the "<fields>" textfields is displayed
      And each element in the "standard_rates_list" has the "price" textfield with the "{N p/Free}" format
      And the "description" module with "STANDARD RATES" title is displayed
      And the "description.text" textfield with "Charges for minutes, texts and data outside your tariff and Bolt On allowances. Charges are per minute unless noted and they include VAT" text is displayed

    Examples:
          | account_type | fields                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | jira_id    |
          | legacy PAYM  | Mobile internet over GSM;MMS (per message);Voicemail 901 peak;peak standard calls;O2 to O2 peak UK;Voicemail 901 off peak;Off-peak standard calls;O2 to O2 weekend UK;Xnet peak calls;Voicemail 901 weekend;Access charge for service numbers;O2 to O2 pff-peak UK;Text (per message);Xnet off-peak calls;Xnet weekend calls;Weekend standard calls;Voice Call;Standard non-emergency (101);Access Charge for 084, 087, 09 or 118 numbers;0800 / 0808;Directory Enquiries (118402);Text message (SMS);Picture Message (MMS) | QANOV-5272 |
          | legacy MBB   | Mobile internet over GSM;MMS (per message);Access charge for service numbers;Text (per message);Voice Call;Standard non-emergency (101);Access Charge for 084, 087, 09 or 118 numbers;0800 / 0808;Directory Enquiries (118402);Text message (SMS);Picture Message (MMS)                                                                                                                                                                                                                                                     | QANOV-5273 |

  @jira.QANOV-178919 @android @ios @jira.cv.14.4 @jira.parent_test_plan.QANOV-132515 @jira.parent_test_plan.QANOV-178803
  @manual @mobile @o2uk @smoke
  Scenario: An AO2 user with Standard rates link can access the Standard Rates webview
    Given user has a "AO2 postpay" account type
      And user has the "view_standard_rates" link available
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "view_standard_rates_link" link
     Then the internal webview is displayed
      And the "Tariff details" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Extra Charges" page is displayed

  @jira.<jira_id> @<ber> @android @automatic @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-5254
  @jira.link.detects.O2UK-3297 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100923 @mobile @o2uk
  @smoke
  Scenario Outline: A <account_type> user can see the details of the "Charges when abroad" recent charges
    internal_checkpoint="CERT2: 121111112@gmail.com
    CERT1: testinguser1@o2.com / 7801003168, testuser31@o2.com"
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "charges_when_abroad_entrypoint" entrypoint
     Then the "Charges When Abroad Extra Charges" page is displayed
      And the "Charges when abroad" header is displayed
      And the "international_charges_list" list has the "<international_charges_list>" textfields displayed in the "title" field
      And each element in the "international_charges_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And the elements in the "international_charges_list" list with "chevron" are clickable
      And the "more_about_international_charges_link" link with "More about international charges" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

    Examples:
          | account_type     | international_charges_list                                      | ber | jira_id    |
          | legacy PAYM      | International minutes;International messages;International data | ber | QANOV-5274 |
          | legacy MBB       | International minutes;International messages;International data |     | QANOV-5275 |
          | legacy companion | International data                                              |     | QANOV-5276 |

  @jira.QANOV-5277 @android @ios @jira.cv.9.11 @jira.link.depends_on.QANOV-5276 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100922 @manual @mobile @o2uk @smoke
  Scenario: A legacy user can see the details of "International minutes" recent charges
    NOTE: for premium international calls, the call icon will have
    a star on its left and a view details link will appear at the end.
    - CERT0: gb083240_785792@o2.com
    - CERT1: testuser28@o2.com, testuser31@o2.com
    - CERT2/DEV: 447711111121@gmail.com
    Given user has a "legacy PAYM" account type
      And user has "charged" events in the "international_minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Charges When Abroad Extra Charges" page
     When clicks on the "international_minutes_entrypoint" entrypoint
     Then the "International Minutes Recent Charges" page is displayed
      And the "International minutes" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "consumption_graph" graph is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "daily_charges" bar is displayed for each day in the "y" axis of the "consumption_graph" graph
      And the selected day line is displayed in the "last" day of the "consumption_graph" graph
      And the "consumption_graph.y.selected_day_label" textfield with the "\d+ [A-z]{3} · £\d+.\d\d" format is displayed
      And the "average_usage_label" textfield with "Average usage in period" text is displayed
      And the "average_usage_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "call_direction_icon" field
      And each element in the "events_list" list has the "phonenumber" field
      And each element in the "events_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And each element in the "events_list" list has the "time_stamp" field
      And each element in the "events_list" list has the "direction" field
      And each element in the "events_list" list has the "country_code" field
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad Extra Charges" page is displayed

  @jira.QANOV-5278 @android @ios @jira.cv.9.11 @jira.link.depends_on.QANOV-5276 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100922 @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the "International minutes" late landing extra charges
    CERT0: gb083240_785792@o2.com
    CERT1: testuser28@o2.com, testuser31@o2.com
    CERT2/DEV:447711111121@gmail.com
    Given user has a "legacy PAYM" account type
      And user has late landing charges in the "international minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Charges When Abroad Extra Charges" page
     When clicks on the "international_minutes" entrypoint
     Then the "International Minutes Recent Charges" page is displayed
      And the "International minutes" header is displayed
      And the "late_landing_module" module is displayed
      And the "late_landing_module.title" textfield with "Late landing charges" text is displayed
      And the "late_landing_module.amount" textfield with the "£\d+.\d\d" format is displayed
      And the "late_landing_module.description" textfield with "Charges from previous bills charged now" text is displayed
      And the "events_list" list is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad Extra Charges" page is displayed

  @jira.QANOV-5279 @android @ios @jira.cv.9.11 @jira.link.depends_on.QANOV-5276 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100922 @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the "International minutes" premium calls
    Given user has a "legacy PAYM" account type
      And user has "premium calls" type of "international minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "International Minutes Recent Charges" page
     Then the "[CONTEXT:extra_charges_event_list.element.call_direction_star]" icon is displayed
      And the "[CONTEXT:extra_charges_event_list.element.phonenumber]" textfield is displayed
      And the "[CONTEXT:extra_charges_event_list.element.cost]" textfield with the "£X.XX" format is displayed
      And the "[CONTEXT:extra_charges_event_list.element.time_stamp]" textfield is displayed
      And the "[CONTEXT:extra_charges_event_list.element.direction]" textfield is displayed
      And the "[CONTEXT:extra_charges_event_list.element.country_code]" textfield is displayed
      And the "[CONTEXT:extra_charges_event_list.element.call_type]" textfield containing "Premium services" text is displayed
      And the "[CONTEXT:extra_charges_event_list.element.premium_description]" textfield is displayed
      And the "[CONTEXT:extra_charges_event_list.element.view_details]" link with "View details" text is displayed

  @jira.QANOV-5280 @android @ios @jira.cv.9.11 @jira.link.depends_on.QANOV-5276 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100922 @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the details of the "International minutes" extra charges when user has no charged events
    internal_checkpoint="CERT1: testuser28@o2.com, testuser31@o2.com
    CERT2/DEV: 447711111121@gmail.com"
    Given user has a "legacy PAYM" account type
      And user has "non_charged" events in the "international minutes" category of recent charges
      And user has not "charged" events in the "international minutes" category of recent charges
      And user has not stored in the phonebook any phone number displayed in the "international minutes" events
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Charges When Abroad Extra Charges" page
     When clicks on the "international_minutes" entrypoint
     Then the "International Minutes Recent Charges" page is displayed
      And the "International minutes" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with "£0.00" text is displayed
      And the "consumption_graph" graph is not displayed
      And the "late_landing_module" module is not displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "call_direction" icon
      And each element in the "events_list" list has the "phonenumber" field
      And each element in the "events_list" list has the "cost" textfield with "£0.00" format
      And each element in the "events_list" list has the "time_stamp" field
      And each element in the "events_list" list has the "direction" field
      And each element in the "events_list" list has the "country_code" field
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.9.11 @jira.link.detects.OBO2UK-1442 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-3296 @manual @mobile @o2uk @smoke
  Scenario Outline: A <account_type> user can see a list with their recent messages to international numbers
    CERT0/CERT1: testuser32@o2.com (PAYM), 12oc71800680@stf.ref.o2.co.uk (MBB)
    CERT2: 121111112@gmail.com, 447000000009@gmail.com
    Given user has a "<account_type>" account type
      And user has "charged" events in the "international messages" category of recent charges
      And user has not stored in the phonebook any phone number displayed in the "international messages" events
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Charges When Abroad Extra Charges" page
     When clicks on the "international_messages" entrypoint
     Then the "International Messages Recent Charges" page is displayed
      And the "International messages" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with the "£X.XX" format is displayed
      And the "consumption_graph" graph is displayed
      And the billing period is displayed in the "extra_charges_graph.x" axis
      And the charges are displayed in the "extra_charges_graph.y" axis
      And the "consumption_graph.y.daily_extras" bar is displayed for each day
      And the "consumption_graph.y.selected_day_label" line is displayed in the "last" day
      And the "consumption_graph.y.selected_day_label" textfield with the "DD Mmm · £X.XX" format is displayed
      And the "average_usage_label" textfield with "Average usage in period" text is displayed
      And the "average_usage_amount" textfield with the "£X.XX" format is displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "sms" icon
      And each element in the "events_list" list has the "phone_number" textfield
      And each element in the "events_list" list has the "time_sent" textfield
      And each element in the "events_list" list has the "cost" textfield with the "£X.XX" format
      And each element in the "events_list" list has the "sms_direction" field
      And each element in the "events_list" list has the "sms_type" field
      And each element in the "events_list" list has the "country_code" field
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad Extra Charges" page is displayed

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-5281 |
          | legacy MBB   | QANOV-5282 |

  @jira.<jira_id> @android @automation.pending_mock @ios @jira.cv.9.11 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-3296 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the "International messages" late landing charges
    CERT2: 121111112@gmail.com, 447000000009@gmail.com
    Note: late landing charges have 'lateLanding': true in the response to
    /{msisdn}/postpay/bill/recentcharges/international-message/charges APIC endpoint
    Given user has a "<account_type>" account type
      And user has late landing charges in the "international messages" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Charges When Abroad Extra Charges" page
     When clicks on the "international_messages" entrypoint
     Then the "International Messages Recent Charges" page is displayed
      And the "International messages" header is displayed
      And the "late_landing_charges" module with "Late landing charges" title is displayed
      And the "late_landing_charges.amount" textfield with the "£X.XX" format is displayed
      And the "late_landing_charges.description" textfield with "Charges from previous bills charged now" text is displayed
      And the "events_list" list is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad Extra Charges" page is displayed

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-5283 |
          | legacy MBB   | QANOV-5284 |

  @jira.<jira_id> @android @ios @jira.cv.9.11 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-3296
  @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the details of the "International messages" extra charges when user has no charged events
    internal_checkpoint="CERT1: testuser32@o2.com
    CERT2: 121111112@gmail.com, 447000000009@gmail.com"
    Given user has a "<account_type>" account type
      And user has "non_charged" events in the "international messages" category of recent charges
      And user has not "charged" events in the "international messages" category of recent charges
      And user has not stored in the phonebook any phone number displayed in the "international messages" events
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Charges When Abroad Extra Charges" page
     When clicks on the "international_messages" entrypoint
     Then the "International Messages Recent Charges" page is displayed
      And the "International messages" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with "£0.00" text is displayed
      And the "consumption_graph" graph is not displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "sms" icon
      And each element in the "events_list" list has the "phone_number" textfield
      And each element in the "events_list" list has the "time_sent" textfield
      And each element in the "events_list" list has the "cost" textfield with the "£X.XX" format
      And each element in the "events_list" list has the "sms_direction" field
      And each element in the "events_list" list has the "sms_type" field
      And each element in the "events_list" list has the "country_code" field
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad Extra Charges" page is displayed

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-5285 |
          | legacy MBB   | QANOV-5286 |

  @jira.QANOV-5287 @android @ios @jira.cv.9.11 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-3297
  @manual @mobile @o2uk @smoke
  Scenario: A legacy user can see a list with their international data recent data consumption
    CERT2: 121111112@gmail.com, 447000000009@gmail.com
    CERT0/CERT1: testuser32@o2.com, in00322v_219781@o2.com
    Given user has a "legacy postpay" account type
      And user has "charged" events in the "international data" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Charges When Abroad Extra Charges" page
     When clicks on the "international_data" entrypoint
     Then the "International Data Recent Charges" page is displayed
      And the "International data" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with the "£X.XX" format is displayed
      And the "consumption_graph" graph is displayed
      And the billing period is displayed in the "extra_charges_graph.x" axis
      And the charges are displayed in the "extra_charges_graph.y" axis
      And the "consumption_graph.y.daily_extras" bar is displayed for each day
      And the "consumption_graph.y.selected_day_label" line is displayed in the "last" day
      And the "consumption_graph.y.selected_day_label" textfield with the "DD Mmm · £X.XX" format is displayed
      And the "average_usage_label" textfield with "Average usage in period" text is displayed
      And the "average_usage_amount" textfield with the "£X.XX" format is displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "data" icon
      And each element in the "events_list" list has the "name" textfield with "Data consumption" text
      And each element in the "events_list" list has the "cost" textfield with the "£X.XX" format
      And each element in the "events_list" list has the "consumption" field
      And each element in the "events_list" list has the "country_code" field
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad Extra Charges" page is displayed

  @jira.QANOV-5288 @android @automation.pending_mock @ios @jira.cv.9.11 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-3297 @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the "International data" late landing charges
    CERT2: 121111112@gmail.com, 447000000009@gmail.com
    Given user has a "legacy postpay" account type
      And user has late landing charges in the "international data" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Charges When Abroad Extra Charges" page
     When clicks on the "international_data" entrypoint
     Then the "International Data Recent Charges" page is displayed
      And the "International data" header is displayed
      And the "late_landing_charges" module with "Late landing charges" title is displayed
      And the "late_landing_charges.amount" textfield with the "£X.XX" format is displayed
      And the "late_landing_charges.description" textfield with "Charges from previous bills charged now" text is displayed
      And the "events_list" list is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad Extra Charges" page is displayed

  @jira.QANOV-5289 @android @ios @jira.cv.9.11 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-3297
  @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the details of the "International data" extra charges when user has no charged events
    Given user has a "legacy postpay" account type
      And user has "non_charged" events in the "international data" category of recent charges
      And user has not "charged" events in the "international data" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Charges When Abroad Extra Charges" page
     When clicks on the "international_data" entrypoint
     Then the "International Data Recent Charges" page is displayed
      And the "International data" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with "£0.00" text is displayed
      And the "consumption_graph" graph is not displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "data" icon
      And each element in the "events_list" list has the "name" textfield with "Data consumption" text
      And each element in the "events_list" list has the "cost" textfield with the "£X.XX" format
      And each element in the "events_list" list has the "consumption" field
      And each element in the "events_list" list has the "country_code" field
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad Extra Charges" page is displayed

  @jira.QANOV-5290 @android @automatic @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-5254
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100920 @mobile @o2uk @smoke
  Scenario: A legacy postpay user can see the details of the "Messages" extra charges
    internal_checkpoint="CERT1: test32@thbs.com, CERT1: testuser31@o2.com
    CERT2: 121111112@gmail.com, 447000000009@gmail.com"
    Given user has any "legacy PAYM;legacy MBB" account types
      And user has "charged" events in the "messages" category of recent charges
      And user does not have late landing charges in the "messages" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "messages_entrypoint" entrypoint
     Then the "Messages Recent Charges" page is displayed
      And the "Messages" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "daily_charges" bar is displayed for each day in the "y" axis of the "consumption_graph" graph
      And the selected day line is displayed in the "last" day of the "consumption_graph" graph
      And the "consumption_graph.y.selected_day_label" textfield with the "\d+ [A-z]{3} · £\d+.\d\d" format is displayed
      And the "average_usage_label" textfield with "Average usage in period" text is displayed
      And the "average_usage_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "sms" field
      And each element in the "events_list" list has the "phonenumber" field
      And each element in the "events_list" list has the "cost" field
      And each element in the "events_list" list has the "time_stamp" field
      And each element in the "events_list" list has the "sms_type" field
      And each element in the "events_list" list has the "direction" field
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-5254
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100920 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the "Messages" late landing extra charges
    internal_checkpoint="CERT1: test32@thbs.com, CERT1: testuser31@o2.com
    CERT2: 121111112@gmail.com, 447000000009@gmail.com"
    Given user has a "<account_type>" account type
      And user has late landing charges in the "messages" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "messages" entrypoint
     Then the "Messages Recent Charges" page is displayed
      And the "Messages" header is displayed
      And the "late_landing_module" module with "Late landing charges" title is displayed
      And the "late_landing_module.amount" textfield with the "£X.XX" format is displayed
      And the "late_landing_module.description" textfield with "Charges from previous bills charged now" text is displayed
      And the "events_list" list is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-5292 |
          | legacy MBB   | QANOV-5293 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-5254
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100921 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the details of the "Messages" extra charges when user has no charged events
    Given user has a "<account_type>" account type
      And user has "non_charged" events in the "messages" category of recent charges
      And user has not "charged" events in the "messages" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "messages" entrypoint
     Then the "Messages Recent Charges" page is displayed
      And the "Messages" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with "£0.00" text is displayed
      And the "consumption_graph" graph is not displayed
      And the "late_landing_module" module is not displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "star_sms" field
      And each element in the "events_list" list has the "short_code" field
      And each element in the "events_list" list has the "time_sent" field
      And each element in the "events_list" list has the "cost" textfield with "£0.00" text
      And each element in the "events_list" list has the "sms_direction" field
      And each element in the "events_list" list has the "view_details" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-5294 |
          | legacy MBB   | QANOV-5295 |

  @jira.QANOV-5296 @android @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-5254 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100919 @manual @mobile @o2uk @smoke
  Scenario: A legacy user can see the details of the "Data" extra charges
    internal_checkpoint="CERT2 User provided by O2 for 10.2 campaign: 447000000009@gmail.com
    CERT 1: 07568414908 test74705784@stf.ref.o2.co.uk"
    Given user has a "legacy postpay" account type
      And user has "charged" events in the "data" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "data" entrypoint
     Then the "Data Recent Charges" page is displayed
      And the "Data" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "consumption_graph" graph is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "daily_charges" bar is displayed for each day in the "y" axis of the "consumption_graph" graph
      And the selected day line is displayed in the "last" day of the "consumption_graph" graph
      And the "consumption_graph.y.selected_day_label" textfield with the "\d+ [A-z]{3} · £\d+.\d\d" format is displayed
      And the "average_usage_label" textfield with "Average usage in period" text is displayed
      And the "average_usage_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "date" field
      And each element in the "events_list" list has the "internet" field
      And each element in the "events_list" list has the "data_consumed" field
      And each element in the "events_list" list has the "cost" textfield with the "£X.XX" format
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

  @jira.QANOV-5297 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-5254
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100919 @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the "Data" late landing charges
    internal_checkpoint="CERT2 User provided by O2 for 10.2 campaign: 447000000009@gmail.com
    CERT 1: 07568414908 test74705784@stf.ref.o2.co.uk"
    Given user has a "legacy postpay" account type
      And user has late landing charges in the "data" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "data" entrypoint
     Then the "Data Recent Charges" page is displayed
      And the "Data" header is displayed
      And the "late_landing_charges" module with "Late landing charges" title is displayed
      And the "late_landing_charges.amount" textfield with the "£X.XX" format is displayed
      And the "late_landing_charges.description" textfield with "Charges from previous bills charged now" text is displayed
      And the "events_list" list is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

  @jira.QANOV-5298 @android @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-5254 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100919 @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the details of the extra "Data" charges when user has no charged events
    internal_checkpoint="CERT2 User provided by O2 for 10.2 campaign: 447000000009@gmail.com
    CERT 1: 07568414908 test74705784@stf.ref.o2.co.uk"
    Given user has a "legacy postpay" account type
      And user has "non_charged" type of "data" category of recent charges
      And user has not "charged" type of "data" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "data" entrypoint
     Then the "Data Recent Charges" page is displayed
      And the "Data" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with "£0.00" text is displayed
      And the "consumption_graph" graph is not displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "date" field
      And each element in the "events_list" list has the "internet" field
      And each element in the "events_list" list has the "data_consumed" field
      And each element in the "events_list" list has the "cost" textfield with "£0.00" text
      And the elements in the "events_list" list are grouped by date
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.9.11 @jira.link.relates_to.NOV-100864 @manual @mobile @netcracker @o2uk
  @regression
  Scenario Outline: A <account_type> user is not able to click on the "Premium & information services" entrypoint when it has no charges
    internal_checkpoint="CERT0: inavl0ww_878541@o2.com (07525948396)"
    Given user has a "<account_type>" account type
      And user has "none" events in the "premium and info services" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     Then the "premium_and_info_services" element in the "recent_charges_list" list has not the "chevron" icon
      And the "premium_and_info_services" element in the "recent_charges_list" list is not clickable

    Examples:
          | account_type | jira_id    |
          | PAYM         | QANOV-5299 |
          | MBB          | QANOV-5300 |

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-5254
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100921 @manual @mobile @o2uk @smoke
  Scenario Outline: A <account_type> user can see the details of "Premium & information services" recent charges
    internal_checkpoint="NOTE: the 'shortcode' is an identifier for the other party provided by O2MW
    which is different form the destination(also provided by O2MW)
    CERT2: 121111112@gmail.com/password
    CERT1: gb083240_129511@o2.com, testuser31@o2.com"
    Given user has a "<account_type>" account type
      And user has "charged" events in the "premium and info services" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "premium_and_info_services_entrypoint" entrypoint
     Then the "Premium And Info Services Recent Charges" page is displayed
      And the "Premium & information services" header is displayed
      And the "total_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "consumption_graph" graph is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "daily_charges" bar is displayed for each day in the "y" axis of the "consumption_graph" graph
      And the selected day line is displayed in the "last" day of the "consumption_graph" graph
      And the "consumption_graph.y.selected_day_label" textfield with the "\d+ [A-z]{3} · £\d+.\d\d" format is displayed
      And the "average_usage_label" textfield with "Average usage in period" text is displayed
      And the "average_usage_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "star_sms" field
      And each element in the "events_list" list has the "short_code" field
      And each element in the "events_list" list has the "time_sent" field
      And each element in the "events_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And each element in the "events_list" list has the "sms_direction" field
      And each element in the "events_list" list has the "view_details" field
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

    Examples:
          | account_type | automation              | impeded_label | jira_id    |
          | legacy PAYM  |                         |               | QANOV-5301 |
          | legacy MBB   | automation.pending_mock | impeded_mock  | QANOV-5302 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-5254
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100921 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the "Premium & information services" late landing charges
    internal_checkpoint="NOTE: the 'shortcode' is an identifier for the other party provgit stided by O2MW
    which is different form the destination(also provided by O2MW)
    CERT2: 121111112@gmail.com/password
    CERT1: gb083240_129511@o2.com, testuser31@o2.com"
    Given user has a "<account_type>" account type
      And user has late landing charges in the "premium and info services" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "premium_and_services" entrypoint
     Then the "Premium And Info Services Recent Charges" page is displayed
      And the "Premium & information services" header is displayed
      And the "late_landing_module" module with "Late landing charges" title is displayed
      And the "late_landing_module.amount" textfield with the "£X.XX" format is displayed
      And the "late_landing_module.description" textfield with "Charges from previous bills charged now" text is displayed
      And the "events_list" list is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-5303 |
          | legacy MBB   | QANOV-5304 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-5254
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100921 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the details of the extra "Premium & information services" charges when user has no charged events
    internal_checkpoint="NOTE: the 'shortcode' is an identifier for the other party provided by O2MW
    which is different form the destination(also provided by O2MW)
    CERT2: 121111112@gmail.com/password
    CERT1: gb083240_129511@o2.com, testuser31@o2.com"
    Given user has a "<account_type>" account type
      And user has "non_charged" events in the "premium and info services" category of recent charges
      And user has not "charged" events in the "premium and info services" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "premium_and_info_services" entrypoint
     Then the "Premium And Info Services Recent Charges" page is displayed
      And the "Premium & information services" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with "£0.00" text is displayed
      And the "consumption_graph" graph is not displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "star_sms" field
      And each element in the "events_list" list has the "short_code" field
      And each element in the "events_list" list has the "time_sent" field
      And each element in the "events_list" list has the "cost" textfield with "£0.00" text
      And each element in the "events_list" list has the "sms_direction" field
      And each element in the "events_list" list has the "view_details" field
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-5305 |
          | legacy MBB   | QANOV-5306 |

  @jira.<jira_id> @<automation> @<impeded> @android @ios @jira.cv.9.11 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-3298 @manual @mobile @o2uk @smoke
  Scenario Outline: A <account_type> user can see the details of the extra "Things you've bought" charges
    internal_checkpoint="CERT0: 12oc71800680@stf.ref.o2.co.uk (MBB)
    CERT2: 121111112@gmail.com, 447000000009@gmail.com"
    Given user has a "<account_type>" account type
      And user has "charged" events in the "things you have bought" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "things_you_bought" entrypoint
     Then the "Things Youve Bought Recent Charges" page is displayed
      And the "Things you've bought" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "consumption_graph" graph is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "daily_charges" bar is displayed for each day in the "y" axis of the "consumption_graph" graph
      And the selected day line is displayed in the "last" day of the "consumption_graph" graph
      And the "consumption_graph.y.selected_day_label" textfield with the "\d+ [A-z]{3} · £\d+.\d\d" format is displayed
      And the "average_usage_label" textfield with "Average usage in period" text is displayed
      And the "average_usage_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "name" field
      And each element in the "events_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

    Examples:
          | account_type | impeded      | automation              | jira_id    |
          | legacy PAYM  | impeded_mock | automation.pending_mock | QANOV-5307 |
          | legacy MBB   |              |                         | QANOV-5308 |

  @jira.<jira_id> @android @ios @jira.cv.9.11 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-3298
  @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the "Things you've bought" late landing extra charges
    internal_checkpoint="CERT1:
    CERT2: 121111112@gmail.com, 447000000009@gmail.com"
    Given user has a "<account_type>" account type
      And user has late landing charges in the "things you have bought" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "things_you_bought" entrypoint
     Then the "Things Youve Bought Recent Charges" page is displayed
      And the "Things you've bought" header is displayed
      And the "total_charges_label" textfield with "Total during this period" text is displayed
      And the "late_landing_charges" module with "Late landing charges" title is displayed
      And the "late_landing_charges.amount" textfield with the "£X.XX" format is displayed
      And the "late_landing_charges.description" textfield with "Charges from previous bills charged now" text is displayed
      And the "events_list" list is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-5309 |
          | legacy MBB   | QANOV-5310 |

  @jira.<jira_id> @android @ios @jira.cv.9.11 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-3298
  @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the details of the "Things you've bought" extra charges when user has no charged events
    internal_checkpoint="CERT1:
    CERT2: 121111112@gmail.com, 447000000009@gmail.com"
    Given user has a "<account_type>" account type
      And user has "non_charged" events in the "things you have bought" category of recent charges
      And user has not "charged" events in the "things you have bought" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "things_you_bought" entrypoint
     Then the "Things Youve Bought Recent Charges" page is displayed
      And the "Things you've bought" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with "£0.00" text is displayed
      And the "consumption_graph" graph is not displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "name" field
      And each element in the "events_list" list has the "cost" textfield with "£0.00" text
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-5311 |
          | legacy MBB   | QANOV-5312 |

  @jira.QANOV-5313 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-34180 @mobile @o2uk @smoke @webapp
  Scenario: A legacy PAYM user can see the details of the "Minutes" extra charges
    internal_checkpoint="NOTE: For premium calls, the arrow icon will have a star on the left of it and a 'View details' link
    numbers with NGN access charges in DEV: 121111112@gmail.com
    CERT1: testuser31@o2.com
    To change as part of 'Bill Gap' for 10.2: AND each entry will include the Number of the other party, the cost of the call, the time of day, the duration and the direction of the call
    will become: AND each entry will include the Name(if the number is in the agenda) or Number of the other party, the cost of the call, the time of day, the duration and the direction of the call"
    Given user has a "legacy PAYM" account type
      And user has "charged" events in the "minutes" category of recent charges
      And user does not have late landing charges in the "minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "minutes_entrypoint" entrypoint
     Then the "Minutes Recent Charges" page is displayed
      And the "filter_placeholder" textfield with "Filter by" text is displayed
      And the "selected_filter" textfield with "All calls" text is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "daily_charges" bar is displayed for each day in the "y" axis of the "consumption_graph" graph
      And the selected day line is displayed in the "last" day of the "consumption_graph" graph
      And the "consumption_graph.y.selected_day_label" textfield with the "\d+ [A-z]{3} · £\d+.\d\d" format is displayed
      And the "average_usage_label" textfield with "Average usage in period" text is displayed
      And the "average_usage_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "call_direction_icon" field
      And each element in the "events_list" list has the "time_stamp" field
      And each element in the "events_list" list has the "call_type" field
      And each element in the "events_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And the elements in the "events_list" list are ordered by date descendant

  @jira.QANOV-5314 @android @automatic @ber @ios @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-34180 @mobile @o2uk @qa @regression
  Scenario: A legacy user can see the "Minutes" late landing extra charges
    internal_checkpoint="CERT0: stester11f220477c-76a5-4101-9664-6b2da5bcfe04@gmail.com"
    Given user has a "legacy PAYM" account type
      And user has late landing charges in the "minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "minutes_entrypoint" entrypoint
     Then the "Minutes Recent Charges" page is displayed
      And the "Minutes consumption" header is displayed
      And the "late_landing_module" module is displayed
      And the "late_landing_module.title" textfield with "Late landing charges" text is displayed
      And the "late_landing_module.amount" textfield with the "£\d+.\d\d" format is displayed
      And the "late_landing_module.description" textfield with "Charges from previous bills charged now" text is displayed
      And the "events_list" list is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

  @jira.QANOV-5315 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.1
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-34180 @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the details of the "Minutes" extra charges when user has no charged events
    Given user has a "legacy PAYM" account type
      And user has "non_charged" events in the "minutes" category of recent charges
      And user has not "charged" events in the "minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "minutes" entrypoint
     Then the "Minutes Recent Charges" page is displayed
      And the "Minutes consumption" header is displayed
      And the "filter" drop-down is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with "£0.00" text is displayed
      And the "consumption_graph" graph is not displayed
      And the "late_landing_module" module is not displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "call_direction" field
      And each element in the "events_list" list has the "time_stamp" field
      And each element in the "events_list" list has the "call_type" field
      And each element in the "events_list" list has the "cost" textfield with "£0.00" text
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges" page is displayed

  @jira.QANOV-5316 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-39031 @mobile @o2uk @smoke @webapp
  Scenario: A legacy user can filter his recent calls in the "Minutes" extra charges screen
    internal_checkpoint="CERT1: testuser31@o2.com"
    Given user has a "legacy PAYM" account type
      And user has "minutes" recent charges
      And user has "charged" events in the "minutes:international_minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user is in the "Extra Charges" page
     When clicks on the "minutes_entrypoint" entrypoint
      And the "Minutes Recent Charges" page is displayed
     Then each element in the "filter_list.list" list has the "filter_name" field with "All calls;Most expensive calls;Longest calls;Most frequent calls" texts

  @jira.QANOV-5317 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.1
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-34185 @manual @mobile @o2uk @regression
  Scenario: A legacy user who hasn't charged call events in the "Minutes" extra charges can't filter them by "most expensive"
    Given user has a "legacy PAYM" account type
      And user has "minutes" recent charges
      And user has not "charged" events in the "minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "Minutes" element in the "recent_charges_list" list
      And the "Minutes Recent Charges" page is displayed
      And clicks on the "filter" drop-down
     Then the "filter_list" list with "All calls;Longest calls;Most frequent calls" textfields is displayed
      And the "filter_list" list has not the "Most expensive calls" textfield
      And the "all_calls" element in the "filter_list" list is selected

  @jira.QANOV-5318 @android @ios @jira.cv.10.1 @jira.link.depends_on.QANOV-5254 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-34183 @manual @mobile @o2uk @regression
  Scenario: A legacy user can filter by "most frequent calls" in the "Minutes" recent charges screen
    CERT0: gb083240_785792@o2.com
    To change as part of 'Bill Gap' for 10.2: AND the entry will show the Number of the other party and the number of calls
    will become: AND the entry will show the Name (if the number is in the agenda) or Number of the other party and the number of calls
    Given user has a "legacy PAYM" account type
      And user has "charged" events in the "minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Minutes Recent Charges" page
     When clicks on the "filter" drop-down
      And clicks on the "most_frequent_calls" element in the "filter_list" list
     Then the "consumption_graph" graph is not displayed
      And the "late_landing_module" module is not displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has a different "phonenumber" field
      And the "events_list" has the "number_of_calls" textfield with the "X Calls" format
      And the elements in the "events_list" list are ordered by frequency
      And the "events_list" has "<=10" elements

  @jira.QANOV-5319 @android @ios @jira.cv.10.1 @jira.link.depends_on.QANOV-5254 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-34182 @manual @mobile @o2uk @regression
  Scenario: A legacy user can filter by "longest calls" in the "Minutes" recent charges screen
    CERT0: gb083240_785792@o2.com
    Given user has a "legacy PAYM" account type
      And user has "minutes" recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Minutes Recent Charges" page
     When clicks on the "filter" drop-down
      And clicks on the "longest_calls" element in the "filter_list" list
     Then the "consumption_graph" graph is not displayed
      And the "late_landing_module" module is not displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "date" field
      And each element in the "events_list" list has the "phonenumber" field
      And each element in the "events_list" list has the "time_stamp" field
      And each element in the "events_list" list has the "direction" field
      And each element in the "events_list" list has the "call_duration" textfield with the "MM:SS" format
      And each element in the "events_list" list have not the "cost" textfield
      And the elements in the "events_list" list are ordered by call duration
      And the "events_list" has "<=10" elements

  @jira.QANOV-5320 @android @ios @jira.cv.10.1 @jira.link.depends_on.QANOV-5254 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-34181 @manual @mobile @o2uk @regression
  Scenario: A legacy user can filter by "most expensive calls" in the "Minutes" recent charges screen
    CERT0: gb083240_785792@o2.com
    Given user has a "legacy postpay" account type
      And user has "minutes" recent charges
      And user has "charged" events in the "minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Minutes Recent Charges" page
     When clicks on the "filter" drop-down
      And clicks on the "most_expensive_calls" element in the "filter_list" list
     Then the "consumption_graph" graph is not displayed
      And the "late_landing_module" module is not displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by cost
      And each element in the "events_list" list has the "phonenumber" field
      And each element in the "events_list" list has the "time_stamp" field
      And each element in the "events_list" list has the "direction" field
      And each element in the "events_list" list has the "cost" textfield with the "£X.XX" format
      And the "events_list" has "<=10" elements

  @jira.<jira_id> @android @ios @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24141 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy user with late landing events in <category> category of recent charges can access to the "Late landing" page
    Given user has any "<account_type>" account types
      And user has late landing non-premium charges in the "<category>" category of recent charges
      And user has the matching subscription selected in the account
      And user is in the "<page>" page
     When clicks on the element with "view_details" field with "View details" value of the "events_list" list
     Then the "Late Landing" page is displayed
      And the "Late landing charges" header is displayed
      And the "what_are_title" textfield is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "<page>" page is displayed

    Examples:
          | account_type           | category               | page                                  | jira_id      |
          | legacy postpay         | data                   | Data Recent Charges                   | QANOV-269213 |
          | legacy PAYM            | minutes                | Minutes Recent Charges                | QANOV-269214 |
          | legacy PAYM:legacy MBB | messages               | Messages Recent Charges               | QANOV-269215 |
          | legacy PAYM            | international minutes  | International Minutes Recent Charges  | QANOV-269216 |
          | legacy postpay         | international data     | International Data Recent Charges     | QANOV-269217 |
          | legacy PAYM:legacy MBB | international messages | International Messages Recent Charges | QANOV-269218 |
          | legacy PAYM:legacy MBB | things you have bought | Things You Have Bought Recent Charges | QANOV-269219 |

  @jira.<jira_id> @android @ios @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24141 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy user with premium events in <category> category of recent charges can access to the "Premium charges" webview
    Given user has any "<account_type>" account types
      And user has premium charges non-late landing in the "<category>" category of recent charges
      And user has the matching subscription selected in the account
      And user is in the "<page>" page
     When clicks on the element with "view_details" field with "View details" value of the "events_list" list
     Then the browser webview with "Premium Service Checker" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "<page>" page is displayed

    Examples:
          | account_type           | category                  | page                                  | jira_id      |
          | legacy postpay         | data                      | Data Recent Charges                   | QANOV-269220 |
          | legacy PAYM            | minutes                   | Minutes Recent Charges                | QANOV-269221 |
          | legacy PAYM:legacy MBB | messages                  | Messages Recent Charges               | QANOV-269222 |
          | legacy PAYM            | international minutes     | International Minutes Recent Charges  | QANOV-269223 |
          | legacy postpay         | international data        | International Data Recent Charges     | QANOV-269224 |
          | legacy PAYM:legacy MBB | international messages    | International Messages Recent Charges | QANOV-269225 |
          | legacy PAYM:legacy MBB | things you have bought    | Things You Have Bought Recent Charges | QANOV-269226 |
          | legacy PAYM:legacy MBB | premium and info services | Premium Recent Charges                | QANOV-269227 |

  @jira.<jira_id> @android @ios @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24141 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy user with premium late landing events in <category> category of recent charges can access to the "Late landing" page
    Given user has any "<account_type>" account types
      And user has premium charges late landing in the "<category>" category of recent charges
      And user has the matching subscription selected in the account
      And user is in the "<page>" page
     When clicks on the element with "view_details" field with "View details" value of the "events_list" list
     Then the "Late Landing" page is displayed
      And the "Late landing charges" header is displayed
      And the "what_are_title" textfield is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "<page>" page is displayed

    Examples:
          | account_type           | category                  | page                                  | jira_id      |
          | legacy postpay         | data                      | Data Recent Charges                   | QANOV-269228 |
          | legacy PAYM            | minutes                   | Minutes Recent Charges                | QANOV-269229 |
          | legacy PAYM:legacy MBB | messages                  | Messages Recent Charges               | QANOV-269230 |
          | legacy PAYM            | international minutes     | International Minutes Recent Charges  | QANOV-269231 |
          | legacy postpay         | international data        | International Data Recent Charges     | QANOV-269232 |
          | legacy PAYM:legacy MBB | international messages    | International Messages Recent Charges | QANOV-269233 |
          | legacy PAYM:legacy MBB | things you have bought    | Things You Have Bought Recent Charges | QANOV-269234 |
          | legacy PAYM:legacy MBB | premium and info services | Premium Recent Charges                | QANOV-269235 |

  @jira.<jira_id> @automatic @android @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-24140 @mobile @o2uk @sanity
  @webapp
  Scenario Outline: An AO2 postpay user can access the Extra charges screen when user has recent charges
    internal_checkpoint="The list of recent charges will only show the items with cost"
    Given user has a "AO2 postpay" account type
      And user has "any" recent charges
      And user <has_view_standard> the "view_standard_rates" link available
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "extra_charges" module
     Then the "Extra Charges" page is displayed
      And the "recent_charges_title" textfield with "AIRTIME CHARGES" text is displayed
      And the "recent_charges_list" list is displayed
      And each element in the "recent_charges_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And each element has the "chevron" field displayed in the "recent_charges_list" list
      And the "total_recent_charges_textfield" textfield with "Total recent charges" text is displayed
      And the "total_recent_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "what_are_link" link with "What are recent charges?" text is displayed
      And the "view_standard_rates_link" link <view_standard_rates_link_displayed>
      And the "message" textfield with "UK data will be updated within 30 minutes. All UK calls and messages can take up to 12 hours, international calls may take longer. VAT included." text is displayed

    @cert0 @cert1
    Examples:
          | has_view_standard | view_standard_rates_link_displayed           | jira_id     |
          | has               | with "View standard rates" text is displayed | QANOV-66040 |

    @qa
    Examples:
          | has_view_standard | view_standard_rates_link_displayed | jira_id     |
          | has not           | is not displayed                   | QANOV-66041 |

  @jira.<jira_id> @<execution_mode> @android @ios @jira.cv.12.4 @jira.link.detects.OBO2UK-1389
  @jira.link.parent_test_plan.QANOV-24140 @mobile @o2uk @regression @cert0 @cert1 @qa @webapp
  Scenario Outline: An AO2 postpay user can access the Extra charges screen when user has no recent charges
    Given user has a "AO2 postpay" account type
      And user has "none" recent charges
      And user <has_view_standard> the "view_standard_rates" link available
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "extra_charges" module
     Then the "Extra Charges" page is displayed
      And the "total_recent_charges_textfield" textfield with "Total recent charges" text is displayed
      And the "total_recent_charges_amount" textfield with "£0.00" text is displayed
      And the "what_are_link" link with "What are recent charges?" text is displayed
      And the "view_standard_rates_link" link <view_standard_rates_link_displayed>
      And the "message" textfield with "UK data will be updated within 30 minutes. All UK calls and messages can take up to 12 hours, international calls may take longer. VAT included." text is displayed

    Examples:
          | has_view_standard | view_standard_rates_link_displayed           | execution_mode | jira_id     |
          | has               | with "View standard rates" text is displayed | automatic      | QANOV-66046 |
          | has not           | is not displayed                             | manual         | QANOV-66047 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2uk @smoke
  Scenario Outline: An AO2 user with charges in the <element_title> item can see the element listed in the Extra Charges page
    Given user has a "AO2 postpay" account type
      And user has "any" events in the "<charged_element>" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     Then the element with "<element_title>" text in the "title" field is displayed in the "recent_charges_list" list

    Examples:
          | charged_element           | element_title                  | parent_test_plan | cv     | jira_id      |
          | minutes                   | Minutes                        | QANOV-24140      | 12.4   | QANOV-106319 |
          | messages                  | Messages                       | QANOV-24140      | 12.4   | QANOV-106320 |
          | data                      | Data                           | QANOV-24140      | 12.4   | QANOV-106321 |
          | charges when abroad       | Charges when abroad            | QANOV-24140      | 12.4   | QANOV-106322 |
          | premium and info services | Premium & information services | QANOV-24140      | 12.4   | QANOV-106323 |
          | things you have bought    | Things you've bought           | QANOV-24140      | 12.4   | QANOV-106324 |
          | other charges             | Other charges and adjustments  | QANOV-132515     | Future | QANOV-224786 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.detects.OBO2UK-1441 @jira.link.detects.OBO2UK-1450
  @jira.link.detects.OBO2UK-1451 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2uk @smoke
  Scenario Outline: An <account_type> user can access to the recent charges elements with cost
    AO2 PAYM (CERT0): ncqae2etest+91982060@gmail.com
    AO2 MBB (CERT0): rhysdaly@rhyta.com
    Given user has a "<account_type>" account type
      And user has "charged" events in the "<charged_element>" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Extra Charges" page
     When clicks on the "<charged_element>.chevron" icon
     Then the "View Historic Usage" internal webview is displayed
      And the "Account | My O2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Extra Charges" page is displayed

    Examples:
          | account_type  | charged_element                  | parent_test_plan | cv   | jira_id      |
          | AO2 PAYM      | minutes                          | QANOV-24140      | 12.4 | QANOV-5331   |
          | AO2 PAYM      | messages                         | QANOV-24140      | 12.4 | QANOV-5332   |
          | AO2 PAYM      | data                             | QANOV-24140      | 12.4 | QANOV-5333   |
          | AO2 PAYM      | premium_and_information_services | QANOV-24140      | 12.4 | QANOV-5334   |
          | AO2 PAYM      | things_you_have_bought           | QANOV-24140      | 12.4 | QANOV-5335   |
          | AO2 MBB       | messages                         | QANOV-24140      | 12.4 | QANOV-5336   |
          | AO2 MBB       | data                             | QANOV-24140      | 12.4 | QANOV-5337   |
          | AO2 MBB       | premium_and_information_services | QANOV-24140      | 12.4 | QANOV-5338   |
          | AO2 MBB       | things_you_have_bought           | QANOV-24140      | 12.4 | QANOV-5339   |
          | AO2 companion | data                             | QANOV-24140      | 12.4 | QANOV-5340   |
          | AO2 postpay   | charges_when_abroad              | QANOV-24140      | 12.4 | QANOV-106329 |
          | AO2 postpay   | other charges                    | QANOV-132515     | 14.4 | QANOV-224787 |
