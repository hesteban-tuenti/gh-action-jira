# -*- coding: utf-8 -*-
@jira.QANOV-3149
Feature: Support tab content


  @jira.QANOV-325954 @android @impeded_legacy @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.QANOV-3223 @jira.link.relates_to.QANOV-3224 @mobile
  @moves @no_automatable @sanity
  Scenario: A Legado with Internet can access to the Support tab content
    With Digital Hub the Priority color will disappear
    - Background screen color will be non-prominent
    - No icons will be shown within the Main Topics Module
    - Module highlighted property won't be included in the test until we find a mechanism to validate it
    -* Diagnostics module is highlighted
    -* Store appointment booking module is highlighted
    -* Services module is not highlighted
    Given user has a "legado" account type
      And user has a "internet" product
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.support_tab" tab
     Then the "Support" page is displayed
      And the "[LANG:pageelements.navigation_tab_bar.support_tab]" header is displayed
      And the "main_title_textfield" textfield with "[LANG:support.support_tab.main_title]" text is displayed
      And the "diagnostics_module.title_textfield" textfield that contains the "[LANG:support.support_tab.entry_points.diagnostics_title]" text is displayed
      And the "diagnostics_module.description_textfield" textfield that contains the "Soluciona de manera fácil y sencilla tu avería" text is displayed
      And the "diagnostics_module.button" button with "Solucionar avería" text is displayed
      And the "store_appointment_booking_module_outer_title" section module with "[LANG:support.support_tab.entry_points.store_appointment_booking_outer_title]" title is displayed
      And the "store_appointment_booking_module" module with "¿Quieres visitarnos?" title is displayed
      And the "store_appointment_booking_module_description_textfield" textfield that contains the "Pide una cita y aclararemos todas tus dudas." text is displayed
      And the "store_appointment_booking_module_link" link with "Pedir cita en tienda" text is displayed
      And the "services_module" section module with "[LANG:support.support_tab.entry_points.services_title]" title is displayed
      And the "services_module.configure_router_link" entrypoint with "[LANG:support.support_tab.entry_points.configure_router]" text is displayed

  @jira.QANOV-325955 @android @impeded_legacy @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.relates_to.QANOV-67906 @jira.link.relates_to.QANOV-67907 @mobile @moves @no_automatable @regression
  Scenario: A Legado without Internet can access to the Support tab content
    With Digital Hub the Priority color will disappear
    - Background screen color will be non-prominent
    - No icons will be shown within the Main Topics Module
    - Module highlighted property won't be included in the test until we find a mechanism to validate it
    -* Diagnostics module is highlighted
    -* Store appointment booking module is highlighted
    -* Main Topics module is not highlighted
    Given user has a "legado" account type
      And user does not have "internet" product
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.support_tab" tab
     Then the "Support" page is displayed
      And the "[LANG:pageelements.navigation_tab_bar.support_tab]" header is displayed
      And the "main_title_textfield" textfield with "[LANG:support.support_tab.main_title]" text is displayed
      And the "diagnostics_module.title_textfield" textfield that contains the "[LANG:support.support_tab.entry_points.diagnostics_title]" text is displayed
      And the "diagnostics_module.description_textfield" textfield that contains the "Soluciona de manera fácil y sencilla tu avería" text is displayed
      And the "diagnostics_module.button" button with "Solucionar avería" text is displayed
      And the "store_appointment_booking_module_outer_title" section module with "[LANG:support.support_tab.entry_points.store_appointment_booking_outer_title]" title is displayed
      And the "store_appointment_booking_module" module with "¿Quieres visitarnos?" title is displayed
      And the "store_appointment_booking_module_description_textfield" textfield that contains the "Pide una cita y aclararemos todas tus dudas." text is displayed
      And the "store_appointment_booking_module_link" link with "Pedir cita en tienda" text is displayed

  @jira.<jira_id> @android @ber @ios @jira.cv.24.0 @automatic @mobile @o2uk @sanity @cert0 @cert1 @live
  Scenario Outline: A user who is in the <tab> tab can access to the Support tab content
    Given user has a "<account_type>" account type
      And user is in the "<tab>" page
     When clicks on the "navigation_tab_bar.support_tab" tab
     Then the "Support" page is displayed
      And the "[LANG:pageelements.navigation_tab_bar.support_tab]" header is displayed
      And the "main_title_textfield" textfield with "[LANG:support.support_tab.main_title]" text is displayed
      And the "support_main_list" list is displayed
      And each element in the "support_main_list" list has the "icon" field
      And each element in the "support_main_list" list has the "title" field
      And each element in the "support_main_list" list has the "chevron" field
      And the "support_network_carousel_title" textfield is displayed
      And the "support_network_carousel" carousel is displayed
      And each element in the "support_network_carousel" carousel has the "icon" field
      And each element in the "support_network_carousel" carousel has the "name" field
      And the "support_quick_links_list_title" textfield is displayed
      And the "support_quick_links_list" list is displayed
      And each element in the "support_quick_links_list" list has the "title" field
      And each element in the "support_quick_links_list" list has the "chevron" field
      And the "support_chat_module_title" textfield with "[LANG:support.support_chat.start_conversation]" text is displayed
      And the "support_chat_module_description" textfield with "[LANG:support.support_chat.start_conversation_description]" text is displayed

    Examples:
          | account_type   | tab     | jira_id      |
          | legacy postpay | Start   | QANOV-573447 |
          | AO2 postpay    | Explore | QANOV-573449 |

  @jira.QANOV-573448 @android @ber @ios @jira.cv.24.0 @automatic @mobile @o2uk @sanity @cert0 @cert1 @live
  Scenario: A "legacy prepay" o2uk user who is in the "Account" tab can access to the Support tab content
    Given user has a "legacy prepay" account type
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.support_tab" tab
     Then the "Support" page is displayed
      And the "[LANG:pageelements.navigation_tab_bar.support_tab]" header is displayed
      And the "main_title_textfield" textfield with "[LANG:support.support_tab.main_title]" text is displayed
      And the "support_main_list" list is displayed
      And each element in the "support_main_list" list has the "icon" field
      And each element in the "support_main_list" list has the "title" field
      And each element in the "support_main_list" list has the "chevron" field
      And the "support_network_carousel_title" textfield is displayed
      And the "support_network_carousel" carousel is displayed
      And each element in the "support_network_carousel" carousel has the "icon" field
      And each element in the "support_network_carousel" carousel has the "name" field
      And the "support_quick_links_list_title" textfield is displayed
      And the "support_quick_links_list" list is displayed
      And each element in the "support_quick_links_list" list has the "title" field
      And each element in the "support_quick_links_list" list has the "chevron" field
      And the "support_chat_module_title" textfield is not displayed
      And the "support_chat_module_description" textfield is not displayed

  @jira.QANOV-573450 @android @ber @ios @jira.cv.24.0 @automatic @mobile @o2uk @sanity @cert0 @cert1 @live
  Scenario: A "device" o2uk user who is in the "Account" tab can access to the Support tab content
    Given user has a "device" account type
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.support_tab" tab
     Then the "Support" page is displayed
      And the "[LANG:pageelements.navigation_tab_bar.support_tab]" header is displayed
      And the "main_title_textfield" textfield with "[LANG:support.support_tab.main_title]" text is displayed
      And the "support_main_list" list is displayed
      And each element in the "support_main_list" list has the "icon" field
      And each element in the "support_main_list" list has the "title" field
      And each element in the "support_main_list" list has the "chevron" field
      And the "support_network_carousel_title" textfield is displayed
      And the "support_network_carousel" carousel is displayed
      And each element in the "support_network_carousel" carousel has the "icon" field
      And each element in the "support_network_carousel" carousel has the "name" field
      And the "support_quick_links_list" list is not displayed
      And the "support_chat_module_title" textfield is not displayed
      And the "support_chat_module_description" textfield is not displayed

  @jira.QANOV-573451 @android @ios @jira.cv.24.0 @automatic @mobile @o2uk @regression @cert0 @cert1 @live @har
  Scenario: The Support page is refreshed when user pulls down
    Given user is in the "Support" page
     When pulls down the page to refresh
      And waits until the "skeleton" element is not visible
      And the "Support" page is displayed

  @jira.QANOV-3260 @android @cert0 @cert1 @ios @jira.cv.11.3 @jira.link.relates_to.NOV-139231 @live @automatic @mobile @next
  @o2uk @regression @har
  Scenario: Page is scrolled up when o2uk user taps on the Support tab button after scrolling down
    Given user is in the "Support" page
     When scrolls down
      And the "main_title_native_textfield" webview element as native is not visible in the actual screen
      And clicks on the "navigation_tab_bar.support_tab" tab
     Then the "main_title_native_textfield" webview element as native is visible in the actual screen

  @jira.<jira_id> @<ber> @<test_priority> @android @blaude @ios @jira.cv.14.8 @jira.link.detects.LOC-1067
  @jira.link.detects.OBO2DE-123 @jira.link.parent_test_plan.QANOV-402198 @mobile @raitt_drop1 @<har>
  Scenario Outline: A BOX7 blaude <account_type> user with <num_products> active mobile line product/s can access to the Support tab content
    SpatialBuzz SDK will provide a set of network quality features: network check, network coverage map, network issues
    reporting form, speed check & history. These features will only be available when the customer has granted their
    permission to use the SDK. This consent will be gathered via the Usercentric SDK.
    Given user has a "box7" account type
      And user has a "<account_type>" account type
      And user has "<num_products>" products
      And user has a "mobile_line" product in "active" status
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.support_tab" tab
     Then the "Support" page is displayed
      And the "[LANG:pageelements.navigation_tab_bar.support_tab]" header is displayed
      And the "header.title" textfield with "[LANG:support.support_tab.main_title]" text is displayed
      And the "contact_title" textfield with "[LANG:support.support_tab.entry_points.contact_title]" text is displayed
      And the "contact_call_me_back.title" entrypoint with "[LANG:support.support_tab.entry_points.call_me_back]" text is displayed
      And the "contact_click_to_call.title" entrypoint with "[LANG:support.support_tab.entry_points.click_to_call]" text is displayed
      And the "contact_all_contact_channels.title" entrypoint with "[LANG:support.support_tab.entry_points.all_contact_channels]" text is displayed
      And the "network_title" textfield with "[LANG:support.support_tab.entry_points.network_title]" text is displayed
      And the "network_live_check.title" entrypoint with "[LANG:support.support_tab.entry_points.live_check]" text is displayed
      And the "network_coverage.title" entrypoint with "[LANG:support.support_tab.entry_points.network_coverage]" text is displayed
      And the "network_speed_check.title" entrypoint with "[LANG:support.support_tab.entry_points.speed_check]" text is displayed
      And the "faq_title" textfield with "[LANG:support.support_tab.entry_points.help_me_title]" text is displayed
      And the "faq_see_all_faqs.title" entrypoint with "[LANG:support.support_tab.entry_points.faq]" text is displayed

    @manual
    Examples:
          | account_type | num_products | test_priority | ber | har | jira_id      |
          | postpay      | 1            | smoke         |     | har | QANOV-308719 |
          | postpay      | several      | smoke         |     |     | QANOV-308721 |

    @automatic @live @next
    Examples:
          | account_type | num_products | test_priority | ber | har | jira_id      |
          | prepay       | 1            | sanity        | ber |     | QANOV-308722 |

  @jira.QANOV-420521 @android @ber @blaude @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile
  @raitt_drop1 @sanity @har
  Scenario: A RAITT blaude prepay user with active mobile line can access to the Support tab content
    SpatialBuzz SDK will provide a set of network quality features: network check, network coverage map, network issues
    reporting form, speed check & history. These features will only be available when the customer has granted their
    permission to use the SDK. This consent will be gathered via the Usercentric SDK.
    Given user has a "raitt" account type
      And user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.support_tab" tab
     Then the "Support" page is displayed
      And the "[LANG:pageelements.navigation_tab_bar.support_tab]" header is displayed
      And the "main_title_textfield" textfield with "[LANG:support.support_tab.main_title]" text is displayed
      And the "contact.title_textfield" textfield with "[LANG:support.support_tab.entry_points.contact_title]" text is displayed
      And the "contact.call_me_back" entrypoint is not displayed
      And the "contact.click_to_call" entrypoint with "[LANG:support.support_tab.entry_points.click_to_call]" text is displayed
      And the "contact.all_contact_channels" entrypoint is not displayed
      And the "network.title_textfield" textfield with "[LANG:support.support_tab.entry_points.network_title]" text is displayed
      And the "network.live_check_entrypoint" entrypoint with "[LANG:support.support_tab.entry_points.live_check]" text is displayed
      And the "network.network_coverage_entrypoint" entrypoint with "[LANG:support.support_tab.entry_points.network_coverage]" text is displayed
      And the "network.speed_check_entrypoint" entrypoint with "[LANG:support.support_tab.entry_points.speed_check]" text is displayed
      And the "faqs.title_textfield" textfield with "[LANG:support.support_tab.entry_points.help_me_title]" text is displayed
      And the "faqs.see_all_faqs" entrypoint with "[LANG:support.support_tab.entry_points.faq]" text is displayed

  @jira.QANOV-308720 @android @blaude @ios @jira.cv.14.8 @jira.link.detects.LOC-1067 @jira.link.detects.OBO2DE-123
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop1 @smoke
  Scenario: A blaude user with only MyHandy products can access to the Support tab content
    SpatialBuzz SDK will provide a set of network quality features: network check, network coverage map, network issues
    reporting form, speed check & history. These features will only be available when the customer has granted their
    permission to use the SDK. This consent will be gathered via the Usercentric SDK.
    Given user has a "box7" account type
      And user has a "postpay" account type
      And user has a "my_handy" product in "active" status
      And user does not have "mobile_line" product
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.support_tab" tab
     Then the "Support" page is displayed
      And the "[LANG:pageelements.navigation_tab_bar.support_tab]" header is displayed
      And the "main_title_textfield" textfield with "[LANG:support.support_tab.main_title]" text is displayed
      And the "contact.title_textfield" textfield with "[LANG:support.support_tab.entry_points.contact_title]" text is displayed
      And the "contact.call_me_back" entrypoint is not displayed
      And the "contact.click_to_call" entrypoint with "[LANG:support.support_tab.entry_points.click_to_call]" text is displayed
      And the "contact.all_contact_channels" entrypoint with "[LANG:support.support_tab.entry_points.all_contact_channels]" text is displayed
      And the "network.title_textfield" textfield with "[LANG:support.support_tab.entry_points.network_title]" text is displayed
      And the "network.live_check_entrypoint" entrypoint with "[LANG:support.support_tab.entry_points.live_check]" text is displayed
      And the "network.network_coverage_entrypoint" entrypoint with "[LANG:support.support_tab.entry_points.network_coverage]" text is displayed
      And the "network.speed_check_entrypoint" entrypoint with "[LANG:support.support_tab.entry_points.speed_check]" text is displayed
      And the "faqs.title_textfield" textfield with "[LANG:support.support_tab.entry_points.help_me_title]" text is displayed
      And the "faqs.see_all_faqs" entrypoint with "[LANG:support.support_tab.entry_points.faq]" text is displayed

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile @o2de
  Scenario Outline: A o2de <account_type> user with <num_products> active mobile line or internet@home product/s can access to the Support tab content
    SpatialBuzz SDK will provide a set of network quality features: network check, network coverage map, network issues
    reporting form, speed check & history. These features will only be available when the customer has granted their
    permission to use the SDK. This consent will be gathered via the Usercentric SDK.
    A "Next Best Shop" card will be displayed if the next best shop parameters are available (the only optional field is
    book appointment, so the "Next Best Shop" card won't be displayed if any other field from the API is not received).
    Given user has a "<account_type>" account type
      And user has "<num_products>" products
      And user has any "<product_type>" product in "active" status
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.support_tab" tab
     Then the "Support" page is displayed
      And the "[LANG:pageelements.navigation_tab_bar.support_tab]" header is displayed
      And the "header.title" textfield with "[LANG:support.support_tab.main_title]" text is displayed
      And the "contact_title" textfield with "[LANG:support.support_tab.entry_points.contact_title]" text is displayed
      And the "contact_click_to_call.title" entrypoint with "[LANG:support.support_tab.entry_points.click_to_call]" text is displayed
      And the "contact_shop_finder.title" entrypoint with "[LANG:support.support_tab.entry_points.shop_finder]" text is displayed
      And the "contact_all_contact_channels.title" entrypoint with "[LANG:support.support_tab.entry_points.all_contact_channels]" text is displayed
      And the "network_title" textfield with "[LANG:support.support_tab.entry_points.network_title]" text is displayed
      And the "network_live_check.title" entrypoint with "[LANG:support.support_tab.entry_points.live_check]" text is displayed
      And the "network_coverage.title" entrypoint with "[LANG:support.support_tab.entry_points.network_coverage]" text is displayed
      And the "network_speed_check.title" entrypoint with "[LANG:support.support_tab.entry_points.speed_check]" text is displayed
      And the "faq_title" textfield with "[LANG:support.support_tab.entry_points.help_me_title]" text is displayed
      And the "faq_o2_community.title" entrypoint with "O₂ Community" text is displayed
      And the "faq_see_all_faqs.title" entrypoint with "[LANG:support.support_tab.entry_points.faq]" text is displayed

    @manual
    Examples:
          | cv    | account_type | num_products | product_type                 | test_priority | ber | parent_test_plan | jira_id      |
          | 14.8  | postpay      | 1            | mobile_line                  | smoke         |     |                  | QANOV-376936 |
          | 14.11 | postpay      | 1            | internet_at_home             | smoke         |     | QANOV-437471     | QANOV-376937 |
          | 14.8  | postpay      | several      | mobile_line;internet_at_home | smoke         |     | QANOV-437471     | QANOV-376938 |

    @automatic @live @next
    Examples:
          | cv   | account_type | num_products | product_type | test_priority | ber | parent_test_plan | jira_id      |
          | 14.8 | prepay       | 1            | mobile_line  | sanity        | ber |                  | QANOV-376939 |

  @jira.QANOV-376940 @android @ios @jira.cv.14.8 @manual @mobile @o2de @smoke
  Scenario: A o2de user with only MyHandy products can access to the Support tab content
    SpatialBuzz SDK will provide a set of network quality features: network check, network coverage map, network issues
    reporting form, speed check & history. These features will only be available when the customer has granted their
    permission to use the SDK. This consent will be gathered via the Usercentric SDK.
    Given user has a "postpay" account type
      And user has a "my_handy" product in "active" status
      And user does not have "mobile_line" product
      And user does not have "internet_at_home" product
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.support_tab" tab
     Then the "Support" page is displayed
      And the "[LANG:pageelements.navigation_tab_bar.support_tab]" header is displayed
      And the "main_title_textfield" textfield with "[LANG:support.support_tab.main_title]" text is displayed
      And the "contact.title_textfield" textfield with "[LANG:support.support_tab.entry_points.contact_title]" text is displayed
      And the "contact.click_to_call" entrypoint with "[LANG:support.support_tab.entry_points.click_to_call]" text is displayed
      And the "contact.shop_finder" entrypoint with "[LANG:support.support_tab.entry_points.shop_finder]" text is displayed
      And the "contact.all_contact_channels" entrypoint with "[LANG:support.support_tab.entry_points.all_contact_channels]" text is displayed
      And the "network.title_textfield" textfield with "[LANG:support.support_tab.entry_points.network_title]" text is displayed
      And the "network.live_check_entrypoint" entrypoint with "[LANG:support.support_tab.entry_points.live_check]" text is displayed
      And the "network.network_coverage_entrypoint" entrypoint with "[LANG:support.support_tab.entry_points.network_coverage]" text is displayed
      And the "network.speed_check_entrypoint" entrypoint with "[LANG:support.support_tab.entry_points.speed_check]" text is displayed
      And the "faqs.title_textfield" textfield with "[LANG:support.support_tab.entry_points.help_me_title]" text is displayed
      And the "faqs.o2_community" entrypoint with "O2 Community" text is displayed
      And the "faqs.see_all_faqs" entrypoint with "[LANG:support.support_tab.entry_points.faq]" text is displayed

  @jira.<jira_id> @<ber> @<test_priority> @android @blaude @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-306250
  @jira.link.parent_test_plan.QANOV-402198 @mobile
  Scenario Outline: A BOX7 blaude <account_type> user with all products cancelled can access to the Support tab content
    Cancelled users cannot use the "call me back" service.
    Multiproduct user will all products cancelled: 01796802363 / #brt12345678
    Given user has a "box7" account type
      And user has a "<account_type>" account type
      And user has "<num_products>" products
      And user has a "<product_type>" product
      And user has all products in "cancelled" status
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.support_tab" tab
     Then the "Support" page is displayed
      And the "[LANG:pageelements.navigation_tab_bar.support_tab]" header is displayed
      And the "header.title" textfield with "[LANG:support.support_tab.main_title]" text is displayed
      And the "contact_title" textfield with "[LANG:support.support_tab.entry_points.contact_title]" text is displayed
      And the "contact_call_me_back.title" entrypoint is not displayed
      And the "contact_click_to_call.title" entrypoint with "[LANG:support.support_tab.entry_points.click_to_call]" text is displayed
      And the "contact_all_contact_channels.title" entrypoint with "[LANG:support.support_tab.entry_points.all_contact_channels]" text is displayed
      And the "network_title" textfield with "[LANG:support.support_tab.entry_points.network_title]" text is displayed
      And the "network_live_check.title" entrypoint with "[LANG:support.support_tab.entry_points.live_check]" text is displayed
      And the "network_coverage.title" entrypoint with "[LANG:support.support_tab.entry_points.network_coverage]" text is displayed
      And the "network_speed_check.title" entrypoint with "[LANG:support.support_tab.entry_points.speed_check]" text is displayed
      And the "faq_title" textfield with "[LANG:support.support_tab.entry_points.help_me_title]" text is displayed
      And the "faq_see_all_faqs.title" entrypoint with "[LANG:support.support_tab.entry_points.faq]" text is displayed

    @manual
    Examples:
          | account_type | num_products | product_type | test_priority | ber | jira_id      |
          | postpay      | 1            | mobile_line  | regression    |     | QANOV-308062 |
          | postpay      | 1            | my_handy     | regression    |     | QANOV-308063 |
          | prepay       | 1            | mobile_line  | regression    |     | QANOV-308065 |

    @automatic @qa @raitt_drop1
    Examples:
          | account_type | num_products | product_type | test_priority | ber | jira_id      |
          | postpay      | several      | any          | smoke         | ber | QANOV-308064 |

  @jira.QANOV-420522 @android @blaude @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile
  @raitt_drop1 @regression
  Scenario: A RAITT blaude prepay user with all products cancelled can access to the Support tab content
    Cancelled users cannot use the "call me back" service.
    Given user has a "raitt" account type
      And user has a "prepay" account type
      And user has all products in "cancelled" status
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.support_tab" tab
     Then the "Support" page is displayed
      And the "[LANG:pageelements.navigation_tab_bar.support_tab]" header is displayed
      And the "main_title_textfield" textfield with "[LANG:support.support_tab.main_title]" text is displayed
      And the "contact.title_textfield" textfield with "[LANG:support.support_tab.entry_points.contact_title]" text is displayed
      And the "contact.call_me_back" entrypoint is not displayed
      And the "contact.click_to_call" entrypoint with "[LANG:support.support_tab.entry_points.click_to_call]" text is displayed
      And the "contact.all_contact_channels" entrypoint is not displayed
      And the "network.title_textfield" textfield with "[LANG:support.support_tab.entry_points.network_title]" text is displayed
      And the "network.live_check_entrypoint" entrypoint with "[LANG:support.support_tab.entry_points.live_check]" text is displayed
      And the "network.network_coverage_entrypoint" entrypoint with "[LANG:support.support_tab.entry_points.network_coverage]" text is displayed
      And the "network.speed_check_entrypoint" entrypoint with "[LANG:support.support_tab.entry_points.speed_check]" text is displayed
      And the "faqs.title_textfield" textfield with "[LANG:support.support_tab.entry_points.help_me_title]" text is displayed
      And the "faqs.see_all_faqs" entrypoint with "[LANG:support.support_tab.entry_points.faq]" text is displayed

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile @o2de
  Scenario Outline: A o2de <account_type> user with all products cancelled can access to the Support tab content
    Cancelled users cannot use the "call me back" service.
    A "Next Best Shop" card will be displayed if the next best shop parameters are available (the only optional field is
    book appointment, so the "Next Best Shop" card won't be displayed if any other field from the API is not received).
    Given user has a "<account_type>" account type
      And user has "<num_products>" products
      And user has a "<product_type>" product
      And user has all products in "cancelled" status
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.support_tab" tab
     Then the "Support" page is displayed
      And the "[LANG:pageelements.navigation_tab_bar.support_tab]" header is displayed
      And the "header.title" textfield with "[LANG:support.support_tab.main_title]" text is displayed
      And the "contact_title" textfield with "[LANG:support.support_tab.entry_points.contact_title]" text is displayed
      And the "contact_click_to_call.title" entrypoint with "[LANG:support.support_tab.entry_points.click_to_call]" text is displayed
      And the "contact_shop_finder.title" entrypoint with "[LANG:support.support_tab.entry_points.shop_finder]" text is displayed
      And the "contact_all_contact_channels.title" entrypoint with "[LANG:support.support_tab.entry_points.all_contact_channels]" text is displayed
      And the "network_title" textfield with "[LANG:support.support_tab.entry_points.network_title]" text is displayed
      And the "network_live_check.title" entrypoint with "[LANG:support.support_tab.entry_points.live_check]" text is displayed
      And the "network_coverage.title" entrypoint with "[LANG:support.support_tab.entry_points.network_coverage]" text is displayed
      And the "network_speed_check.title" entrypoint with "[LANG:support.support_tab.entry_points.speed_check]" text is displayed
      And the "faq_title" textfield with "[LANG:support.support_tab.entry_points.help_me_title]" text is displayed
      And the "faq_o2_community.title" entrypoint with "O₂ Community" text is displayed
      And the "faq_see_all_faqs.title" entrypoint with "[LANG:support.support_tab.entry_points.faq]" text is displayed

    @manual
    Examples:
          | cv    | account_type | num_products | product_type     | test_priority | ber | parent_test_plan          | jira_id      |
          | 14.2  | postpay      | 1            | mobile_line      | regression    |     | QANOV-306250              | QANOV-308066 |
          | 14.2  | postpay      | 1            | my_handy         | regression    |     | QANOV-306250              | QANOV-308067 |
          | 14.11 | postpay      | 1            | internet_at_home | regression    |     | QANOV-306250:QANOV-437471 | QANOV-308068 |
          | 14.2  | postpay      | several      | any              | regression    |     | QANOV-306250              | QANOV-308069 |

    @automatic @qa
    Examples:
          | cv   | account_type | num_products | product_type | test_priority | ber | parent_test_plan | jira_id      |
          | 14.2 | prepay       | 1            | mobile_line  | smoke         | ber | QANOV-306250     | QANOV-308070 |

  @jira.QANOV-408275 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity @tbd
  Scenario: An o2es user can access to the Support tab content
    TBD the modules for the cms.
    Whatsapp support card is only displayed within support service time from 9 to 22 (Mon-Sun)
    Given user is in the "Account" page
      And user has the "Phone Assistance,Chat Assistance,Email Assistance,Whatsapp Assistance,Availabilty Times,More Info,Incidences,New Incidence" modules configured in CMS for "Support" page
     When clicks on the "navigation_tab_bar.support_tab" tab
     Then the "Support" page is displayed
      And the "[LANG:pageelements.navigation_tab_bar.support_tab]" header is displayed
      And the "main_title_textfield" textfield with "[LANG:support.support_tab.main_title]" text is displayed
      And the "contact_methods" carousel is displayed
      And each card in the "contact_methods" carousel has the "icon" field
      And each card in the "contact_methods" carousel has the "text" field
      And the "contact_methods.phone" card is displayed
      And the "contact_methods.email" card is displayed
      And the "more_info" module is displayed
      And the "more_info.icon" icon is displayed
      And the "more_info.title" textfield is displayed
      And the "more_info.description" textfield is displayed
      And the "more_info.chevron" textfield is displayed
      And the "incidences_title" textfield is displayed
      And the "new_incidence_module" module is displayed
      And the "new_incidence_module.icon" icon is displayed
      And the "new_incidence_module.title" textfield is displayed
      And the "new_incidence_module.description" textfield is displayed
      And the "new_incidence_module.button" button is displayed
      And the "incidences_module" module is displayed
      And the "incidences_module.icon" icon is displayed
      And the "incidences_module.title" textfield is displayed
      And the "incidences_module.description" textfield is displayed
      And the "incidences_module.chevron" element is on display
      And the "whatsapp_availabilty_times_title" textfield is displayed
      And the "whatsapp_availabilty_times_description" textfield is displayed
