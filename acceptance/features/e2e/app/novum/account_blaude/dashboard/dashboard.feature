# -*- coding: utf-8 -*-
@jira.QANOV-171310
Feature: Dashboard

  Actions Before each Scenario:
    Given user is in the "Account" page


  @jira.QANOV-202548 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @jira.link.detects.O2DE-1851 @live @mobile
  @next @qa @raitt_drop1 @sanity @webapp
  Scenario: A postpay user can see the account dashboard for his/her active mobile line
    There are some optional modules that could be displayed:
    - Throttling module: when a user without data automatic in the plan finishes his/her national + EU data
    allowance, or when a user without data automatic in the plan reaches the maximum amount billed for international
    data, or when a user with data automatic in the plan consumes the three data automatic bundles.
    - Data automatic module: when a user with data automatic in the plan finished his/her national + EU data allowance.
    - SVAs module: when any SVA is available.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has the matching subscription selected in the account
      And user has any of the "agreement-details,agreement-details-2" modules configured in CMS for "dashboard" page
      And user has the "counters-carousel,smart-actions,extra-data-consumption-counter-parts,data-automatic-counters,extra-consumption,invoices-chart,services-summary" module configured in CMS for "dashboard" page
      And the "smart-actions" module configured in CMS for "dashboard" page has the "Bundle management" buttons
     Then the "consumption" module is displayed
      And the "purchase_data_button" button with "Datenvolumen optimieren" text is displayed
      And the "manage_bundle_button" button with "Alle Optionen verwalten" text is displayed
      And the "extra_min_and_sms_consumption" module is displayed
      And the "bills" module is displayed
      And the "tariff_card" module is displayed
      And the "highlighted_services" module is displayed
      And the "promo" module is displayed

  @jira.QANOV-202552 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @jira.link.detects.O2DE-4614
  @jira.link.detects.OBO2DE-118 @live @mobile @next @qa @raitt_drop1 @sanity @webapp
  Scenario: Postpay user can see the account dashboard for his/her active My Handy product
    Given user has a "my_handy" product in "active" status
      And user has the matching subscription selected in the account
      And user has any of the "device-plan,device-plan-terminated" modules configured in CMS for "dashboard" page
     Then the "myhandy" module is displayed
      And the "promo" module is displayed
      And the "highlighted_services" module is displayed

  @jira.QANOV-202560 @android @blaude @ios @jira.cv.Future @manual @mobile @regression
  Scenario: Postpay user without SVAs cannot see the "SVAs" module in the account dashboard
    Given user has a "postpay" account type
      And user has a "any" product in "active" status
      And user has not any "SVA" service available
      And user has the matching subscription selected in the account
     Then the "SVAs" module is not displayed

  @jira.QANOV-202561 @android @blaude @ios @jira.cv.Future @jira.link.detects.LOC-602 @manual @mobile @smoke
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

  @jira.QANOV-202562 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-202561 @manual @mobile @regression
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

  @jira.QANOV-171312 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @jira.link.detects.OBO2DE-300 @live
  @mobile @next @raitt_drop1 @sanity @webapp
  Scenario: A prepay user can see the account dashboard for his/her active mobile line
    The "subscription_selector.subtitle" textfield will display the tariff name.
    If the user has the "CUSTOMER_SHOW_BALANCE" forbidden use case, the "balance" module will not be displayed, and two
    quick-actions buttons will be added under the consumption module (topup, movements).
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has not the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has any of the "balance,balance-hidden" modules configured in CMS for "dashboard" page
      And user has any of the "agreement-details,agreement-details-2" modules configured in CMS for "dashboard" page
      And user has the "counters-carousel,smart-actions,simple-highlighted-card,services-summary" module configured in CMS for "dashboard" page
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
      And the "promo" module is displayed
      And the "highlighted_services" module is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @manual @mobile @raitt_drop1 @smoke
  Scenario Outline: A <account_type> user can see the "services" module of his/her active mobile line product
    The Services section is an 'Entrypoint list' module configured in CMS. The title is optional in this type of
    module, but for this section it should be filled with 'DIENSTLEISTUNGEN'.
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
          | account_type | depends_on   | detects    | jira_id      |
          | prepay       | QANOV-171312 | OBO2DE-106 | QANOV-171313 |
          | postpay      | QANOV-202548 |            | QANOV-202565 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-2784
  @manual @mobile @raitt_drop1 @regression
  Scenario Outline: A <account_type> user can see a promotion available in the account dashboard
    An optional link with the 'Zum Angebot' text could be displayed next to the promo title if the OB wants to
    highlight something about the promotion.
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user has the "Promotion" module configured in CMS for "Account" page
     Then the "promo" module is displayed
      And the "promo.title" textfield is displayed

    Examples:
          | account_type | depends_on   | jira_id      |
          | prepay       | QANOV-171312 | QANOV-171315 |
          | postpay      | QANOV-202548 | QANOV-202563 |

  @jira.QANOV-307973 @android @blaude @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @smoke
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
      And user has any of the "agreement-details,agreement-details-2" modules configured in CMS for "dashboard" page
      And user has the "counters-carousel,smart-actions,extra-data-consumption-counter-parts,data-automatic-counters,extra-consumption,invoices-chart,services-summary" module configured in CMS for "dashboard" page
     Then the "mobile_allowances" carousel is not displayed
      And the "manage_bundle_button" button is not displayed
      And the "purchase_data_button" button is not displayed
      And the "extra_min_and_sms_consumption" module is not displayed
      And the "bills" module is displayed
      And the "tariff_card" module is displayed
      And the "highlighted_services" module is not displayed
      And the "SVAs" module is not displayed
      And the "promo" module is displayed

  @jira.QANOV-571860 @android @blaude @ios @jira.cv.13.9 @jira.link.parent_test_plan.QANOV-306250 @manual @mobile
  @regression
  Scenario: Postpay user can see the account dashboard for his/her cancelled My Handy product
    Given user has a "my_handy" product in "cancelled" status
      And user has the matching subscription selected in the account
      And user has any of the "device-plan,device-plan-terminated" modules configured in CMS for "dashboard" page
     Then the "myhandy" module is displayed
      And the "promo" module is displayed
      And the "highlighted_services" module is not displayed

  @jira.QANOV-307974 @android @blaude @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @smoke
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
      And user has any of the "balance,balance-hidden" modules configured in CMS for "dashboard" page
      And user has any of the "agreement-details,agreement-details-2" modules configured in CMS for "dashboard" page
      And user has the "counters-carousel,smart-actions,simple-highlighted-card,services-summary" module configured in CMS for "dashboard" page
     Then the "consumption" module is not displayed
      And the "manage_bundle_button" button is not displayed
      And the "purchase_data_button" button is not displayed
      And the "balance" module is not displayed
      And the "balance_movements" module is displayed
      And the "tariff_card" module is displayed
      And the "promo" module is displayed
      And the "highlighted_services" module is not displayed

  @jira.QANOV-477108 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-202548 @manual @mobile @regression
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

  @jira.QANOV-477109 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-202548 @manual @mobile @regression
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

  @jira.QANOV-477110 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-202548 @manual @mobile @regression
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
