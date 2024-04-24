# -*- coding: utf-8 -*-
@jira.QANOV-392299
Feature: Extra Charges Header Subscription


  @jira.QANOV-392300 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_header_subscription_with_billing_period
  Scenario: A user can see a Extra Charges Header Subscription module with the default field configured with BILLING_PERIOD
    To be executed in QA
    Given the "Extra Charges Header For Standalone Product" module is configured in CMS for "Modular Page Configurable Modules By Product" page
     When user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "extra_charges_header_subscription" element is visible
     Then the "extra_charges_header_subscription.billing_period_title" textfield is displayed
      And the "extra_charges_header_subscription.billing_period" textfield is displayed
      And the "extra_charges_header_subscription.amount_title" textfield is displayed
      And the "extra_charges_header_subscription.amount" textfield is displayed

  @jira.QANOV-392301 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_header_subscription_with_last_month
  Scenario: A user can see a Extra Charges Header Subscription module with the default field configured with LAST_MONTH
    To be executed in QA
    Given the "Extra Charges Header For Standalone Product" module is configured in CMS for "Modular Page Configurable Modules By Product" page
     When user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "extra_charges_header_subscription" element is visible
     Then the "extra_charges_header_subscription.billing_period_title" textfield is not displayed
      And the "extra_charges_header_subscription.billing_period" textfield is not displayed
      And the "extra_charges_header_subscription.amount_title" textfield is displayed
      And the "extra_charges_header_subscription.amount" textfield is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.4 @automatic @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_header_subscription_with_unit_type_<amount>
  Scenario Outline: A user can see an Extra Charges Header Subscription module with a <amount> unit type configured
    To be executed in QA
    If you don't check any unit type, all of them will be checked
    Given the "Extra Charges Header For Standalone Product" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Extra Charges Header For Standalone Product" module configured in CMS has the "unitType" filled
     When user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "extra_charges_header_subscription" element is visible
     Then the "extra_charges_header_subscription.amount_title" textfield is displayed
      And the "extra_charges_header_subscription.amount" textfield is displayed

    Examples:
          | amount   | jira_id      |
          | movement | QANOV-392302 |
          | mms      | QANOV-392303 |
          | sms      | QANOV-392304 |
          | call     | QANOV-392305 |
          | data     | QANOV-392306 |
          | expense  | QANOV-392307 |
          | all      | QANOV-392308 |
