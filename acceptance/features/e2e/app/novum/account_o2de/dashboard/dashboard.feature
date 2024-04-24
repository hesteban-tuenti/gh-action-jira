# -*- coding: utf-8 -*-
@jira.QANOV-38254
Feature: Dashboard

  Actions Before each Scenario:
    Given user is in the "Account" page


  @jira.QANOV-38255 @android @automatic @ber @ios @jira.cv.14.2 @jira.link.detects.O2DE-2838 @jira.link.detects.O2DE-2875
  @live @mobile @next @o2de @sanity @webapp
  Scenario: A postpay user can see the account dashboard for his/her active mobile line
    There are some optional modules that could be displayed:
    - Throttling/o2 Free module: when a user without data automatic in the plan finishes his/her national + EU data
    allowance, or when a user without data automatic in the plan reaches the maximum amount billed for international
    data, or when a user with data automatic in the plan consumes the three data automatic bundles.
    - Data automatic module: when a user with data automatic in the plan finished his/her national + EU data allowance.
    - SVAs module: when any SVA is available.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has the matching subscription selected in the account
      And user has any of the "agreement-details,agreement-details-terminated" modules configured in CMS for "dashboard" page
      And user has the "counters-carousel,smart-actions,extra-consumption,invoices-chart,services-summary,simple-highlighted-card" module configured in CMS for "dashboard" page
      And the "smart-actions" module configured in CMS for "dashboard" page has the "Bundle management" buttons
     Then the "consumption" module is displayed
      And the "purchase_data_button" button with "Datenvolumen optimieren" text is displayed
      And the "manage_bundle_button" button with "Alle Optionen verwalten" text is displayed
      And the "extra_min_and_sms_consumption" module is displayed
      And the "bills" module is displayed
      And the "tariff_card" module is displayed
      And the "highlighted_services" module is displayed
      And the "promo" module is displayed

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.11 @jira.link.detects.O2DE-2871
  @jira.link.detects.O2DE-3045 @jira.link.parent_test_plan.QANOV-437471 @mobile @o2de @webapp
  Scenario Outline: A postpay user can see the account dashboard for his/her active <internet_at_home_product> product
    Existing internet@home products:
    - DSL: internet + landline
    - Kabel (Cable/Coaxial): internet + landline
    - Fiber: internet + landline
    - HomeSpot (FMS): landline + internet + mobile phone
    - DataSpot (Same as HomeSpot but only data): internet + mobile phone
    There are some optional modules that could be displayed:
    - SVAs module: when any SVA is available.
    Given user has a "postpay" account type
      And user has a "<internet_at_home_product>" product in "active" status
      And user has the matching subscription selected in the account
      And user has the "invoices-chart,services-summary,tariff-summary,service-summary-1,simple-highlighted-card" modules configured in CMS for "dashboard" page
      And the "services-summary" module configured in CMS for "dashboard" page has the "Internet Bundle Purchase" list to render
     Then the "purchase_data_button" button is not displayed
      And the "manage_bundle_button" button with "Alle Optionen verwalten" text is displayed
      And the "bills" module is displayed
      And the "tariff_card" module is displayed
      And the "highlighted_services" module is displayed
      And the "promo" module is displayed

    @automatic @next @live
    Examples:
          | internet_at_home_product | ber | test_priority | jira_id      |
          | dsl                      | ber | sanity        | QANOV-38257  |

    @manual
    Examples:
          | internet_at_home_product | ber | test_priority | jira_id      |
          | cable                    |     | smoke         | QANOV-498389 |
          | fiber                    |     | smoke         | QANOV-498390 |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.11 @jira.link.detects.O2DE-2871
  @jira.link.detects.O2DE-3045 @jira.link.parent_test_plan.QANOV-437471 @mobile @o2de @webapp
  Scenario Outline: A postpay user can see the account dashboard for his/her active <internet_at_home_product> product
    Existing internet@home products:
    - DSL: internet + landline
    - Kabel (Cable/Coaxial): internet + landline
    - Fiber: internet + landline
    - HomeSpot (FMS): landline + internet + mobile phone
    - DataSpot (Same as HomeSpot but only data): internet + mobile phone
    There are some optional modules that could be displayed:
    - SVAs module: when any SVA is available.
    Given user has a "postpay" account type
      And user has a "<internet_at_home_product>" product in "active" status
      And user has the matching subscription selected in the account
      And user has the "invoices-chart,services-summary,tariff-summary,service-summary-1,simple-highlighted-card" modules configured in CMS for "dashboard" page
      And the "services-summary" module configured in CMS for "dashboard" page has the "Internet Bundle Purchase" list to render
     Then the "purchase_data_button" button is not displayed
      And the "manage_bundle_button" button is not displayed
      And the "bills" module is displayed
      And the "tariff_card" module is displayed
      And the "highlighted_services" module is displayed
      And the "promo" module is displayed

    @automatic @next @live
    Examples:
          | internet_at_home_product | ber | test_priority | jira_id      |
          | home_spot                | ber | sanity        | QANOV-498391 |

    @manual
    Examples:
          | internet_at_home_product | ber | test_priority | jira_id      |
          | data_spot                |     | smoke         | QANOV-498392 |

  @jira.QANOV-38256 @android @automatic @ios @jira.cv.14.2 @mobile @o2de @qa @sanity @webapp
  Scenario: Postpay user can see the account dashboard of his/her active My Handy product
    The static promo teaser has been removed for MyHandy products.
    Given user has a "postpay" account type
      And user has a "my_handy" product in "active" status
      And user has the matching subscription selected in the account
      And user has any of the "device-plan,device-plan-terminated" modules configured in CMS for "dashboard" page
     Then the "myhandy" module is displayed
      And the "promo" module is not displayed
      And the "highlighted_services" module is displayed

  @jira.QANOV-38265 @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: Postpay user without SVAs cannot see the "SVAs" module in the account dashboard
    Given user has a "postpay" account type
      And user has a "any" product in "active" status
      And user has not any "SVA" service available
      And user has the matching subscription selected in the account
     Then the "SVAs" module is not displayed

  @jira.QANOV-38266 @android @ios @jira.cv.Future @jira.link.detects.LOC-602 @manual @mobile @o2de @smoke
  Scenario: Postpay user with SVAs can see the "SVAs" module in the account dashboard
    The SVAs section is an 'Extras' module configured in CMS. The title is optional in this type of module, but for this
    section it should be filled with 'ZUSATZOPTIONEN'.
    An optional link with the 'Mehr sehen' text could be displayed next to the SVA title if the Extras module is
    configured in CMS with this link.
    Given user has a "postpay" account type
      And user has a "any" product in "active" status
      And user has at least a "SVA" service available
      And user has the matching subscription selected in the account
      And user has the "Extras" module configured in CMS for "Account" page
      And the "Extras" module configured in CMS for "Account" page has the "Account Dashboard" extras to render
     Then the "SVAs" module is displayed
      And the "SVAs.carousel" carousel is displayed

  @jira.QANOV-54175 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-38266 @manual @mobile @o2de @regression
  Scenario: Postpay user with SVAs can access to the SVAs details from the account dashboard
    Given user has a "postpay" account type
      And user has a "any" product in "active" status
      And user has at least a "SVA" service available
      And user has the matching subscription selected in the account
      And user has the "Extras" module configured in CMS for "Account" page
      And the "Extras" module configured in CMS for "Account" page has the "Account Dashboard" extras to render
     When clicks on the "SVAs.link" link
     Then the "SVAs" page is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-47785 @android @automatic @ber @ios @jira.cv.14.2 @jira.link.detects.O2DE-2838 @jira.link.detects.O2DE-2872
  @jira.link.detects.O2DE-3890 @live @mobile @next @o2de @sanity @webapp
  Scenario: A prepay user can see the account dashboard for his/her active mobile line
    The "subscription_selector.subtitle" textfield will display the tariff name.
    If the user has the "CUSTOMER_SHOW_BALANCE" forbidden use case, the "balance" module will not be displayed, and two
    quick-actions buttons will be added under the consumption module (topup, movements).
    The promo module has been removed for prepay users in MeinO2.
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has not the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has the "counters-carousel,smart-actions,balance,simple-action-row,services-summary" module configured in CMS for "dashboard" page
      And the "smart-actions" module configured in CMS for "dashboard" page has the "Bundle management" buttons
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield with the user phone number is displayed
      And the "subscription_selector.subtitle" textfield is displayed
      And the "consumption" module is displayed
      And the "purchase_data_button" button with "Datenvolumen optimieren" text is displayed
      And the "manage_bundle_button" button with "Alle Optionen verwalten" text is displayed
      And the "balance" module is displayed
      And the "balance_movements" module is displayed
      And the "tariff_card" module is displayed
      And the "highlighted_services" module is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @smoke
  Scenario Outline: A <account_type> user can see the "services" module of his/her active mobile line product
    The Services section is an "Entrypoint list" module configured in CMS. The title is optional in this type of
    module, but for this section it should be filled with "DIENSTLEISTUNGEN".
    An optional link with the 'Alle ansehen' text could be displayed next to the services title if the entrypoint list
    is configured in CMS with this link and if the maximum number of services allowed in summary view of the module is
    lower than the total number of services configured for this module.
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product in "active" status
      And user has the matching subscription selected in the account
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And the "Entrypoint list" module configured in CMS for "Account" page has the "Mobile Dashboard" list to render
      And the "Entrypoint list" module configured in CMS for "Account" page has a "LIST" representation
      And the "Entrypoint list" module configured in CMS for "Account" page has a total of ">0" services
     Then the "highlighted_services" module is displayed
      And the "highlighted_services_list" list is displayed

    Examples:
          | account_type | depends_on  | jira_id     |
          | prepay       | QANOV-47785 | QANOV-47800 |
          | postpay      | QANOV-38255 | QANOV-44456 |

  @jira.QANOV-38269 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-38255 @jira.link.detects.O2DE-2838 @manual
  @mobile @o2de @regression
  Scenario: A postpay user can see a promotion available in the account dashboard of his/her active mobile line product
    An optional link with the 'Zum Angebot' text could be displayed next to the promo title if the OB wants to
    highlight something about the promotion.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has the matching subscription selected in the account
      And user has the "Promotion" module configured in CMS for "Account" page
     Then the "promo" module is displayed
      And the "promo.title" textfield with "ANGEBOTE" text is displayed

  @jira.QANOV-38258 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-38255 @jira.link.detects.O2DE-2840 @manual
  @mobile @o2de @regression
  Scenario: A postpay user with just one eSIM pending installation can see the "eSIM installation and activation" module in the account dashboard
    eSIM is only available for postpay user.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a SIM in "ready_installation" status
      And user has the matching subscription selected in the account
      And user has the "eSIM installation and activation" module configured in CMS for "Account" page
     Then the "install_and_activate_esim" module is displayed
      And the "install_and_activate_esim.icon" icon is displayed
      And the "install_and_activate_esim.status_tag" textfield with "Ausstehende Installation" text is displayed
      And the "install_and_activate_esim.iccid" textfield with the "\d+" format is displayed
      And the "install_and_activate_esim.sim_format" textfield with "eSIM" text is displayed
      And the "install_and_activate_esim.chevron" icon is displayed

  @jira.QANOV-452264 @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-38255 @manual @mobile @o2de @regression
  Scenario: A postpay user with just one eSIM pending activation can see the "eSIM installation and activation" module in the account dashboard
    eSIM is only available for postpay user.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a SIM in "ready_activation" status
      And user has the matching subscription selected in the account
      And user has the "eSIM installation and activation" module configured in CMS for "Account" page
     Then the "install_and_activate_esim" module is displayed
      And the "install_and_activate_esim.icon" icon is displayed
      And the "install_and_activate_esim.status_tag" textfield with "Bereit zum Aktivieren" text is displayed
      And the "install_and_activate_esim.iccid" textfield with the "\d+" format is displayed
      And the "install_and_activate_esim.sim_format" textfield with "eSIM" text is displayed
      And the "install_and_activate_esim.chevron" icon is displayed

  @jira.QANOV-375526 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-38255 @jira.link.detects.O2DE-2840 @manual
  @mobile @o2de @regression
  Scenario: A postpay user with several eSIM pending installation/activation can see the "eSIM installation and activation" module in the account dashboard
    eSIM is only available for postpay user.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has several SIMs in any "ready_installation;ready_activation" status
      And user has the matching subscription selected in the account
      And user has the "eSIM installation and activation" module configured in CMS for "Account" page
     Then the "install_and_activate_esim" module is displayed
      And the "install_and_activate_esim.carousel" carousel is displayed
      And each element in the "install_and_activate_esim.carousel" carousel has the "icon" field
      And each element in the "install_and_activate_esim.carousel" carousel has the "status_tag" textfield with the "(Ausstehende Installation|Bereit zum Aktivieren)" format
      And each element in the "install_and_activate_esim.carousel" carousel has the "iccid" textfield with the "\d+" format
      And each element in the "install_and_activate_esim.carousel" carousel has the "sim_format" textfield with "eSIM" text
      And each element in the "install_and_activate_esim.carousel" carousel has the "chevron" field

  @jira.QANOV-307991 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @o2de @smoke
  Scenario: Postpay user can see the account dashboard for his/her cancelled mobile line
    Postpay users will see a limited set of features for the cancelled products (during the next 90 days after the cancellation).
    For example, a cancelled contract cannot do:
    - No pack management (for the suspended subscription)
    - No SIM management (for the suspended subscription)
    - No in-app purchases (for the suspended subscription)
    - Can not edit personal data /profile data (if no other active subscription available)
    - Can not edit bank account data (if no other active subscription available)
    - Can not do Cancel contract or any other contract changes (for the suspended subscription)
    - Can not access the consents page (if no other active subscription available)
    - Can not enter vvl flow (renew contract) (if no other active subscription available)
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "cancelled" status
      And user has the matching subscription selected in the account
      And user has the "Subscription Description;Consumption Counters;Extra charges;Last months invoices graph;Tariff card;Entrypoint list" modules configured in CMS for "Account" page
      And the "Entrypoint list" module configured in CMS for "Account" page has the "Mobile Dashboard" list to render
     Then the "mobile_allowances" carousel is not displayed
      And the "manage_bundle_button" button is not displayed
      And the "purchase_data_button" button is not displayed
      And the "extra_min_and_sms_consumption" module is not displayed
      And the "bills" module is displayed
      And the "tariff_card" module is displayed
      And the "highlighted_services" module is not displayed
      And the "SVAs" module is not displayed
      And the "promo" module is displayed

  @jira.QANOV-307992 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-306250
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: A postpay user can see the account dashboard for his/her cancelled internet@home product
    Postpay users will see a limited set of features for the cancelled products (during the next 90 days after the cancellation).
    For example, a cancelled contract cannot do:
    - No pack management (for the suspended subscription)
    - No SIM management (for the suspended subscription)
    - No in-app purchases (for the suspended subscription)
    - Can not edit personal data /profile data (if no other active subscription available)
    - Can not edit bank account data (if no other active subscription available)
    - Can not do Cancel contract or any other contract changes (for the suspended subscription)
    - Can not access the consents page (if no other active subscription available)
    - Can not enter vvl flow (renew contract) (if no other active subscription available)
    Given user has a "postpay" account type
      And user has a "internet_at_home" product in "cancelled" status
      And user has the matching subscription selected in the account
      And user has the "Internet speed header;Consumption Counters;Last months invoices graph;Tariff card;Entrypoint list" modules configured in CMS for "Account" page
      And the "Entrypoint list" module configured in CMS for "Account" page has the "Internet Dashboard" list to render
     Then the "manage_bundle_button" button is not displayed
      And the "purchase_data_button" button is not displayed
      And the "bills" module is displayed
      And the "tariff_card" module is displayed
      And the "highlighted_services" module is not displayed
      And the "SVAs" module is not displayed
      And the "promo" module is displayed

  @jira.QANOV-571859 @android @o2de @ios @jira.cv.14.2 @manual @mobile @regression @jira.link.parent_test_plan.QANOV-306250
  Scenario: Postpay user can see the account dashboard for his/her cancelled My Handy product
    Given user has a "my_handy" product in "cancelled" status
      And user has the matching subscription selected in the account
      And user has any of the "device-plan,device-plan-terminated" modules configured in CMS for "dashboard" page
     Then the "myhandy" module is displayed
      And the "promo" module is not displayed
      And the "highlighted_services" module is not displayed

  @jira.QANOV-307993 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @o2de @smoke
  Scenario: Prepay user can see the account dashboard for his/her cancelled mobile line
    Prepay users will see a limited set of features for the cancelled products (during the next 90 days after the cancellation).
    For example, a cancelled contract cannot do:
    - No pack management (for the suspended subscription)
    - No SIM management (for the suspended subscription)
    - No in-app purchases (for the suspended subscription)
    - No balance module (for the suspended subscription)
    - Can not edit personal data /profile data (if no other active subscription available)
    - Can not edit bank account data (if no other active subscription available)
    - Can not do Cancel contract or any other contract changes (for the suspended subscription)
    - Can not access the consents page (if no other active subscription available)
    - Can not enter vvl flow (renew contract) (if no other active subscription available)
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "cancelled" status
      And user has the "Subscription Description;Consumption Counters;Tariff card;Entrypoint list" modules configured in CMS for "Account" page
     Then the "consumption" module is not displayed
      And the "manage_bundle_button" button is not displayed
      And the "purchase_data_button" button is not displayed
      And the "balance" module is not displayed
      And the "balance_movements" module is displayed
      And the "tariff_card" module is displayed
      And the "promo" module is displayed
      And the "highlighted_services" module is not displayed
