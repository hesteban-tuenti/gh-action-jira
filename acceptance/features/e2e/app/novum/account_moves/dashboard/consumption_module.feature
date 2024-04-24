# -*- coding: utf-8 -*-
@jira.QANOV-126733
Feature: Consumption Module

  Actions Before the Feature:
    Given user has the "consumption-counters-mobile" module configured in CMS for "dashboard" page for the "mobile" product


  @jira.<jira_id> @android @ios @mobile @jira.cv.11.4 @jira.link.relates_to.NOV-151919 @moves
  @regression
  Scenario Outline: A user can swipe among the "consumption" roundels
    LEGADO POSTPAY (Live): 05960856S
    LEGADO PREPAY (Live): PRUEBA00029050
    Given user has a "<account_type>" account type
      And user has "<minimum_allowances>" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "mobile_line_carousel" carousel can be swiped in "left" direction
      And the "mobile_line_carousel" carousel can be swiped in "right" direction

    @manual @jira.link.parent_test_plan.QANOV-189597
    Examples:
          | account_type | minimum_allowances | jira_id    |
          | postpay      | data;minutes       | QANOV-2654 |
          | postpay      | data;sms           | QANOV-2658 |
          | postpay      | sms;minutes        | QANOV-2661 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type  | minimum_allowances | jira_id    |
          | legado prepay | data;minutes       | QANOV-2663 |
          | legado prepay | data;sms           | QANOV-2665 |
          | legado prepay | sms;minutes        | QANOV-2667 |

  @jira.QANOV-38250 @automation.pending_mock @android @ios @mobile @jira.cv.11.14 @manual @impeded_mock
  @moves @regression
  Scenario: There is an API error retrieving the consumption of an allowance: an error is displayed in the consumption roundel
    internal_checkpoint="The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected"
    other_affected_versions="2020-48"
    Given user has "any" allowances in the "mobile_line" product
      And user is in the "Mobile Line Dashboard" page
      And user has the communications and leisure content displayed
      And there is an API error in allowances
     Then the "allowance_roundel" carousel is displayed
      And the "allowance_roundel.error" textfield with "[LANG:account.api_errors.roundel]" text is displayed
