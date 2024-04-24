# -*- coding: utf-8 -*-
@jira.QANOV-126806
Feature: Consumption Module


  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.relates_to.NOV-193965 @manual @mobile @netcracker @o2uk
  @regression
  Scenario Outline: A <account_type> user can see the consumption counters ordered correctly
    internal_checkpoint="ORDER DEFINED in:
    unified_config/environment/novum/{brand}-{country}/account/bundleCountersSorterConfig.yaml"
    Given user has a "<account_type>" account type
      And user has "<allowance_types>" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "mobile_line_roundels" carousel is ordered by the "<allowance_types>" priorities

    Examples:
          | account_type | allowance_types                 | jira_id      |
          | PAYM         | data;minutes;messages;mms;music | QANOV-5622   |
          | MBB          | data;messages;music             | QANOV-5623   |
          | companion    | data                            | QANOV-106122 |

  @jira.<jira_id> @android @ios @jira.cv.10.5 @jira.link.relates_to.NOV-64304 @manual @mobile @netcracker @o2uk @smoke
  Scenario Outline: A <account_type> user who has only one bundle for a category roundel, can see the expiration date below the roundel in the account dashboard
    internal_checkpoint="Note: we consider that the bundle has expiration date if it is returned by the OB
    expiration_date format: Renewal dd Mmm 'yy - NN days"
    Given user has a "<account_type>" account type
      And user has only one bundle in "<allowance_types>" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "expiration_date" textfield with the "^Renewal \d\d (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d\d - \d+ (day|days)$" format is displayed

    Examples:
          | account_type | allowance_types            | jira_id    |
          | PAYM         | data;minutes;sms;mms;music | QANOV-5644 |
          | MBB          | data;sms;music             | QANOV-5646 |
          | companion    | data                       | QANOV-5648 |

  @jira.<jira_id> @android @ios @jira.cv.10.5 @jira.link.relates_to.NOV-64088 @manual @mobile @netcracker @o2uk
  @regression
  Scenario Outline: A <account_type> user who has more than one bundle in the same category roundel can't see the expiration date under the roundel in the account dashboard
    internal_checkpoint="NOTES: Important: when you access to the consumption details, all data, minutes or SMS
    bundles will displayed, for the different categories, but for the roundel only the ones from the same
    category will be consider. For example, the category Datos can include different bundles that are grouped
    in the same roundel, but in consumption details all of them are itemized.
    IMPORTANT: if the expiration dates of the bundles are the same, the expiration date will be displayed"
    Given user has a "<account_type>" account type
      And user has more than one bundle with different expiration dates in "<allowance_types>" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "expiration_date" textfield is not displayed

    Examples:
          | account_type | allowance_types            | jira_id    |
          | PAYM         | data;minutes;sms;mms;music | QANOV-5650 |
          | MBB          | data;sms;music             | QANOV-5652 |
          | companion    | data                       | QANOV-5654 |

  @jira.<jira_id> @android @ios @jira.cv.9.11 @jira.link.relates_to.NOV-40 @jira.link.relates_to.NOV-43 @mobile
  @netcracker @no_automatable @o2uk @regression
  Scenario Outline: Consumption is discounted from user's current allowances
    internal_checkpoint="NOTE: This will take some time (minutes to hours) to be updated."
    commented_tags="@depends_on.NOV-47637"
    Given user has a "<account_type>" account type
      And the "<allowance_type>" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When consumes "<allowance_type>" allowance
     Then the "<allowance_type>" roundel has been discounted from the balance in the app

    Examples:
          | account_type | allowance_type | jira_id    |
          | PAYM         | data           | QANOV-5656 |
          | PAYM         | minutes        | QANOV-5658 |
          | PAYM         | SMS            | QANOV-5661 |
          | MBB          | data           | QANOV-5663 |
          | MBB          | SMS            | QANOV-5665 |
          | Companion    | data           | QANOV-5667 |

  @jira.<jira_id> @<automatic> @<automation> @<ber> @<env_label> @<impeded_label> @<test_priority> @android @ios
  @jira.cv.10.5 @jira.link.detects.ACCOUNT-16035 @jira.link.relates_to.NOV-64076 @mobile @netcracker @o2uk @<webapp>
  Scenario Outline: A <account_type> user who has consumed less than 100% of his/her <allowance_type> allowance can see the roundel in dark blue color
    Given user has a "<account_type>" account type
      And the "<allowance_type>" allowance is limited in the "mobile_line" product
      And user has consumed "<100%" of the "<allowance_type>" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "<allowance_type>_roundel_color" allowance roundel is displayed in "dark_blue" color

    Examples:
          | account_type | allowance_type | ber | automation              | impeded_label | test_priority | env_label | automatic | jira_id    | webapp |
          | postpay      | data           | ber |                         |               | smoke         | cert0     | automatic | QANOV-5738 | webapp |
          | PAYM         | minutes        |     | automation.pending_mock | impeded_mock  | regression    |           | manual    | QANOV-5739 |        |
          | PAYM         | messages       |     | automation.pending_mock | impeded_mock  | regression    |           | manual    | QANOV-5741 |        |
          | MBB          | messages       |     | automation.pending_mock | impeded_mock  | regression    |           | manual    | QANOV-5745 |        |

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.5 @jira.link.relates_to.NOV-120531 @manual
  @mobile @netcracker @o2uk @regression
  Scenario Outline: A <account_type> user who has an unlimited <allowance_type> allowance with consumption will see the roundel in a specific color
    internal_checkpoint="PAYM user with all allowance unlimited: in05944t_099636@o2.com"
    Given user has a "<account_type>" account type
      And the "<allowance_type>" allowance is unlimited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "<allowance_type>_roundel_color" allowance roundel is displayed in "dark_blue" color

    Examples:
          | account_type | allowance_type | automation              | impeded_label | jira_id    |
          | PAYM         | data           |                         |               | QANOV-5748 |
          | PAYM         | minutes        |                         |               | QANOV-5750 |
          | PAYM         | messages       |                         |               | QANOV-5752 |
          | MBB          | data           | automation.pending_mock | impeded_mock  | QANOV-5753 |
          | MBB          | messages       | automation.pending_mock | impeded_mock  | QANOV-5755 |
          | companion    | data           |                         |               | QANOV-5756 |

  @jira.<jira_id> @android @ios @jira.cv.10.6 @jira.link.relates_to.NOV-91849 @manual @mobile @netcracker @o2uk
  @regression
  Scenario Outline: A <account_type> user who has consumed 100% of his/her <allowance_type> allowance will see the roundel in a specific color
    Given user has a "<account_type>" account type
      And user has consumed "100%" of the "<allowance_type>" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "<allowance_type>_roundel_color" allowance roundel is displayed in "red" color

    Examples:
          | account_type | allowance_type | jira_id    |
          | PAYM         | data           | QANOV-5758 |
          | MBB          | data           | QANOV-5763 |
          | MBB          | messages       | QANOV-5764 |

    @automation.pending_mock @impeded_mock
    Examples:
          | account_type | allowance_type | jira_id    |
          | PAYM         | minutes        | QANOV-5759 |
          | PAYM         | messages       | QANOV-5761 |
          | Companion    | data           | QANOV-5766 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.10.5 @jira.link.relates_to.NOV-64012 @mobile @netcracker @o2uk @sanity
  @automatic @webapp 
  Scenario Outline: A <account_type> user can see the mobile line <allowance_type> consumption counters
    NOTE: Same-category bundles will be summed and represented
    in the same roundel if OB wants, otherwise we need a tag to add this as a new roundel.
    NOTE: Roundel with only a bundle will show the expiration date under the roundel.
    remaining_allowance format: You have X left of Y
    The "allowances_expiration_date" textfield is displayed if the roundel contains only a bundle
    Given user has a "<account_type>" account type
      And the "<allowance_type>" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And waits until the "<allowance_type>_roundel" element is visible
     Then the "<allowance_type>_roundel" element is on display
      And the "<allowance_type>_roundel.title" textfield with the "You have" format is displayed
      And the "<allowance_type>_roundel.amount" textfield with the "\d+(.\d\d)? (MB|GB|KB|SMS|MMS|min)" format is displayed
      And the "<allowance_type>_roundel.subtitle" textfield with the "left of \d* (MB|GB|KB|SMS|MMS|min)" format is displayed
      And the "allowances_roundel_name" textfield is displayed

    @cert0 @cert1 @qa
    Examples:
          | account_type | allowance_type | ber | jira_id    |
          | PAYM         | data           | ber | QANOV-5767 |
          | MBB          | data           |     | QANOV-5771 |
          | companion    | data           |     | QANOV-5774 |

    @qa
    Examples:
          | account_type | allowance_type | ber | jira_id    |
          | PAYM         | minutes        |     | QANOV-5768 |
          | PAYM         | messages       |     | QANOV-5770 |
          | MBB          | messages       |     | QANOV-5773 |

  @jira.QANOV-5776 @android @ios @jira.cv.11.4 @jira.link.depends_on.QANOV-5774 @jira.link.detects.ACCOUNT-12750
  @jira.link.relates_to.NOV-151919 @manual @mobile @o2uk @regression
  Scenario: A postpay user can switch among the consumption roundels
    Given user has a "postpay" account type
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When swipes the "allowance_roundel" carousel in "right" direction
     Then the "roundel_2" allowance roundel is displayed
