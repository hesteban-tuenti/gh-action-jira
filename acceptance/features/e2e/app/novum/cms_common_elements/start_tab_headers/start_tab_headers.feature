# -*- coding: utf-8 -*-
@jira.QANOV-249214
Feature: Start Tab Headers - notifications


  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @mobile @qa @regression @webapp
  @fixture.cms.start_tab_header.fallback
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A user sees fallback start tab headers configured in CMS when no normal start tab header is visible for him
    The user sees fallback (default) headers when no normal header is visible for him
    Given the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And there are "any" fallback start tab headers configured in CMS
      And user sees no start tab header of "normal" type
      And user can see any "fallback" start tab header
     When user is in the "Modular Page Start Tab" modular page
     Then the "start_tab_headers_module" module is displayed
      And the "start_tab_headers_module.list" list is displayed
      And waits until the "start_tab_headers_module.list" list is stable
      And each element in "start_tab_headers_module.list" list is a start tab header of "fallback" type

    @automatic
    Examples:
          | product | module           | jira_id      |
          | blaude  | header-cards     | QANOV-493308 |
          | o2uk    | header-cards-cms | QANOV-493309 |
          | vivobr  | header-cards-cms | QANOV-249215 |
          | moves   | header-cards-cms | QANOV-249216 |
          | o2de    | header-cards     | QANOV-493310 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @mobile @qa @regression @webapp
  @fixture.cms.start_tab_header.basic
  @fixture.cms.start_tab_header.fallback
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A user sees normal start tab headers configured in CMS when can see normal and fallback (default) start tab headers
    Given the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And there are "any" start tab headers configured in CMS
      And there are "any" fallback start tab headers configured in CMS
      And user can see any "normal" start tab header
      And user can see any "fallback" start tab header
     When user is in the "Modular Page Start Tab" modular page
     Then the "start_tab_headers_module" module is displayed
      And the "start_tab_headers_module.list" list is displayed
      And waits until the "start_tab_headers_module.list" list is stable
      And any element in "start_tab_headers_module.list" list is a start tab header of "normal" type
      And no element in "start_tab_headers_module.list" list is a start tab header of "fallback" type

    @automatic
    Examples:
          | product | module           | jira_id      |
          | blaude  | header-cards     | QANOV-493311 |
          | o2uk    | header-cards-cms | QANOV-493312 |
          | vivobr  | header-cards-cms | QANOV-249217 |
          | moves   | header-cards-cms | QANOV-249218 |
          | o2de    | header-cards     | QANOV-493313 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @manual @mobile @regression
  Scenario Outline: A user won't see a <start_tab_header_type> start tab header when the start tab header is configured in <status> status in CMS
    To be executed in QA environment
    Given user has any "<start_tab_header_type>" start tab header configured in CMS for "Module Page Start Tab" page
      And user has "1" start tab headers configured in CMS for "Modular Page Start Tab" page
      And the "Start Tab Header" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has the "<status>" status
      And the start tab header configured in CMS does not have any audience defined
      And user is in the "Modular Page Start Tab" modular page
     Then no element in the "start_tab_headers" list has the value "[CONTEXT:start_tab_header.current.alertConfig.description]" in the "description" field

    Examples:
          | product | status      | start_tab_header_type | jira_id      |
          | blaude  | DRAFT       | normal                | QANOV-493314 |
          | blaude  | UNPUBLISHED | normal                | QANOV-493315 |
          | blaude  | DRAFT       | default               | QANOV-493316 |
          | blaude  | UNPUBLISHED | default               | QANOV-493317 |
          | o2de    | DRAFT       | normal                | QANOV-493318 |
          | o2de    | UNPUBLISHED | normal                | QANOV-493319 |
          | o2de    | DRAFT       | default               | QANOV-493320 |
          | o2de    | UNPUBLISHED | default               | QANOV-493321 |
          | o2uk    | DRAFT       | normal                | QANOV-493322 |
          | o2uk    | UNPUBLISHED | normal                | QANOV-493323 |
          | o2uk    | DRAFT       | default               | QANOV-493324 |
          | o2uk    | UNPUBLISHED | default               | QANOV-493325 |
          | vivobr  | DRAFT       | normal                | QANOV-249219 |
          | vivobr  | UNPUBLISHED | normal                | QANOV-249220 |
          | vivobr  | DRAFT       | default               | QANOV-249221 |
          | vivobr  | UNPUBLISHED | default               | QANOV-249222 |
          | moves   | DRAFT       | normal                | QANOV-249223 |
          | moves   | UNPUBLISHED | normal                | QANOV-249224 |
          | moves   | DRAFT       | default               | QANOV-249225 |
          | moves   | UNPUBLISHED | default               | QANOV-249226 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.13.5 @jira.link.detects.ACCOUNT-19028 @mobile @qa @sanity @webapp
  @fixture.cms.start_tab_header.basic
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A user can see a normal start tab header configured with default values
    To be executed in QA
    Given there are "any" start tab headers configured in CMS
      And the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has no audience
      And the start tab header configured in CMS has "0" actions
      And user is in the "Modular Page Start Tab" modular page
      And waits until any element in the "start_tab_headers_module.list" list has the "[CONTEXT:start_tab_header.current.alertConfig.description]" text
     Then the "start_tab_headers_module" module is displayed
      And the "start_tab_headers_module.list" list is displayed
      And waits until the "start_tab_headers_module.list" list is stable
      And any element in the "start_tab_headers_module.list" list has the "description" textfield with the "[CONTEXT:start_tab_header.current.alertConfig.description]" text

    @automatic
    Examples:
          | product | module           | jira_id      |
          | blaude  | header-cards     | QANOV-493326 |
          | o2uk    | header-cards-cms | QANOV-493327 |
          | vivobr  | header-cards-cms | QANOV-249227 |
          | moves   | header-cards-cms | QANOV-249228 |
          | o2de    | header-cards     | QANOV-493328 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @jira.link.detects.ACCOUNT-19028 @jira.link.detects.CMS-2379
  @mobile @qa @smoke @webapp
  @fixture.cms.start_tab_header.with_<audience>_audience
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A "<account_type>" user can see a start tab header matching "<audience>" user audience
    To be executed in QA
    Given there are "any" start tab headers configured in CMS
      And the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And user has a "<account_type>" account type
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has the "<audience>" audience
      And user is in the "Modular Page Start Tab" modular page
      And waits until any element in the "start_tab_headers_module.list" list has the "[CONTEXT:start_tab_header.current.alertConfig.description]" text
     Then the "start_tab_headers_module" module is displayed
      And the "start_tab_headers_module.list" list is displayed
      And waits until the "start_tab_headers_module.list" list is stable
      And any element in the "start_tab_headers_module.list" list has the "description" textfield with the "[CONTEXT:start_tab_header.current.alertConfig.description]" text

    @automatic
    Examples:
          | product | account_type   | audience           | module           | jira_id      |
          | blaude  | postpay        | postpay            | header-cards     | QANOV-493329 |
          | o2uk    | legacy postpay | legacy-has-postpay | header-cards-cms | QANOV-493330 |
          | vivobr  | convergente    | ob-4p              | header-cards-cms | QANOV-249233 |
          | moves   | telco postpay  | telco-has-postpay  | header-cards-cms | QANOV-249234 |
          | o2de    | postpay        | postpay            | header-cards     | QANOV-493331 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @jira.link.detects.ACCOUNT-19028 @mobile @qa @regression @webapp
  @fixture.cms.start_tab_header.with_<audience>_audience
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A "<account_type>" user cannot see a start tab header not matching "<audience>" user audiences
    To be executed in QA
    Given there are "any" start tab headers configured in CMS
      And user has a "<account_type>" account type
      And user does not have any "<no_account_type>" account types
      And the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And user can see any "normal" start tab header
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has the "<audience>" audience
     When user is in the "Modular Page Start Tab" modular page
      And waits until the "start_tab_headers_module" element is visible
      And waits until the "start_tab_headers_module.list" list is stable
     Then no element in the "start_tab_headers_module.list" list has the value "[CONTEXT:start_tab_header.current.alertConfig.description]" in the "description" field

    @automatic
    Examples:
          | product | account_type   | no_account_type | audience  | module           | jira_id      |
          | blaude  | postpay        | prepay          | prepay    | header-cards     | QANOV-493332 |
          | o2uk    | legacy postpay | ao2             | ao2       | header-cards-cms | QANOV-493333 |
          | vivobr  | convergente    | legacy          | ob-legacy | header-cards-cms | QANOV-249236 |
          | moves   | telco postpay  | prepay          | prepay    | header-cards-cms | QANOV-249239 |
          | o2de    | postpay        | prepay          | prepay    | header-cards     | QANOV-493282 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @jira.link.detects.ACCOUNT-19028 @mobile @qa @regression @webapp
  @fixture.cms.start_tab_header.with_url_action
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A user can see a normal start tab header with an action
    To be executed in QA
    Given there are "any" start tab headers configured in CMS
      And the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has no audience
      And the start tab header configured in CMS has "1" action
      And user is in the "Modular Page Start Tab" modular page
      And waits until any element in the "start_tab_headers_module.list" list has the "[CONTEXT:start_tab_header.current.alertConfig.description]" text
     Then the "start_tab_headers_module" module is displayed
      And the "start_tab_headers_module.list" list is displayed
      And waits until the "start_tab_headers_module.list" list is stable
      And any element in the "start_tab_headers_module.list" list has the "description" textfield with the "[CONTEXT:start_tab_header.current.alertConfig.description]" text
      And any element in the "start_tab_headers_module.list" list has the "action_button" textfield with the "[CONTEXT:start_tab_header.current.alertConfig.mainAction.text]" text

    @automatic
    Examples:
          | product | module           | jira_id      |
          | blaude  | header-cards     | QANOV-493335 |
          | o2uk    | header-cards-cms | QANOV-520189 |
          | vivobr  | header-cards-cms | QANOV-249241 |
          | moves   | header-cards-cms | QANOV-249242 |
          | o2de    | header-cards     | QANOV-493337 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @mobile @qa @regression @webapp
  @fixture.cms.start_tab_header.fallback_with_url_action
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A user can see a fallback start tab header with an action
    The user sees fallback (default) headers when no normal header is visible for him
    Given the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And there are "any" fallback start tab headers configured in CMS
      And user sees no start tab header of "normal" type
      And user can see any "fallback" start tab header
      And the fallback start tab header configured in CMS has the "PUBLISHED" status
      And the fallback start tab header configured in CMS has "1" action
     When user is in the "Modular Page Start Tab" modular page
     Then the "start_tab_headers_module" module is displayed
      And the "start_tab_headers_module.list" list is displayed
      And waits until the "start_tab_headers_module.list" list is stable
      And each element in "start_tab_headers_module.list" list is a start tab header of "fallback" type
      And any element in the "start_tab_headers_module.list" list has the "description" textfield with the "[CONTEXT:start_tab_header_fallback.current.alertConfig.description]" text
      And any element in the "start_tab_headers_module.list" list has the "action_button" textfield with the "[CONTEXT:start_tab_header_fallback.current.alertConfig.mainAction.text]" text

    @automatic
    Examples:
          | product | module           | jira_id      |
          | blaude  | header-cards     | QANOV-493338 |
          | o2uk    | header-cards-cms | QANOV-493339 |
          | vivobr  | header-cards-cms | QANOV-249243 |
          | moves   | header-cards-cms | QANOV-249244 |
          | o2de    | header-cards     | QANOV-493340 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @mobile @qa @smoke
  @fixture.cms.start_tab_header.with_internal_url_action
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A user can reach an internal webview as action destination of a normal start tab header
    To be executed in QA
    Given the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And there are "any" start tab headers configured in CMS
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has no audience
      And the start tab header configured in CMS has "1" actions
      And the start tab header configured in CMS has a "manual" url defined for the "main" action
      And user can see any "normal" start tab header
      And user is in the "Modular Page Start Tab" modular page
      And waits until any element in the "start_tab_headers_module.list" list has the "[CONTEXT:start_tab_header.current.alertConfig.description]" text
     When clicks on the "action_button" button of the element with "[CONTEXT:start_tab_header.current.alertConfig.description]" text on the "description" field of the "start_tab_headers_module.list" list
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Start Tab" modular page is displayed

    @automatic
    Examples:
          | product | module           | button | jira_id      |
          | blaude  | header-cards     | close_button | QANOV-493341 |
          | o2uk    | header-cards-cms | back_button  | QANOV-493342 |
          | vivobr  | header-cards-cms | back_button  | QANOV-249250 |
          | moves   | header-cards-cms | back_button  | QANOV-249252 |
          | o2de    | header-cards     | close_button | QANOV-493343 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @mobile @qa @smoke
  @fixture.cms.start_tab_header.with_url_action
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A user can reach an external webview as action destination of a normal start tab header
    To be executed in QA
    Given the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And there are "any" start tab headers configured in CMS
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has no audience
      And the start tab header configured in CMS has "1" actions
      And the start tab header configured in CMS has a "manual" url defined for the "main" action
      And user can see any "normal" start tab header
      And user is in the "Modular Page Start Tab" modular page
      And waits until any element in the "start_tab_headers_module.list" list has the "[CONTEXT:start_tab_header.current.alertConfig.description]" text
     When clicks on the "action_button" button of the element with "[CONTEXT:start_tab_header.current.alertConfig.description]" text on the "description" field of the "start_tab_headers_module.list" list
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Start Tab" modular page is displayed

    @automatic
    Examples:
          | product | module           | jira_id      |
          | blaude  | header-cards     | QANOV-493344 |
          | o2uk    | header-cards-cms | QANOV-493345 |
          | vivobr  | header-cards-cms | QANOV-249249 |
          | moves   | header-cards-cms | QANOV-249251 |
          | o2de    | header-cards     | QANOV-493346 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @jira.link.detects.ACCOUNT-19028 @mobile @qa @smoke
  @fixture.cms.start_tab_header.with_url_action
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A user can reach the custom URL action destination of a default start tab header
    To be executed in QA
    Given there are "any" start tab headers configured in CMS
      And the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has no audience
      And the start tab header configured in CMS has "1" action
      And the start tab header configured in CMS has a "manual" url defined for the "main" action
      And user is in the "Modular Page Start Tab" modular page
      And waits until the "start_tab_headers_module.list" list is stable
      And waits until any element in the "start_tab_headers_module.list" list has the "[CONTEXT:start_tab_header.current.alertConfig.description]" text
     When clicks on the "action_button" button of the element with "[CONTEXT:start_tab_header.current.alertConfig.description]" text on the "description" field of the "start_tab_headers_module.list" list
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Start Tab" modular page is displayed

    @automatic
    Examples:
          | product | module           | jira_id      |
          | blaude  | header-cards     | QANOV-493347 |
          | o2uk    | header-cards-cms | QANOV-493348 |
          | vivobr  | header-cards-cms | QANOV-249253 |
          | moves   | header-cards-cms | QANOV-249255 |
          | o2de    | header-cards     | QANOV-493349 |

  @jira.<jira_id> @<product> @jira.cv.13.5 @jira.link.detects.ACCOUNT-19028 @qa @smoke @web @webapp
  @fixture.cms.start_tab_header.fallback_with_url_action
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A user can reach the custom URL action destination of a fallback start tab header in webapp
    To be executed in QA
    Given there are "any" start tab headers configured in CMS
      And the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And there are "any" fallback start tab headers configured in CMS
      And user sees no start tab header of "normal" type
      And user can see any "fallback" start tab header
      And the fallback start tab header configured in CMS has a "manual" provider
      And the fallback start tab header configured in CMS has the "PUBLISHED" status
      And the fallback start tab header configured in CMS has no audience
      And the fallback start tab header configured in CMS has "1" action
      And the fallback start tab header configured in CMS has a "manual" url defined for the "main" action
      And user is in the "Modular Page Start Tab" modular page
      And waits until the "start_tab_headers_module.list" list is stable
      And waits until any element in the "start_tab_headers_module.list" list has the "[CONTEXT:start_tab_header_fallback.current.alertConfig.description]" text
     When clicks on the "action_button" button of the element with "[CONTEXT:start_tab_header_fallback.current.alertConfig.description]" text on the "description" field of the "start_tab_headers_module.list" list
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Start Tab" modular page is displayed

    @automatic
    Examples:
          | product | module           | jira_id      |
          | blaude  | header-cards     | QANOV-493350 |
          | o2uk    | header-cards-cms | QANOV-493351 |
          | vivobr  | header-cards-cms | QANOV-389773 |
          | moves   | header-cards-cms | QANOV-389774 |
          | o2de    | header-cards     | QANOV-493352 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @jira.link.detects.ACCOUNT-19028 @mobile @qa @smoke @automatic
  @fixture.cms.start_tab_header.with_preconfigured_action
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A user can reach the preconfigured URL action destination of a normal start tab header to <preconfiguration>
    To be executed in QA
    Given there are "any" start tab headers configured in CMS
      And the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And there are "any" start tab headers configured in CMS
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has no audience
      And the start tab header configured in CMS has "1" action
      And the start tab header configured in CMS has a "preconfigured" url defined for the "main" action
      And user is in the "Modular Page Start Tab" modular page for current agreement
      And waits until any element in the "start_tab_headers_module.list" list has the "[CONTEXT:start_tab_header.current.alertConfig.description]" text
     When clicks on the "action_button" button of the element with "[CONTEXT:start_tab_header.current.alertConfig.description]" text on the "description" field of the "start_tab_headers_module.list" list
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Start Tab" modular page is displayed

    Examples:
          | product | preconfiguration         | header         | button           | module           | jira_id      |
          | blaude  | CALL_ME_BACK             | Rückrufservice | close_button     | header-cards     | QANOV-493353 |
          | o2uk    | invoices_legal_text_info | Bills          | back_button      | header-cards-cms | QANOV-493354 |
          | vivobr  | services-list            | Mais serviços  | back_button      | header-cards-cms | QANOV-249257 |
          | moves   | invoices_list            | Facturas       | back_button      | header-cards-cms | QANOV-249258 |
          | o2de    | CALL_ME_BACK             | Rückrufservice | close_button     | header-cards     | QANOV-493355 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @mobile @qa @smoke
  @fixture.cms.start_tab_header.fallback_with_preconfigured_action
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A user can reach the preconfigured URL action destination of a fallback start tab header to <preconfiguration>
    To be executed in QA
    Given the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And there are "any" fallback start tab headers configured in CMS
      And user sees no start tab header of "normal" type
      And user can see any "fallback" start tab header
      And the fallback start tab header configured in CMS has a "manual" provider
      And the fallback start tab header configured in CMS has the "PUBLISHED" status
      And the fallback start tab header configured in CMS has no audience
      And the fallback start tab header configured in CMS has "1" action
      And the fallback start tab header configured in CMS has a "preconfigured" url defined for the "main" action
      And user is in the "Modular Page Start Tab" modular page
      And waits until any element in the "start_tab_headers_module.list" list has the "[CONTEXT:start_tab_header_fallback.current.alertConfig.description]" text
     When clicks on the "action_button" button of the element with "[CONTEXT:start_tab_header_fallback.current.alertConfig.description]" text on the "description" field of the "start_tab_headers_module.list" list
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Start Tab" modular page is displayed

    @automatic
    Examples:
          | product | preconfiguration         | header         | module           | button       | jira_id      |
          | blaude  | CALL_ME_BACK             | Rückrufservice | header-cards     | close_button | QANOV-493356 |
          | o2uk    | invoices_legal_text_info | Bills          | header-cards-cms | back_button  | QANOV-493357 |
          | vivobr  | services-list            | Mais serviços  | header-cards-cms | back_button  | QANOV-249259 |
          | moves   | invoices_list            | Facturas       | header-cards-cms | back_button  | QANOV-249260 |
          | o2de    | CALL_ME_BACK             | Rückrufservice | header-cards     | close_button | QANOV-493358 |

  @jira.<jira_id> @<product> @jira.cv.13.5 @jira.link.detects.ACCOUNT-19028 @qa @smoke @web @webapp
  @fixture.cms.start_tab_header.with_preconfigured_action
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A user can reach the preconfigured URL action destination of a normal start tab header in webapp
    To be executed in QA
    Given there are "any" start tab headers configured in CMS
      And the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And there are "any" start tab headers configured in CMS
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has no audience
      And the start tab header configured in CMS has "1" action
      And the start tab header configured in CMS has a "preconfigured" url defined for the "main" action
      And user is in the "Modular Page Start Tab" modular page
      And waits until the "start_tab_headers_module.list" list is displayed
      And waits until the "start_tab_headers_module.list" list is stable
      And waits until any element in the "start_tab_headers_module.list" list has the "[CONTEXT:start_tab_header.current.alertConfig.description]" text
     When clicks on the "action_button" button of the element with "[CONTEXT:start_tab_header.current.alertConfig.description]" text on the "description" field of the "start_tab_headers_module.list" list
     Then the current URL contains "[CONF:web_url_base]/<url_path>"
      And I go back to the previous page

    @automatic
    Examples:
          | product | url_path                                    | module           | jira_id      |
          | blaude  | pages/callback-appointments                 | header-cards     | QANOV-493359 |
          | o2uk    | pages/invoices-legal-text                   | header-cards-cms | QANOV-493360 |
          | vivobr  | pages/services-list/?web_view_mode=settings | header-cards-cms | QANOV-389776 |
          | moves   | consumptions/modular-screen/invoices/       | header-cards-cms | QANOV-389777 |
          | o2de    | pages/callback-appointments                 | header-cards     | QANOV-493361 |

  @jira.<jira_id> @<product> @jira.cv.13.5 @jira.link.detects.ACCOUNT-19028 @qa @smoke @web @webapp
  @fixture.cms.start_tab_header.fallback_with_preconfigured_action
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A user can reach the preconfigured URL action destination of a fallback start tab header in webapp
    To be executed in QA
    Given the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And there are "any" fallback start tab headers configured in CMS
      And user sees no start tab header of "normal" type
      And user can see any "fallback" start tab header
      And the fallback start tab header configured in CMS has a "manual" provider
      And the fallback start tab header configured in CMS has the "PUBLISHED" status
      And the fallback start tab header configured in CMS has no audience
      And the fallback start tab header configured in CMS has "1" action
      And the fallback start tab header configured in CMS has a "preconfigured" url defined for the "main" action
      And user is in the "Modular Page Start Tab" modular page
      And waits until the "start_tab_headers_module.list" list is displayed
      And waits until the "start_tab_headers_module.list" list is stable
      And waits until any element in the "start_tab_headers_module.list" list has the "[CONTEXT:start_tab_header_fallback.current.alertConfig.description]" text
     When clicks on the "action_button" button of the element with "[CONTEXT:start_tab_header_fallback.current.alertConfig.description]" text on the "description" field of the "start_tab_headers_module.list" list
     Then the current URL contains "[CONF:web_url_base]/<url_path>"
      And I go back to the previous page

    @automatic
    Examples:
          | product | url_path                                    | module           | jira_id      |
          | blaude  | pages/callback-appointments                 | header-cards     | QANOV-493363 |
          | o2uk    | bolt-on-details/                            | header-cards-cms | QANOV-493365 |
          | vivobr  | pages/services-list/?web_view_mode=settings | header-cards-cms | QANOV-414870 |
          | moves   | consumptions/modular-screen/invoices/       | header-cards-cms | QANOV-414871 |
          | o2de    | pages/callback-appointments                 | header-cards     | QANOV-493369 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @mobile @qa @regression
  @fixture.cms.start_tab_header.with_dismissible_url_action @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A user who clicks in start tab header action can see the start tab header again when it is configured in CMS to be seen again in <amount> <unit>
    To be executed in QA
    Given there are "any" start tab headers configured in CMS
      And the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has "1" action
      And the start tab header configured in CMS has a "manual" url defined for the "main" action
      And the start tab header configured in CMS can be displayed again after "1" "<unit>"
      And user is in the "Modular Page Start Tab" modular page
      And waits until the "start_tab_headers_module.list" list is stable
      And waits until any element in the "start_tab_headers_module.list" list has the "[CONTEXT:start_tab_header.current.alertConfig.description]" text
     When clicks on the "action_button" button of the element with "[CONTEXT:start_tab_header.current.alertConfig.description]" text on the "description" field of the "start_tab_headers_module.list" list
      And the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Start Tab" modular page is displayed
      And user is in the "Modular Page Start Tab" modular page
      And waits until the "start_tab_headers_module.list" list is stable
     Then the "start_tab_headers_module.list" list is displayed

    @manual
    Examples:
          | product | unit    | amount | module           | jira_id      |
          | blaude  | minutes | 5      | header-cards     | QANOV-493374 |
          | blaude  | hours   | 1      | header-cards     | QANOV-493376 |
          | blaude  | days    | 1      | header-cards     | QANOV-493377 |
          | blaude  | months  | 1      | header-cards     | QANOV-493379 |
          | o2de    | minutes | 5      | header-cards     | QANOV-493383 |
          | o2de    | hours   | 1      | header-cards     | QANOV-493385 |
          | o2de    | days    | 1      | header-cards     | QANOV-493386 |
          | o2de    | months  | 1      | header-cards     | QANOV-493387 |
          | o2uk    | minutes | 5      | header-cards-cms | QANOV-493388 |
          | o2uk    | hours   | 1      | header-cards-cms | QANOV-493389 |
          | o2uk    | days    | 1      | header-cards-cms | QANOV-493390 |
          | o2uk    | months  | 1      | header-cards-cms | QANOV-493391 |
          | vivobr  | minutes | 5      | header-cards-cms | QANOV-249262 |
          | vivobr  | hours   | 1      | header-cards-cms | QANOV-249263 |
          | vivobr  | days    | 1      | header-cards-cms | QANOV-249264 |
          | vivobr  | months  | 1      | header-cards-cms | QANOV-249265 |
          | moves   | minutes | 5      | header-cards-cms | QANOV-249267 |
          | moves   | hours   | 1      | header-cards-cms | QANOV-249268 |
          | moves   | days    | 1      | header-cards-cms | QANOV-249269 |
          | moves   | months  | 1      | header-cards-cms | QANOV-249270 |

    @automatic
    Examples:
          | product | unit    | amount | module           | jira_id      |
          | blaude  | seconds | 1      | header-cards     | QANOV-493392 |
          | o2de    | seconds | 1      | header-cards     | QANOV-493381 |
          | o2uk    | seconds | 1      | header-cards-cms | QANOV-493393 |
          | vivobr  | seconds | 1      | header-cards-cms | QANOV-249261 |
          | moves   | seconds | 1      | header-cards-cms | QANOV-249266 |

  @jira.<jira_id> @<product> @jira.cv.13.5 @qa @regression @web @webapp
  @fixture.cms.start_tab_header.with_dismissible_url_action @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario Outline: A user who clicks in start tab header action can see the start tab header again when it is configured in CMS to be seen again in 1 <unit> in webapp
    To be executed in QA
    Given there are "any" start tab headers configured in CMS
      And the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has "1" action
      And the start tab header configured in CMS has a "manual" url defined for the "main" action
      And the start tab header configured in CMS can be displayed again after "1" "<unit>"
      And user is in the "Modular Page Start Tab" modular page
      And waits until the "start_tab_headers_module.list" list is displayed
      And waits until the "start_tab_headers_module.list" list is stable
      And waits until any element in the "start_tab_headers_module.list" list has the "[CONTEXT:start_tab_header.current.alertConfig.description]" text
     When clicks on the "action_button" button of the element with "[CONTEXT:start_tab_header.current.alertConfig.description]" text on the "description" field of the "start_tab_headers_module.list" list
      And waits "1" <unit>
      And I go back to the previous page
      And user is in the "Modular Page Start Tab" modular page
     Then the "start_tab_headers_module" module is displayed
      And the "start_tab_headers_module.list" list is displayed

    @manual
    Examples:
          | product | unit    | module           | jira_id      |
          | blaude  | minutes | header-cards     | QANOV-493394 |
          | blaude  | hours   | header-cards     | QANOV-493395 |
          | blaude  | days    | header-cards     | QANOV-493396 |
          | blaude  | months  | header-cards     | QANOV-493397 |
          | o2de    | minutes | header-cards     | QANOV-493399 |
          | o2de    | hours   | header-cards     | QANOV-493400 |
          | o2de    | days    | header-cards     | QANOV-493401 |
          | o2de    | months  | header-cards     | QANOV-493402 |
          | o2uk    | minutes | header-cards-cms | QANOV-493403 |
          | o2uk    | hours   | header-cards-cms | QANOV-493404 |
          | o2uk    | days    | header-cards-cms | QANOV-493405 |
          | o2uk    | months  | header-cards-cms | QANOV-493406 |
          | vivobr  | minutes | header-cards-cms | QANOV-389778 |
          | vivobr  | hours   | header-cards-cms | QANOV-389779 |
          | vivobr  | days    | header-cards-cms | QANOV-389780 |
          | vivobr  | months  | header-cards-cms | QANOV-389781 |
          | moves   | minutes | header-cards-cms | QANOV-389782 |
          | moves   | hours   | header-cards-cms | QANOV-389783 |
          | moves   | days    | header-cards-cms | QANOV-389784 |
          | moves   | months  | header-cards-cms | QANOV-389785 |

    @automatic
    Examples:
          | product | unit    | module           | jira_id      |
          | blaude  | seconds | header-cards     | QANOV-493407 |
          | o2de    | seconds | header-cards     | QANOV-493398 |
          | o2uk    | seconds | header-cards-cms | QANOV-493408 |
          | vivobr  | seconds | header-cards-cms | QANOV-389786 |
          | moves   | seconds | header-cards-cms | QANOV-389787 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @manual @mobile @qa @regression
  Scenario Outline: A user who clicks in start tab header action cannot see the start tab header again during the time it is configured in CMS to be dismissed
    To be executed in QA
    Given user has any "normal" start tab header configured in CMS for "Module Page Start Tab" page
      And the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has a "manual" url defined for the "main" action
      And the start tab header configured in CMS can be displayed again after "1" "minute"
      And user is in the "Modular Page Start Tab" modular page
      And waits until any element in the "start_tab_headers_module.list" list has the "[CONTEXT:start_tab_header.current.alertConfig.description]" text
     When clicks on the "action_button" button of the element with "[CONTEXT:start_tab_header.current.alertConfig.description]" text on the "description" field of the "start_tab_headers" list
      And waits "1" seconds
      And clicks on the "navigation_top_bar.back_button" button
      And user is in the "[CONF:landing_tab]" page
      And user is in the "Modular Page Start Tab" modular page
     Then no element in the "start_tab_headers" list has the value "[CONTEXT:start_tab_header.current.alertConfig.description]" in the "description" field

    Examples:
          | product | module           | jira_id      |
          | blaude  | header-cards     | QANOV-493409 |
          | o2de    | header-cards     | QANOV-493410 |
          | o2uk    | header-cards-cms | QANOV-493411 |
          | vivobr  | header-cards-cms | QANOV-249271 |
          | moves   | header-cards-cms | QANOV-249272 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @manual @mobile @qa @regression
  Scenario Outline: A user can see a normal start tab header available in current date
    To be executed in QA
    Given user has any "normal" start tab header configured in CMS for "Module Page Start Tab" page
      And the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS does not have any audience defined
      And the start tab header configured in CMS has a "start_date" before "today"
      And the start tab header configured in CMS has a "end_date" after "today"
      And user is in the "Modular Page Start Tab" modular page
     Then the "start_tab_module" module is displayed
      And the "start_tab_header.title" textfield with "[CONTEXT:start_tab.title]" text is displayed
      And the "start_tab_header.text" textfield with "[CONTEXT:start_tab.text]" text is displayed

    Examples:
          | product | module           | jira_id      |
          | blaude  | header-cards     | QANOV-493416 |
          | o2de    | header-cards     | QANOV-493418 |
          | o2uk    | header-cards-cms | QANOV-493420 |
          | vivobr  | header-cards-cms | QANOV-249273 |
          | moves   | header-cards-cms | QANOV-249274 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @manual @mobile @qa @regression
  Scenario Outline: A user can see a default start tab header available in current date
    To be executed in QA
    Given user has any "default" start tab header configured in CMS for "Module Page Start Tab" page
      And user does not have any "normal" start tab header configured in CMS for "Module Page Start Tab" page
      And the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has a "start_date" before "today"
      And the start tab header configured in CMS has a "end_date" after "today"
      And user is in the "Modular Page Start Tab" modular page
     Then the "start_tab_header" element is displayed
      And the "start_tab_header.title" textfield with "[CONTEXT:start_tab.title]" text is displayed
      And the "start_tab_header.text" textfield with "[CONTEXT:start_tab.text]" text is displayed

    Examples:
          | product | module           | jira_id      |
          | blaude  | header-cards     | QANOV-493423 |
          | o2de    | header-cards     | QANOV-493425 |
          | o2uk    | header-cards-cms | QANOV-493426 |
          | vivobr  | header-cards-cms | QANOV-249275 |
          | moves   | header-cards-cms | QANOV-249276 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @manual @mobile @qa @regression
  Scenario Outline: A user cannot see a normal start tab header available <when> today
    To be executed in QA
    Given user has any "normal" start tab header configured in CMS for "Module Page Start Tab" page
      And the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS does not have any audience defined
      And the start tab header configured in CMS has a "<date_field>" <when> "today"
      And user is in the "Modular Page Start Tab" modular page
     Then no element in the "start_tab_headers" list has the value "[CONTEXT:start_tab_header.current.alertConfig.description]" in the "description" field

    Examples:
          | product | when   | date_field | jira_id      |
          | blaude  | before | end_date   | QANOV-493429 |
          | o2de    | before | end_date   | QANOV-493431 |
          | o2uk    | before | end_date   | QANOV-493433 |
          | vivobr  | before | end_date   | QANOV-249277 |
          | moves   | before | end_date   | QANOV-249278 |
          | blaude  | after  | start_date | QANOV-493435 |
          | o2de    | after  | start_date | QANOV-493436 |
          | o2uk    | after  | start_date | QANOV-493437 |
          | vivobr  | after  | start_date | QANOV-249279 |
          | moves   | after  | start_date | QANOV-249280 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.13.5 @manual @mobile @qa @regression
  Scenario Outline: A user cannot see a default start tab header available <when> today
    To be executed in QA
    Given user has any "default" start tab header configured in CMS for "Module Page Start Tab" page
      And user does not have any "normal" start tab header configured in CMS for "Module Page Start Tab" page
      And the "header-cards-cms" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has a "<date_field>" <when> "today"
      And user is in the "Modular Page Start Tab" modular page
     Then no element in the "start_tab_headers" list has the value "[CONTEXT:start_tab_header.current.alertConfig.description]" in the "description" field

    Examples:
          | product | when   | date_field | jira_id      |
          | blaude  | before | end_date   | QANOV-493438 |
          | o2de    | before | end_date   | QANOV-493439 |
          | o2uk    | before | end_date   | QANOV-493440 |
          | vivobr  | before | end_date   | QANOV-249281 |
          | moves   | before | end_date   | QANOV-249282 |
          | blaude  | after  | start_date | QANOV-493441 |
          | o2de    | after  | start_date | QANOV-493442 |
          | o2uk    | after  | start_date | QANOV-493443 |
          | vivobr  | after  | start_date | QANOV-249283 |
          | moves   | after  | start_date | QANOV-249284 |

  @jira.QANOV-249285 @android @automatic @ios @jira.cv.13.5 @mobile @qa @smoke @vivobr @webapp
  @fixture.cms.start_tab_header.with_pending_invoices_preconfigured_provider
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario: A user can see a start tab header configured with default values and preconfigured provider
    To be executed in QA
    Given has "any" bills in "unpaid" status in any subscription
      And there are "any" start tab headers configured in CMS
      And the "header-cards-cms" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has a "preconfigured" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has no audience
     When user is in the "Modular Page Start Tab" modular page
     Then the "start_tab_headers_module" module is displayed
      And the "start_tab_headers_module.list" list is displayed
      And waits until the "start_tab_headers_module.list" list is stable
      And any element in the "start_tab_headers_module.list" list has the "description" textfield with the "Suas faturas já estao disponiveis pra pagamento" format

  @jira.QANOV-249286 @android @ios @jira.cv.13.5 @manual @mobile @moves @qa @smoke @webapp
  @fixture.cms.start_tab_header.with_pending_invoices_preconfigured_provider
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario: A user can see a start tab header configured with default values and preconfigured provider
    To be executed in QA
    Given user has "any" debt
      And there are "any" start tab headers configured in CMS
      And the "header-cards-cms" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has a "preconfigured" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has no audience
     When user is in the "Modular Page Start Tab" modular page
     Then the "start_tab_headers_module" module is displayed
      And the "start_tab_headers_module.list" list is displayed
      And waits until the "start_tab_headers_module.list" list is stable
      And any element in the "start_tab_headers_module.list" list has the "description" textfield with the "Tu gasto extra actual es de" format

  @jira.QANOV-249287 @android @automatic @ios @jira.cv.13.5 @mobile @qa @smoke @vivobr @webapp
  @fixture.cms.start_tab_header.with_reminders_api_technician_visit_provider
  @fixture.cms.page.start_tab
  @fixture.cms.module.start_tab_header
  Scenario: A user can see a start tab header configured with default values and Reminders API provider (technician visit)
    To be executed in QA
    Given user has reminders of "technician_visit" type
      And the "header-cards-cms" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has a "reminders API" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has no audience
     When user is in the "Modular Page Start Tab" modular page
     Then the "start_tab_headers_module" module is displayed
      And the "start_tab_headers_module.list" list is displayed
      And waits until the "start_tab_headers_module.list" list is stable
      And any element in the "start_tab_headers_module.list" list has the "description" textfield with the "[CONTEXT:start_tab_header.current.alertConfig.description]" text

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @manual @mobile @regression
  Scenario Outline: The Header Autoplay will change the card automatically when there are several headers
    To be executed in QA
    Given the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has ">1" headers
      And user is in the "Modular Page Start Tab" modular page
     When takes a screenshot of the start tab header
      And waits "5" seconds
     Then the start tab header is not in the same position as before

    Examples:
          | product | module           | jira_id      |
          | blaude  | header-cards     | QANOV-493444 |
          | o2de    | header-cards     | QANOV-493445 |
          | o2uk    | header-cards-cms | QANOV-407103 |
          | vivobr  | header-cards-cms | QANOV-47883  |
          | moves   | header-cards-cms | QANOV-407102 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario Outline: A user with several headers can swipe the cards
    To be executed in QA
    Given the "<module>" module is configured in CMS for "Modular Page Start Tab" page
      And the start tab header configured in CMS has ">1" headers
      And user is in the "Modular Page Start Tab" modular page
     Then the "header_cards" list can be swiped

    Examples:
          | product | module           | jira_id      |
          | blaude  | header-cards     | QANOV-257432 |
          | o2de    | header-cards     | QANOV-312462 |
          | o2uk    | header-cards-cms | QANOV-266869 |
          | vivobr  | header-cards-cms | QANOV-97620  |
          | moves   | header-cards-cms | QANOV-527624 |

  @jira.QANOV-475733 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @qa @sanity
  @vivobr @webapp
  Scenario: A user can see a single item start tab headers module
    To be executed in QA
    Given the "header-cards-cms" module is configured in CMS for "Modular Page Start Tab" page with the "SINGLE_ITEM" representation
      And user has ">1" start tab headers configured in CMS
     When user is in the "Modular Page Start Tab" modular page
     Then the "start_tab_headers_module" module is displayed
      And the "start_tab_headers" list is not displayed
      And the "start_tab_headers_module.description" textfield with "[CONTEXT:start_tab_header.current.alertConfig.description]" text is displayed

  @jira.QANOV-531476 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @qa @smoke
  @vivobr @webapp
  Scenario: A user can see a single item start tab headers module with dismiss action
    To be executed in QA
    Given the "header-cards-cms" module is configured in CMS for "Modular Page Start Tab" page with the "SINGLE_ITEM" representation
      And user has ">1" start tab headers configured in CMS
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has ">0" action
      And the start tab header configured in CMS has "on" the action dismiss
      And the start tab header configured in CMS has "" text for dismiss
     Then the "start_tab_headers_module" module is displayed
      And the "start_tab_headers" list is not displayed
      And the "start_tab_headers_module.description" textfield with "[CONTEXT:start_tab_header.current.alertConfig.description]" text is displayed
      And the "start_tab_headers_module.action_button" button with "[CONTEXT:start_tab_header.current.alertConfig.mainAction.text]" text is displayed
      And the "start_tab_headers_module.dismiss_action" link with "Ocultar Notificaçao" text is displayed

  @jira.QANOV-531477 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @qa @smoke
  @vivobr @webapp
  Scenario: A user can see a single item start tab headers module with custom text for the dismiss action
    To be executed in QA
    Given the "header-cards-cms" module is configured in CMS for "Modular Page Start Tab" page with the "SINGLE_ITEM" representation
      And user has ">1" start tab headers configured in CMS
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has ">0" action
      And the start tab header configured in CMS has "on" the action dismiss
      And the start tab header configured in CMS has "Dismiss" text for dismiss
     Then the "start_tab_headers_module" module is displayed
      And the "start_tab_headers" list is not displayed
      And the "start_tab_headers_module.description" textfield with "[CONTEXT:start_tab_header.current.alertConfig.description]" text is displayed
      And the "start_tab_headers_module.action_button" button with "[CONTEXT:start_tab_header.current.alertConfig.mainAction.text]" text is displayed
      And the "start_tab_headers_module.dismiss_action" link with "Dismiss" text is displayed

  @jira.QANOV-475734 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @qa @smoke
  @vivobr @webapp
  Scenario: A user can dismiss a start tab header and won't see any start tab header when a single item start tab headers module is configured
    To be executed in QA
    Given the "header-cards-cms" module is configured in CMS for "Modular Page Start Tab" page with the "SINGLE_ITEM" representation
      And user has "1" start tab headers configured in CMS
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has ">0" action
      And the start tab header configured in CMS has "on" the action dismiss
     When user is in the "Modular Page Start Tab" modular page
      And clicks on the "start_tab_headers_module.dismiss_action" link
     Then the "start_tab_headers_module" module is not displayed

  @jira.QANOV-475735 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @qa @smoke
  @vivobr @webapp
  Scenario: A user can dismiss a start tab header and see the next start tab header configured in CMS after refreshing when a single item start tab headers module is configured
    To be executed in QA
    Given the "header-cards-cms" module is configured in CMS for "Modular Page Start Tab" page with the "SINGLE_ITEM" representation
      And user has ">1" start tab headers configured in CMS
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has ">0" action
      And the start tab header configured in CMS has "on" the action dismiss
     When user is in the "Modular Page Start Tab" modular page
      And clicks on the "start_tab_headers_module.dismiss_action" link
      And pulls down the page to refresh
     Then the "start_tab_headers_module" module is displayed

  @jira.QANOV-475736 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @qa @regression
  @vivobr @webapp
  Scenario: A user can dismiss a start tab header and see the next start tab header configured in CMS without dismiss link after refreshing when a single item start tab headers module is configured
    To be executed in QA
    Given the "header-cards-cms" module is configured in CMS for "Modular Page Start Tab" page with the "SINGLE_ITEM" representation
      And user has "2" start tab headers configured in CMS
      And the start tab header configured in CMS has a "manual" provider
      And the start tab header configured in CMS has the "PUBLISHED" status
      And the start tab header configured in CMS has ">0" action
      And the start tab header configured in CMS has "on" the action dismiss
     When user is in the "Modular Page Start Tab" modular page
      And clicks on the "start_tab_headers_module.dismiss_action" link
      And pulls down the page to refresh
     Then the "start_tab_headers_module" module is displayed
      And the "start_tab_headers_module.dismiss_action" link is not displayed

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @qa @regression
  @vivobr @webapp
  Scenario Outline: A user who dismiss a start tab header can see the start tab header again when it is configured in CMS to be seen again in 1 <unit> when a single item start tab headers module is configured
    To be executed in QA
    Given the "header-cards-cms" module is configured in CMS for "Modular Page Start Tab" page with the "SINGLE_ITEM" representation
      And the first start tab header configured in CMS can be displayed again after "1" "<unit>"
      And user is in the "Modular Page Start Tab" modular page
     When clicks on the "header.dismiss_action" link
      And the next header configured in the CMS will be displayed in the "start_tab_headers_module.list" list
      And waits "1" <unit>
      And pulls down the page to refresh
     Then the "[CONTEXT:start_tab_header.last_dismissed_header]" start tab header is displayed in the "start_tab_headers_module.list" list

    Examples:
          | unit    | jira_id      |
          | minutes | QANOV-475737 |
          | hours   | QANOV-475738 |
          | days    | QANOV-475739 |
          | months  | QANOV-475740 |

  @jira.QANOV-475741 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @qa @smoke
  @vivobr @webapp
  Scenario: A user can see a single item start tab headers module after the start tab headers list has been reorder in the CMS
    To be executed in QA
    Given the "header-cards-cms" module is configured in CMS for "Modular Page Start Tab" page with the "SINGLE_ITEM" representation
      And user has ">1" start tab headers configured in CMS
     When user is in the "Modular Page Start Tab" modular page
      And user reorders the start tab headers in reverse order
     Then the "start_tab_headers_module" module is displayed
      And the first header configured in the CMS is displayed
