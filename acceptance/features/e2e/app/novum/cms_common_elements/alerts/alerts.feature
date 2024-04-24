# -*- coding: utf-8 -*-
@jira.QANOV-152914
Feature: Alerts


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.basic.not_published
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user won't see the alert when there is an alert configured in draft status in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    To be executed in QA environment
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has the "DRAFT" status
      And user is in the "Modular Page Alerts" modular page
     Then the "alert" element is not displayed

    @automatic @qa
    Examples:
          | product | status | cv   | parent_test_plan | jira_id      |
          | vivobr  | DRAFT  | 14.4 | QANOV-359861     | QANOV-152918 |
          | o2uk    | DRAFT  | 13.0 |                  | QANOV-152920 |
          | moves   | DRAFT  | 13.4 |                  | QANOV-152922 |
          | blaude  | DRAFT  | 14.6 |                  | QANOV-435846 |
          | o2de    | DRAFT  | 24.0 |                  | QANOV-435847 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @sanity @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.basic
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can see an alert in Account screen when there is an alert configured with manual provider without audience in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "manual" provider
      And user is in the "Modular Page Alerts" modular page
      And waits until the "alert" element is visible
     Then the "alert.title" textfield with "[CONTEXT:alert.current.alertConfig.title]" text is displayed
      And the "alert.description" textfield with "[CONTEXT:alert.current.alertConfig.description]" text is displayed

    @automatic @qa
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | vivobr  | 14.4 | QANOV-359861     | QANOV-180312 |
          | o2uk    | 13.0 |                  | QANOV-180313 |
          | moves   | 13.4 |                  | QANOV-180314 |
          | blaude  | 14.6 |                  | QANOV-435848 |
          | o2de    | 24.0 |                  | QANOV-435849 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @sanity @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.basic_with_<audience>_audience
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can see an alert in Account screen when there is an alert configured with manual provider and <audience> audience in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given user has a "<account_type>" account type
      And the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has the "<audience>" audience
      And user is in the "Modular Page Alerts" modular page
      And waits until the "alert" element is visible
     Then the "alert.title" textfield with "[CONTEXT:alert.current.alertConfig.title]" text is displayed
      And the "alert.description" textfield with "[CONTEXT:alert.current.alertConfig.description]" text is displayed

    @automatic @qa
    Examples:
          | product | account_type    | audience           | cv   | parent_test_plan | jira_id      |
          | vivobr  | beatrix postpay | postpay-beatrix    | 14.4 | QANOV-359861     | QANOV-152932 |
          | o2uk    | legacy postpay  | legacy-has-postpay | 13.0 |                  | QANOV-152936 |
          | moves   | telco           | ob-telco           | 13.4 |                  | QANOV-152939 |
          | blaude  | postpay         | mobile             | 14.6 |                  | QANOV-435850 |
          | o2de    | postpay         | mobile             | 24.0 |                  | QANOV-435851 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.basic_with_<audience>_audience
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user won't see an alert in Account screen when there is an alert configured with manual provider and a different user audience in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given user does not have any "<account_type>" account types
      And the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has the "<audience>" audience
      And user is in the "Modular Page Alerts" modular page
     Then the "alert" element is not displayed

    @automatic @qa
    Examples:
          | product | account_type | audience            | cv   | parent_test_plan | jira_id      |
          | vivobr  | postpay      | postpay             | 14.4 | QANOV-359861     | QANOV-152942 |
          | o2uk    | ao2          | ao2                 | 13.0 |                  | QANOV-152944 |
          | moves   | prepay       | prepay              | 13.4 |                  | QANOV-152949 |
          | blaude  | postpay      | mono-product-mobile | 14.6 |                  | QANOV-435852 |
          | o2de    | postpay      | mono-product-mobile | 24.0 |                  | QANOV-435853 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.CMS-2991 @mobile @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.basic_with_<icon_type>_icon_type
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can see an alert in Account screen when there is an alert configured with <icon_type> icon type in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    The informative changed to manual for now because the locator is alwasy changing in the BERs. To be analysed how to automate this better
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "<icon_type>" icon type defined
      And user is in the "Modular Page Alerts" modular page
      And waits until the "alert" element is visible
     Then the "alert.<icon_type>_icon" icon is displayed

    @automatic @qa
    Examples:
          | product | icon_type   | cv   | jira_id      |
          | vivobr  | promotion   | 14.4 | QANOV-152954 |
          | vivobr  | custom      | 14.4 | QANOV-356551 |
          | o2uk    | promotion   | 13.0 | QANOV-152958 |
          | o2uk    | custom      | 14.4 | QANOV-356552 |
          | moves   | promotion   | 13.4 | QANOV-152962 |
          | moves   | custom      | 14.4 | QANOV-356553 |
          | blaude  | promotion   | 14.6 | QANOV-435856 |
          | blaude  | custom      | 14.6 | QANOV-435858 |
          | o2de    | promotion   | 14.6 | QANOV-435861 |
          | o2de    | custom      | 14.6 | QANOV-435863 |

    @manual @qa
    Examples:
          | product | icon_type   | cv   | jira_id      |
          | vivobr  | informative | 14.4 | QANOV-152952 |
          | vivobr  | warning     | 14.4 | QANOV-152953 |
          | vivobr  | error       | 14.4 | QANOV-152955 |
          | o2uk    | informative | 13.0 | QANOV-152956 |
          | o2uk    | warning     | 13.0 | QANOV-152957 |
          | o2uk    | error       | 13.0 | QANOV-152959 |
          | moves   | informative | 13.4 | QANOV-152960 |
          | moves   | warning     | 13.4 | QANOV-152961 |
          | moves   | error       | 13.4 | QANOV-152963 |
          | blaude  | informative | 14.6 | QANOV-435854 |
          | blaude  | warning     | 14.6 | QANOV-435855 |
          | blaude  | error       | 14.6 | QANOV-435857 |
          | o2de    | informative | 14.6 | QANOV-435859 |
          | o2de    | warning     | 14.6 | QANOV-435860 |
          | o2de    | error       | 14.6 | QANOV-435862 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.basic
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can see an alert in Account screen when there is an alert configured without closing icon in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS does not have the closing button
      And user is in the "Modular Page Alerts" modular page
      And waits until the "alert" element is visible
     Then the "alert.close_button" element is not on display

    @automatic @qa
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | vivobr  | 14.4 | QANOV-359861     | QANOV-152964 |
          | o2uk    | 13.0 |                  | QANOV-152965 |
          | moves   | 13.4 |                  | QANOV-152966 |
          | blaude  | 14.6 |                  | QANOV-435864 |
          | o2de    | 24.0 |                  | QANOV-435865 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression @webapp
  @fixture.cms.target_2
  @fixture.cms.alert.full
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can see an alert in Account screen when there is an alert configured with closing icon in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has the closing button
      And user is in the "Modular Page Alerts" modular page
      And waits until the "alert" element is visible
     Then the "alert.close_button" button is displayed

    @automatic @qa
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | vivobr  | 14.4 | QANOV-359861     | QANOV-152967 |
          | o2uk    | 13.0 |                  | QANOV-152968 |
          | moves   | 13.4 |                  | QANOV-152969 |
          | blaude  | 14.6 |                  | QANOV-435866 |
          | o2de    | 24.0 |                  | QANOV-435867 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression @webapp
  @fixture.cms.target_2
  @fixture.cms.alert.full
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can close an alert in Account screen when there is an alert configured with closing icon in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has the closing button
      And user is in the "Modular Page Alerts" modular page
     When clicks on the "alert.close_button" button
      And waits until the "alert" element is not visible
     Then the "alert" element is not displayed

    @automatic @qa
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | vivobr  | 14.4 | QANOV-359861     | QANOV-152970 |
          | o2uk    | 13.0 |                  | QANOV-152971 |
          | moves   | 13.4 |                  | QANOV-152972 |
          | blaude  | 14.6 |                  | QANOV-435868 |
          | o2de    | 24.0 |                  | QANOV-435869 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression @webapp
  @fixture.cms.target_2
  @fixture.cms.alert.full
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user who closes an alert in Account screen can see the alert again when there is an alert in CMS configured to be seen again in 1 <unit>
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has the closing button
      And the alert configured in CMS can be displayed again after "1" "<unit>"
      And user is in the "Modular Page Alerts" modular page
      And waits until the "alert" element is visible
     When clicks on the "alert.close_button" button
      And waits "1" seconds
      And user is in the "Modular Page Alerts" modular page
     Then the "alert.title" textfield with "[CONTEXT:alert.current.alertConfig.title]" text is displayed

    @no_automatable
    Examples:
          | product | unit    | cv   | parent_test_plan | jira_id      |
          | vivobr  | minutes | 14.4 |                  | QANOV-152974 |
          | vivobr  | hours   | 14.4 |                  | QANOV-152975 |
          | vivobr  | days    | 14.4 |                  | QANOV-152976 |
          | vivobr  | months  | 14.4 |                  | QANOV-152977 |
          | o2uk    | minutes | 13.0 |                  | QANOV-152979 |
          | o2uk    | hours   | 13.0 |                  | QANOV-152980 |
          | o2uk    | days    | 13.0 |                  | QANOV-152981 |
          | o2uk    | months  | 13.0 |                  | QANOV-152982 |
          | moves   | minutes | 13.4 |                  | QANOV-152984 |
          | moves   | hours   | 13.4 |                  | QANOV-152985 |
          | moves   | days    | 13.4 |                  | QANOV-152986 |
          | moves   | months  | 13.4 |                  | QANOV-152987 |
          | blaude  | minutes | 14.6 |                  | QANOV-435870 |
          | blaude  | hours   | 14.6 |                  | QANOV-435871 |
          | blaude  | days    | 14.6 |                  | QANOV-435872 |
          | blaude  | months  | 14.6 |                  | QANOV-435873 |
          | o2de    | minutes | 24.0 |                  | QANOV-435874 |
          | o2de    | hours   | 24.0 |                  | QANOV-435875 |
          | o2de    | days    | 24.0 |                  | QANOV-435876 |
          | o2de    | months  | 24.0 |                  | QANOV-435877 |

    @automatic @ber @qa
    Examples:
          | product | unit    | cv   | parent_test_plan | jira_id      |
          | vivobr  | seconds | 14.4 | QANOV-359861     | QANOV-152973 |
          | o2uk    | seconds | 13.0 |                  | QANOV-152978 |
          | moves   | seconds | 13.4 |                  | QANOV-152983 |
          | blaude  | seconds | 14.6 |                  | QANOV-435878 |
          | o2de    | seconds | 24.0 |                  | QANOV-435879 |

  @jira.QANOV-152989 @android @automatic @ios @jira.cv.13.0 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.preconfigured_with_upgrade_provider
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario: A user can see an alert in Account screen when there is an alert with preconfigured provider and overriding fields configured in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has the "upgrade" provider id
      And the alert configured in CMS has a "title" overriding field defined
      And the alert configured in CMS has a "description" overriding field defined
      And user is eligible for a "free" upgrade offer
      And user is in the "Modular Page Alerts" modular page for the matching agreement
      And waits until the "alert" element is visible
     Then the "alert.title" textfield with "[CONTEXT:alert.current.alertConfig.title]" text is displayed
      And the "alert.description" textfield with "[CONTEXT:alert.current.alertConfig.description]" text is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression @webapp
  Scenario Outline: A user can see an alert in Account screen when there is an alert with preconfigured provider and overriding fields configured in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has the "<provider_id>" provider id
      And the alert configured in CMS has a "title" overriding field defined
      And the alert configured in CMS has a "description" overriding field defined
      And user is in the "Modular Page Alerts" modular page for the matching agreement
      And waits until the "alert" element is visible
     Then the "alert.title" textfield with "[CONTEXT:alert.current.alertConfig.title]" text is displayed
      And the "alert.description" textfield with "[CONTEXT:alert.current.alertConfig.description]" text is displayed

    Examples:
          | product | cv   | provider_id                    | parent_test_plan | jira_id      |
          | vivobr  | 14.4 | reminders-api-technician-visit | QANOV-359861     | QANOV-152988 |
          | moves   | 13.4 | existing-debt                  |                  | QANOV-152990 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @ios @mobile @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.preconfigured_with_late-invoices_provider
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A <product> user can see an alert in Account screen when there is an alert with preconfigured provider and overriding fields configured in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has the "late-invoices" provider id
      And user has a month with "overdue" bill
      And the alert configured in CMS has a "title" overriding field defined
      And the alert configured in CMS has a "description" overriding field defined
      And user is in the "Modular Page Alerts" modular page for the matching agreement
      And waits until the "alert" element is visible
     Then the "alert.title" textfield with "[CONTEXT:alert.current.alertConfig.title]" text is displayed
      And the "alert.description" textfield with "[CONTEXT:alert.current.alertConfig.description]" text is displayed

    @automatic @qa
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.6 | QANOV-435890 |
          | o2de    | 24.0 | QANOV-435891 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.preconfigured_provider_without_title_and_description
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can see an alert in Account screen when there is an alert with preconfigured provider and not overriding fields configured in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has a "preconfigured" provider
      And the alert configured in CMS does not have a "title" overriding field defined
      And the alert configured in CMS does not have a "description" overriding field defined
      And user is in the "Modular Page Alerts" modular page
      And waits until the "alert" element is visible
     Then the "alert.title" textfield is not displayed
      And the "alert.description" textfield with "[CONF:cms.alert_default_description]" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.4 | QANOV-152991 |
          | moves   | 13.4 | QANOV-152993 |

  @jira.QANOV-152992 @android @automatic @ber @ios @jira.cv.13.0 @jira.link.detects.O2UK-5292 @mobile @o2uk @qa @sanity
  @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.preconfigured_provider_without_title_and_description
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario: A user can see an alert in Account screen when there is an alert with preconfigured provider and not overriding fields configured in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has a "preconfigured" provider
      And the alert configured in CMS does not have a "title" overriding field defined
      And the alert configured in CMS does not have a "description" overriding field defined
      And user is eligible for a "free" upgrade offer
      And user is in the "Modular Page Alerts" modular page for the matching agreement
      And waits until the "alert" element is visible
     Then the "alert.title" textfield is not displayed
      And the "alert.description" textfield with "[CONF:cms.alert_default_description]" text is displayed

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @ios @mobile @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.preconfigured_provider_without_title_and_description
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A <product> user can see an alert in Account screen when there is an alert with preconfigured provider and overriding fields configured in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has a "preconfigured" provider
      And the alert configured in CMS does not have a "title" overriding field defined
      And the alert configured in CMS does not have a "description" overriding field defined
      And user has a "postpay" account type
      And user has a month with "overdue" bill
      And user is in the "Modular Page Alerts" modular page for the matching agreement
      And waits until the "alert" element is visible
     Then the "alert.title" textfield is not displayed
      And the "alert.description" textfield with "[CONF:cms.alert_default_description]" text is displayed

    @automatic @qa
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.6 | QANOV-435892 |
          | o2de    | 24.0 | QANOV-435893 |

  @jira.QANOV-152995 @android @automatic @ios @jira.cv.13.0 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.preconfigured_with_upgrade_provider
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario: A user can see an alert in Account screen when there is an alert with preconfigured provider and preconfigured actions configured in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has the "upgrade" provider id
      And user is eligible for a "free" upgrade offer
      And user is in the "Modular Page Alerts" modular page for the matching agreement
      And waits until the "alert" element is visible
     Then the "alert.single_action_link" link is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @webapp
  Scenario Outline: A user can see an alert in Account screen when there is an alert with preconfigured provider and preconfigured actions configured in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has the "<provider_id>" provider id
      And user is in the "Modular Page Alerts" modular page for the matching agreement
      And waits until the "alert" element is visible
     Then the "alert.single_action_link" link is displayed

    Examples:
          | product | cv   | provider_id                    | jira_id      |
          | vivobr  | 14.4 | reminders-api-technician-visit | QANOV-152994 |
          | moves   | 13.4 | existing-debt                  | QANOV-152996 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.0 @mobile @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.preconfigured_with_late-invoices_provider
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A <product> user can see an alert in Account screen when there is an alert with preconfigured provider and preconfigured actions configured in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has the "late-invoices" provider id
      And user has a month with "overdue" bill
      And user is in the "Modular Page Alerts" modular page for the matching agreement
      And waits until the "alert" element is visible
     Then the "alert.single_action_link" link is displayed

    @automatic @qa
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-435894 |
          | o2de    | QANOV-435895 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.basic
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can see an alert in Account screen when there is an alert with no actions configured in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has "0" actions
      And user is in the "Modular Page Alerts" modular page
      And waits until the "alert" element is visible
     Then the "alert.main_action_link" link is not displayed
      And the "alert.secondary_action_link" link is not displayed

    @automatic @qa
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | vivobr  | 14.4 | QANOV-359861     | QANOV-152997 |
          | o2uk    | 13.0 |                  | QANOV-152998 |
          | moves   | 13.4 |                  | QANOV-152999 |
          | blaude  | 14.6 |                  | QANOV-435896 |
          | o2de    | 24.0 |                  | QANOV-435897 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression @webapp
  @fixture.cms.target_2
  @fixture.cms.alert.full
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can see an alert in Account screen when there is an alert with one action configured in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has "1" action
      And user is in the "Modular Page Alerts" modular page
      And waits until the "alert" element is visible
     Then the "alert.single_action_link" link with "[CONTEXT:alert.current.alertConfig.mainAction.text]" text is displayed
      And the "alert.main_action_link" link is not displayed

    @automatic @qa
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | vivobr  | 14.4 | QANOV-359861     | QANOV-153000 |
          | o2uk    | 13.0 |                  | QANOV-153001 |
          | moves   | 13.4 |                  | QANOV-153002 |
          | blaude  | 14.6 |                  | QANOV-435898 |
          | o2de    | 24.0 |                  | QANOV-435899 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression
  @fixture.cms.target_2
  @fixture.cms.alert.full
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user clicks on the alert link when there is an alert with one action with URL configured in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has a "manual" url defined in the "main" action
      And user is in the "Modular Page Alerts" modular page
      And waits until the "alert" element is visible
     When clicks on the "alert.single_action_link" link
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Alerts" modular page is displayed

    @automatic @qa
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | vivobr  | 14.4 | QANOV-359861     | QANOV-153003 |
          | o2uk    | 13.0 |                  | QANOV-153004 |
          | moves   | 13.4 |                  | QANOV-153005 |
          | blaude  | 14.6 |                  | QANOV-435900 |
          | o2de    | 24.0 |                  | QANOV-435901 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @regression @web @webapp
  @fixture.cms.target_2
  @fixture.cms.alert.full
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user clicks on the alert link when there is an alert with one action with URL configured in CMS in webapp
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has a "manual" url defined in the "main" action
      And user is in the "Modular Page Alerts" modular page
      And waits until the "alert" element is visible
     When clicks on the "alert.single_action_link" link
     Then the current URL is "https://www.telefonica.com/es/" after "20" seconds
      And I go back to the previous page
      And the "Modular Page Alerts" modular page is displayed

    @automatic @qa
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | vivobr  | 14.4 | QANOV-359861     | QANOV-311430 |
          | o2uk    | 13.0 |                  | QANOV-311431 |
          | moves   | 13.4 |                  | QANOV-311432 |
          | blaude  | 14.6 |                  | QANOV-435902 |
          | o2de    | 24.0 |                  | QANOV-435903 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression
  @fixture.cms.target_2
  @fixture.cms.alert.basic_with_<action>_preconfigured_action
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user clicks on the alert link when there is an alert with one action with preconfigured url in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has "1" action
      And the alert configured in CMS has a "preconfigured" url defined in the "main" action
      And user is in the "Modular Page Alerts" modular page for current agreement
      And waits until the "alert" element is visible
     When clicks on the "alert.single_action_link" link
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Alerts" modular page is displayed

    @automatic @qa
    Examples:
          | product | cv   | action        | header       | button       | jira_id      |
          | o2uk    | 13.0 | invoices-list | Bills        | back_button  | QANOV-153007 |
          | moves   | 13.4 | invoices_list | Facturas     | back_button  | QANOV-153008 |
          | blaude  | 14.6 | NAME_CHANGE   | Namen ändern | close_button | QANOV-435904 |
          | o2de    | 24.0 | NAME_CHANGE   | Namen ändern | close_button | QANOV-435905 |

  @jira.QANOV-153006 @vivobr @android @ios @jira.cv.14.4 @mobile @regression @automatic @qa
  @fixture.cms.target_2 @fixture.cms.alert.basic_with_services-list_preconfigured_action @fixture.cms.page.alerts @fixture.cms.module.alert
  Scenario: A user clicks on the alert link when there is an alert with one action with preconfigured url in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has "1" action
      And the alert configured in CMS has a "preconfigured" url defined in the "main" action
      And user is in the "Modular Page Alerts" modular page for current agreement
      And waits until the "alert" element is visible
     When clicks on the "alert.single_action_link" link
     Then the internal webview with "Mais serviços" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Alerts" modular page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression @webapp
  @fixture.cms.target_2
  @fixture.cms.alert.two_links
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can see an alert in Account screen when there is an alert with two actions configured in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has "2" actions
      And user is in the "Modular Page Alerts" modular page
      And waits until the "alert" element is visible
     Then the "alert.main_action_link" link with "[CONTEXT:alert.current.alertConfig.mainAction.text]" text is displayed
      And the "alert.secondary_action_link" link with "[CONTEXT:alert.current.alertConfig.secondaryAction.text]" text is displayed

    @automatic @qa
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | vivobr  | 14.4 | QANOV-359861     | QANOV-153009 |
          | o2uk    | 13.0 |                  | QANOV-153010 |
          | moves   | 13.4 |                  | QANOV-153011 |
          | blaude  | 14.6 |                  | QANOV-435906 |
          | o2de    | 24.0 |                  | QANOV-435907 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression
  @fixture.cms.target_2
  @fixture.cms.alert.two_links
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user clicks on the alert links when there is an alert with two actions with URL configured in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has "2" actions
      And user is in the "Modular Page Alerts" modular page
      And waits until the "alert" element is visible
     When clicks on the "alert.<link>_action_link" link
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Alerts" modular page is displayed

    @automatic @qa
    Examples:
          | product | link      | cv   | parent_test_plan | jira_id      |
          | vivobr  | main      | 14.4 | QANOV-359861     | QANOV-153012 |
          | vivobr  | secondary | 14.4 | QANOV-359861     | QANOV-153013 |
          | o2uk    | main      | 13.0 |                  | QANOV-153014 |
          | o2uk    | secondary | 13.0 |                  | QANOV-153015 |
          | moves   | main      | 13.4 |                  | QANOV-153016 |
          | moves   | secondary | 13.4 |                  | QANOV-153017 |
          | blaude  | main      | 14.6 |                  | QANOV-435908 |
          | blaude  | secondary | 14.6 |                  | QANOV-435909 |
          | o2de    | main      | 24.0 |                  | QANOV-435910 |
          | o2de    | secondary | 24.0 |                  | QANOV-435911 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @regression @web @webapp
  @fixture.cms.target_2
  @fixture.cms.alert.two_links
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user clicks on the alert links when there is an alert with two actions with URL configured in CMS in webapp
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has "2" actions
      And user is in the "Modular Page Alerts" modular page
      And waits until the "alert" element is visible
     When clicks on the "alert.<link>_action_link" link
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Alerts" modular page is displayed

    @automatic @qa
    Examples:
          | product | link      | cv   | jira_id      |
          | vivobr  | main      | 14.4 | QANOV-311433 |
          | vivobr  | secondary | 14.4 | QANOV-311434 |
          | o2uk    | main      | 13.0 | QANOV-311435 |
          | o2uk    | secondary | 13.0 | QANOV-311436 |
          | moves   | main      | 13.4 | QANOV-311437 |
          | moves   | secondary | 13.4 | QANOV-311438 |
          | blaude  | main      | 14.6 | QANOV-435912 |
          | blaude  | secondary | 14.6 | QANOV-435913 |
          | o2de    | main      | 24.0 | QANOV-435914 |
          | o2de    | secondary | 24.0 | QANOV-435915 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression
  @fixture.cms.target_2
  @fixture.cms.alert.basic_with_two_actions_preconfigured_url
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user clicks on the alert links when there is an alert with two actions with preconfigured url in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    TODO: review the automation of this scenario in all brands, regarding in ios whether the webview is cached and cannot be
    resolved. Besides, see if it is possible to validate the internal webview header instead of the page destination for
    maintainability
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has "2" action
      And the alert configured in CMS has a "preconfigured" url defined in the "main" action
      And the alert configured in CMS has a "preconfigured" url defined in the "secondary" action
      And user is in the "Modular Page Alerts" modular page for current agreement
      And waits until the "alert" element is visible
     When clicks on the "alert.<link>_action_link" link
     Then the "<page>" page is displayed

    @manual @qa
    Examples:
          | product | link      | page           | cv   | jira_id      |
          | vivobr  | main      | Bills          | 14.4 | QANOV-153018 |
          | vivobr  | secondary | Account        | 14.4 | QANOV-153019 |
          | o2uk    | main      | Bills          | 13.0 | QANOV-153020 |
          | o2uk    | secondary | Tariff Details | 13.0 | QANOV-153021 |
          | moves   | main      | Invoices       | 13.4 | QANOV-153022 |
          | moves   | secondary | Explore        | 13.4 | QANOV-153023 |
          | blaude  | main      | Change Name    | 14.6 | QANOV-435916 |
          | blaude  | secondary | Account        | 14.6 | QANOV-435917 |
          | o2de    | main      | Change Name    | 24.0 | QANOV-435918 |
          | o2de    | secondary | Account        | 24.0 | QANOV-435919 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.basic
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can see an alert in Account screen when there is an alert without duration configured in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS does not have duration defined
      And user is in the "Modular Page Alerts" modular page
     Then the "alert" element is displayed

    @automatic @qa
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | vivobr  | 14.4 | QANOV-359861     | QANOV-153024 |
          | o2uk    | 13.0 |                  | QANOV-153025 |
          | moves   | 13.4 |                  | QANOV-153026 |
          | blaude  | 14.6 |                  | QANOV-435920 |
          | o2de    | 24.0 |                  | QANOV-435921 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression @webapp
  @fixture.cms.target_2
  @fixture.cms.alert.full
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can see an alert in Account screen when there is an alert with duration configured in CMS and the duration hasn't finished yet
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has a duration defined
      And the alerts duration has not been completed
      And user is in the "Modular Page Alerts" modular page
     Then the "alert" element is displayed

    @automatic @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.4 | QANOV-153027 |
          | o2uk    | 13.0 | QANOV-153028 |
          | moves   | 13.4 | QANOV-153029 |
          | blaude  | 14.6 | QANOV-435922 |
          | o2de    | 24.0 | QANOV-435923 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.completed
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user won't see an alert in Account screen when there is an alert with duration configured in CMS and the alert duration has already been finished
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alerts duration has been completed
      And user is in the "Modular Page Alerts" modular page
     Then the "alert" element is not displayed

    @automatic @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.4 | QANOV-153030 |
          | o2uk    | 13.0 | QANOV-153031 |
          | moves   | 13.4 | QANOV-153032 |
          | blaude  | 14.6 | QANOV-435924 |
          | o2de    | 24.0 | QANOV-435925 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression
  @fixture.cms.target_1
  @fixture.cms.alert.closing_ttl_one_minute
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user who closed an alert in Account screen can see the alert again when the alert is setup to be shown again in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And user is in the "Modular Page Alerts" modular page
     When clicks on the "alert.close_button" button
      And waits until the "alert" element is not visible
      And clicks on the "navigation_top_bar.back_button" button
      And the alert is reopened in CMS
      And user is in the "Modular Page Alerts" modular page
     Then waits until the "alert" element is visible

    @automatic @qa
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | vivobr  | 14.4 | QANOV-359861     | QANOV-153033 |
          | o2uk    | 13.0 |                  | QANOV-153034 |
          | moves   | 13.4 |                  | QANOV-153035 |
          | blaude  | 14.6 |                  | QANOV-435926 |
          | o2de    | 24.0 |                  | QANOV-435927 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.basic.not_published
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can see an alert in Account screen when the alert is published in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    To be executed in QA environment
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has the "DRAFT" status
     When the alert is published in CMS
      And user is in the "Modular Page Alerts" modular page
     Then waits until the "alert" element is visible

    @automatic @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.4 | QANOV-153036 |
          | o2uk    | 13.0 | QANOV-153037 |
          | moves   | 13.4 | QANOV-153038 |
          | blaude  | 14.6 | QANOV-435928 |
          | o2de    | 24.0 | QANOV-435929 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.basic
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user won't see an alert in Account screen when the alert is unpublished in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    To be executed in QA environment
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has the "PUBLISHED" status
     When the alert is unpublished in CMS
      And user is in the "Modular Page Alerts" modular page
     Then the "alert" element is not displayed

    @automatic @qa
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | vivobr  | 14.4 | QANOV-359861     | QANOV-153039 |
          | o2uk    | 13.0 |                  | QANOV-153040 |
          | moves   | 13.4 |                  | QANOV-153041 |
          | blaude  | 14.6 |                  | QANOV-435930 |
          | o2de    | 24.0 |                  | QANOV-435931 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.basic
  @fixture.cms.alert_test.basic
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can see an alert in Account screen when there is a test configured in CMS for the logged in user
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS has a test for the logged user
      And user is in the "Modular Page Alerts" modular page
     Then waits until the "alert" element is visible
      And the "alert.title" textfield with "[CONF:cms.alert_test_title]" text is displayed

    @automatic @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.4 | QANOV-153045 |
          | o2uk    | 13.0 | QANOV-153046 |
          | moves   | 13.4 | QANOV-153047 |
          | blaude  | 14.6 | QANOV-435932 |
          | o2de    | 24.0 | QANOV-435933 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression @webapp
  @fixture.cms.target_1
  @fixture.cms.alert.basic
  @fixture.cms.alert_test.basic_other_user
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user won't see an alert in screen when there is a test configured in CMS for a different user
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And the alert configured in CMS does not have a test for the logged user
      And user is in the "Modular Page Alerts" modular page
     Then waits until the "alert" element is visible
      And the "alert.title" textfield with "[CONF:cms.alert_basic_title]" text is displayed

    @automatic @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.4 | QANOV-153048 |
          | o2uk    | 13.0 | QANOV-153049 |
          | moves   | 13.4 | QANOV-153050 |
          | blaude  | 14.6 | QANOV-435934 |
          | o2de    | 24.0 | QANOV-435935 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression
  @fixture.cms.target_1
  @fixture.cms.alert.basic_order_1
  @fixture.cms.alert.basic_order_2
  @fixture.cms.alert.basic_order_3
  @fixture.cms.alert.basic_order_4
  @fixture.cms.alert.basic_order_5
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can see the new order for the alerts in Account screen when the alerts are reordered in CMS
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And there are "5" alerts configured in CMS for automation tests
      And user reorders the alerts in reverse order
      And user is in the "Modular Page Alerts" modular page
     Then waits until the "alert" element is visible
      And the "alert.title" textfield that contains the "order 5" text is displayed
      And clicks on the "alert.close_button" button
      And waits until the "order 4" text in "alert.title" element is displayed
      And clicks on the "alert.close_button" button
      And waits until the "order 3" text in "alert.title" element is displayed
      And clicks on the "alert.close_button" button
      And waits until the "order 2" text in "alert.title" element is displayed
      And clicks on the "alert.close_button" button
      And waits until the "order 1" text in "alert.title" element is displayed

    @automatic @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.4 | QANOV-153054 |
          | o2uk    | 13.0 | QANOV-153055 |
          | moves   | 13.4 | QANOV-153056 |
          | blaude  | 14.6 | QANOV-435936 |
          | o2de    | 24.0 | QANOV-435937 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression
  @fixture.cms.target_1
  @fixture.cms.alert.closing_ttl_one_minute
  @fixture.cms.alert.basic
  @fixture.cms.page.alerts
  @fixture.cms.module.alert
  Scenario Outline: A user can see an alert in screen when there are several alerts configured in CMS and one of them is closed
    We are assuming that the alert is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Alerts" module is configured in CMS for "Modular Page Alerts" page
      And there are "2" alerts configured in the modular page in CMS
      And user is in the "Modular Page Alerts" modular page
      And the "alert.title" textfield with "[CONTEXT:alert1.current.alertConfig.title]" text is displayed
     When clicks on the "alert.close_button" button
      And waits "2" seconds
     Then waits until the "alert" element is visible
      And the "alert.title" textfield with "[CONTEXT:alert2.current.alertConfig.title]" text is displayed

    @automatic @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.4 | QANOV-153051 |
          | o2uk    | 13.0 | QANOV-153052 |
          | moves   | 13.4 | QANOV-153053 |
          | blaude  | 14.6 | QANOV-435938 |
          | o2de    | 24.0 | QANOV-435939 |
