# -*- coding: utf-8 -*-
@jira.QANOV-374112
Feature: Icon Smart Action


  @jira.QANOV-374113 @android @automatic @ios @jira.cv.14.5 @mobile @o2uk @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.icon_smart_action_all
  Scenario: A postpay o2uk user can see an Icon Smart Action module configured with Bolt Ons, change tariff and upgrade
    To be executed in QA
    Given user has a "postpay" account type
      And the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
     When user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "icon_smart_action.icon_smart" list has "3" elements
      And the "0" index in the "icon_smart_action.icon_smart" list has the "text" field with "Buy Bolt Ons" text
      And the "0" index in the "icon_smart_action.icon_smart" list has the "link" field whose "href" attribute contains the "/_/account/redirect.php?target=o2&entry=add-boltons&public-id=" value
      And the "0" index in the "icon_smart_action.icon_smart" list has the "icon" field
      And the "1" index in the "icon_smart_action.icon_smart" list has the "text" field with "Change Tariff" text
      And the "1" index in the "icon_smart_action.icon_smart" list has the "link" field whose "href" attribute contains the "/_/account/redirect.php?target=o2&entry=change-your-tariff&public-id=" value
      And the "1" index in the "icon_smart_action.icon_smart" list has the "icon" field
      And the "2" index in the "icon_smart_action.icon_smart" list has the "text" field with "Upgrade" text
      And the "2" index in the "icon_smart_action.icon_smart" list has the "link" field whose "href" attribute contains the "/_/account/redirect.php?target=o2&entry=upgrade-eligibility&public-id=" value
      And the "2" index in the "icon_smart_action.icon_smart" list has the "icon" field

  @jira.QANOV-374114 @android @automatic @ios @jira.cv.14.5 @mobile @o2uk @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.icon_smart_action_all
  Scenario: A prepay o2uk user can see an Icon Smart Action module configured with topup, boltons, change tariff and upgrade
    To be executed in QA
    Given user has a "prepay" account type
      And the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
     When user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "icon_smart_action.icon_smart" list has "3" elements
      And the "0" index in the "icon_smart_action.icon_smart" list has the "text" field with "Top Up" text
      And the "0" index in the "icon_smart_action.icon_smart" list has the "link" field whose "href" attribute contains the "/_/account/redirect.php?target=o2&entry=payg-webtopup&public-id=" value
      And the "0" index in the "icon_smart_action.icon_smart" list has the "icon" field
      And the "1" index in the "icon_smart_action.icon_smart" list has the "text" field with "Buy Bolt Ons" text
      And the "1" index in the "icon_smart_action.icon_smart" list has the "link" field whose "href" attribute contains the "/_/account/redirect.php?target=o2&entry=add-boltons&public-id=" value
      And the "1" index in the "icon_smart_action.icon_smart" list has the "icon" field
      And the "2" index in the "icon_smart_action.icon_smart" list has the "text" field with "Change Tariff" text
      And the "2" index in the "icon_smart_action.icon_smart" list has the "link" field whose "href" attribute contains the "/_/account/redirect.php?target=o2&entry=change-your-tariff&public-id=" value
      And the "2" index in the "icon_smart_action.icon_smart" list has the "icon" field

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.5 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.icon_smart_action_<action_type>
  Scenario Outline: A <account_type> o2uk user can not see an Icon Smart Action module configured with <action_type>
    To be executed in QA
    Given user has a "<account_type>" account type
      And the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
     When user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "icon_smart_action.icon_smart" list is not displayed

    Examples:
          | account_type | action_type | jira_id      |
          | postpay      | topup       | QANOV-374115 |
          | prepay       | upgrade     | QANOV-374116 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.5 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.icon_smart_action_<action_type>
  Scenario Outline: A <account_type> o2uk user can see an Icon Smart Action module configured with <action_type>
    To be executed in QA
    Given user has a "<account_type>" account type
      And the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
     When user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "icon_smart_action.icon_smart" list has "1" elements
      And the "0" index in the "icon_smart_action.icon_smart" list has the "text" field with "<action_name>" text
      And the "0" index in the "icon_smart_action.icon_smart" list has the "link" field whose "href" attribute contains the "<url>" value
      And the "0" index in the "icon_smart_action.icon_smart" list has the "icon" field

    Examples:
          | account_type | action_type | action_name | url                                                                                        | jira_id      |
          | postpay      | upgrade     | Upgrade     | /_/account/redirect.php?target=o2&entry=upgrade-eligibility&public-id= | QANOV-374117 |
          | prepay       | topup       | Top Up      | /_/account/redirect.php?target=o2&entry=payg-webtopup&public-id=       | QANOV-374118 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.5 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.icon_smart_action_bolt_ons
  Scenario Outline: A <account_type> o2uk user can see an Icon Smart Action module configured with Boltons
    To be executed in QA
    Given user has a "<account_type>" account type
      And the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
     When user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "icon_smart_action.icon_smart" list has "1" elements
      And the "0" index in the "icon_smart_action.icon_smart" list has the "text" field with "Buy Bolt Ons" text
      And the "0" index in the "icon_smart_action.icon_smart" list has the "link" field whose "href" attribute contains the "/_/account/redirect.php?target=o2&entry=add-boltons&public-id=" value
      And the "0" index in the "icon_smart_action.icon_smart" list has the "icon" field

    Examples:
          | account_type | jira_id      |
          | postpay      | QANOV-374119 |
          | prepay       | QANOV-374120 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.5 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.icon_smart_action_<action_type>
  Scenario Outline: A <account_type> o2uk user can see an Icon Smart Action module configured with boltons
    To be executed in QA
    Given user has a "<account_type>" account type
      And the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
     When user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "icon_smart_action.icon_smart" list has "1" elements
      And the "0" index in the "icon_smart_action.icon_smart" list has the "text" field with "Buy Bolt Ons" text
      And the "0" index in the "icon_smart_action.icon_smart" list has the "link" field whose "href" attribute contains the "/_/account/redirect.php?target=o2&entry=add-boltons&public-id=" value
      And the "0" index in the "icon_smart_action.icon_smart" list has the "icon" field

    Examples:
          | account_type | action_type     | jira_id      |
          | postpay      | boltons_topup   | QANOV-374121 |
          | prepay       | upgrade_boltons | QANOV-374122 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.5 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.icon_smart_action_<action_type>
  Scenario Outline: A <account_type> o2uk user can see an Icon Smart Action module configured with 2 actions
    To be executed in QA
    Given user has a "<account_type>" account type
      And the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
     When user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "icon_smart_action.icon_smart" list has "2" elements
      And the "0" index in the "icon_smart_action.icon_smart" list has the "text" field with "<action_name_1>" text
      And the "0" index in the "icon_smart_action.icon_smart" list has the "link" field whose "href" attribute contains the "<url_1>" value
      And the "0" index in the "icon_smart_action.icon_smart" list has the "icon" field
      And the "1" index in the "icon_smart_action.icon_smart" list has the "text" field with "<action_name_2>" text
      And the "1" index in the "icon_smart_action.icon_smart" list has the "link" field whose "href" attribute contains the "<url_2>" value
      And the "1" index in the "icon_smart_action.icon_smart" list has the "icon" field

    Examples:
          | account_type | action_type     | action_name_1 | url_1                                                                                      | action_name_2 | url_2                                                                                | jira_id      |
          | postpay      | upgrade_boltons | Upgrade       | /_/account/redirect.php?target=o2&entry=upgrade-eligibility&public-id= | Buy Bolt Ons  | /_/account/redirect.php?target=o2&entry=add-boltons&public-id=   | QANOV-374123 |
          | prepay       | boltons_topup   | Buy Bolt Ons  | /_/account/redirect.php?target=o2&entry=add-boltons&public-id=         | Top Up        | /_/account/redirect.php?target=o2&entry=payg-webtopup&public-id= | QANOV-374124 |
