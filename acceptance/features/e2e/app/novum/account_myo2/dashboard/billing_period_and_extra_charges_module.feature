# -*- coding: utf-8 -*-
@jira.QANOV-126808
Feature: Billing Period and Extra Charges Module


  @jira.QANOV-5784 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.relates_to.NOV-101748 @live @mobile
  @netcracker @next @o2uk @smoke @webapp
  Scenario: User can see when the billing period ends
    internal_checkpoint="billing_cycle.days format: X days/hours
    billing_cycle.subtitle format: on DD MMM 'YY"
    Given user has a "postpay" account type
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And waits until the "billing_cycle" element is visible
     Then the "billing_cycle.title" textfield with "Next bill will arrive" text is displayed
      And the "billing_cycle.subtitle" textfield with the "on (0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "billing_cycle.value" textfield with the "in \d+ (days|hours)" format is displayed

  @jira.<jira_id> @<ber> @<test_priority> @android @automatic @ios @jira.cv.11.1 @jira.link.relates_to.NOV-100762 @mobile
  @netcracker @o2uk @webapp
  Scenario Outline: A <account_type> user with <extra_charges> extra charges can check the extra amount to be paid in the next invoice
    PAYM (CERT0): inl_may8842@o2.com (campaign 10.4) --> invalid user, without bills
    MBB (CERT0): 12oc71800680@stf.ref.o2.co.uk
    commented_tags="@depends_on.NOV-30 @depends_on.NOV-63964 @depends_on.NOV-91949"
    Given user has a "<account_type>" account type
      And user has "<extra_charges>" recent charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And waits until the "extra_charges" element is visible
     Then the "extra_charges" module is displayed
      And the "extra_charges.title" textfield with "Total extra charges" text is displayed
      And the "extra_charges.subtitle" textfield with "Added to next bill" text is displayed
      And the "extra_charges.value" textfield with the "<extra_charges_amount>" format is displayed
      And the "extra_charges.value" textfield is displayed in "<extra_charges_colour>" color

    @cert0 @cert1 @live @next
    Examples:
          | account_type | extra_charges | extra_charges_amount | extra_charges_colour | ber | test_priority | jira_id    |
          | PAYM         | 0             | £0.00                | black                |     | sanity        | QANOV-5245 |
          | MBB          | 0             | £0.00                | black                |     | regression    | QANOV-5247 |

    @cert0 @cert1
    Examples:
          | account_type | extra_charges | extra_charges_amount | extra_charges_colour | ber | test_priority | jira_id    |
          | PAYM         | >0            | £\d+.\d\d            | red                  | ber | smoke         | QANOV-5244 |
          | MBB          | >0            | £\d+.\d\d            | red                  |     | regression    | QANOV-5246 |

  @jira.QANOV-5668 @android @ios @jira.cv.9.7 @jira.link.relates_to.NOV-46 @mobile @netcracker @no_automatable @o2uk
  @regression
  Scenario: Consumption is charged when allowance for minutes is exhausted
    This will take some time (minutes to hours) to be updated.
    Given user has a "PAYM" account type
      And user has consumed "100%" of the "minutes" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When consumes "minutes" allowance
     Then the "minutes" consumed are charged in the "total_extra_charges" textfield
