# -*- coding: utf-8 -*-
@jira.QANOV-311304
Feature: Embedded dynamic content


  @jira.<jira_id> @<priority> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @webapp
  @fixture.cms.dynamic_content.embedded_content_with_markdown
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can see an Embeddable Dynamic Content module with a markdown section
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "markdown-section" section
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "dynamic_content_markdown.title" textfield with "Title" text is displayed
      And the "dynamic_content_markdown.body" textfield with "Body" text is displayed

    Examples:
          | product | priority | cv   | jira_id      |
          | moves   | smoke    | 14.0 | QANOV-311307 |
          | blaude  | sanity   | 14.0 | QANOV-311308 |
          | o2de    | sanity   | 24.0 | QANOV-554807 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.dynamic_content.embedded_content_with_action
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can see an Embeddable Dynamic Content module with a link
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "action-section" section
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "dynamic_content_action" link with "[CONTEXT:embeddable_dynamic_content.action.text]" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.0 | QANOV-311311 |
          | blaude  | 14.0 | QANOV-311312 |
          | o2de    | 24.0 | QANOV-554808 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @qa @regression @web @webapp
  @fixture.cms.dynamic_content.embedded_content_with_action
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can click on a link in an Embeddable Dynamic Content module in webapp
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "action-section" section
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "dynamic_content_action" link
     Then the current URL is "[CONF:web_url_base][CONTEXT:embeddable_dynamic_content.action.url]"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.0 | QANOV-311315 |
          | blaude  | 14.0 | QANOV-311316 |
          | o2de    | 24.0 | QANOV-554809 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression
  @fixture.cms.dynamic_content.embedded_content_with_action
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can click on a link in an Embeddable Dynamic Content module
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "action-section" section
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "dynamic_content_action" button
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | header         | cv   | jira_id      |
          | moves   | Internet       | 14.0 | QANOV-377160 |
          | blaude  | Daten-Optionen | 14.0 | QANOV-377161 |
          | o2de    | Daten-Optionen | 24.0 | QANOV-554810 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.dynamic_content.embedded_content_with_image
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can see an Embeddable Dynamic Content module with an image
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "image-section" section
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "src" property of the "dynamic_content_img" element matches "[CONTEXT:embeddable_dynamic_content.mobileUrl]" text

    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.0 | QANOV-311319 |
          | blaude  | 14.0 | QANOV-311320 |
          | o2de    | 24.0 | QANOV-554811 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.dynamic_content.embedded_content_with_feedback_icon
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can see an Embeddable Dynamic Content module with an <icon_type> feedback icon
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "feedback-icon-section" section
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "dynamic_content_feedback_icon" element is displayed

    Examples:
          | product | cv   | icon_type | icon_element | jira_id      |
          | moves   | 14.0 | Info      | info         | QANOV-311327 |
          | moves   | 14.0 | Success   | success      | QANOV-311328 |
          | moves   | 14.0 | Error     | error        | QANOV-311329 |
          | blaude  | 14.0 | Info      | info         | QANOV-311330 |
          | blaude  | 14.0 | Success   | success      | QANOV-311331 |
          | blaude  | 14.0 | Error     | error        | QANOV-311332 |
          | o2de    | 24.0 | Info      | info         | QANOV-554812 |
          | o2de    | 24.0 | Success   | success      | QANOV-554813 |
          | o2de    | 24.0 | Error     | error        | QANOV-554814 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.dynamic_content.embedded_content_with_row_list_all_fields
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can see an Embeddable Dynamic Content module with a row list with all elements
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "row-list-section" section
      And the row list section in the "Embeddable Dynamic Content" configured in CMS has configured the "icon" field in all items
      And the row list section in the "Embeddable Dynamic Content" configured in CMS has configured the "title" field in all items
      And the row list section in the "Embeddable Dynamic Content" configured in CMS has configured the "subtitle" field in all items
      And the row list section in the "Embeddable Dynamic Content" configured in CMS has configured the "url" field in all items
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "dynamic_content_row_list.row_list" list is displayed
      And each element in the "dynamic_content_row_list.row_list" list has the "icon" field
      And each element in the "dynamic_content_row_list.row_list" list has the "title" field
      And each element in the "dynamic_content_row_list.row_list" list has the "subtitle" field
      And each element in the "dynamic_content_row_list.row_list" list has the "chevron" field

    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.0 | QANOV-311335 |
          | blaude  | 14.0 | QANOV-311336 |
          | o2de    | 24.0 | QANOV-554815 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.dynamic_content.embedded_content_with_row_list_with_url
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can see an Embeddable Dynamic Content module with a row list with title and url
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    NOTE: this scenario is moved to manual until solving the problem of xpath mangling icon and chevron for BoxedRow mistica component
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "row-list-section" section
      And the row list section in the "Embeddable Dynamic Content" configured in CMS does not have configured the "icon" field in all items
      And the row list section in the "Embeddable Dynamic Content" configured in CMS has configured the "title" field in all items
      And the row list section in the "Embeddable Dynamic Content" configured in CMS does not have configured the "subtitle" field in all items
      And the row list section in the "Embeddable Dynamic Content" configured in CMS has configured the "url" field in all items
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "dynamic_content_row_list.row_list" list is displayed
      And each element in the "dynamic_content_row_list.row_list" list does not have the "icon" field
      And each element in the "dynamic_content_row_list.row_list" list has the "title" field
      And each element in the "dynamic_content_row_list.row_list" list does not have the "subtitle" field
      And each element in the "dynamic_content_row_list.row_list" list has the "chevron" field

    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.0 | QANOV-311339 |
          | blaude  | 14.0 | QANOV-311340 |
          | o2de    | 24.0 | QANOV-554816 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.dynamic_content.embedded_content_with_row_list
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can see an Embeddable Dynamic Content module with a row list with only title
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "row-list-section" section
      And the row list section in the "Embeddable Dynamic Content" configured in CMS does not have configured the "icon" field in all items
      And the row list section in the "Embeddable Dynamic Content" configured in CMS has configured the "title" field in all items
      And the row list section in the "Embeddable Dynamic Content" configured in CMS does not have configured the "subtitle" field in all items
      And the row list section in the "Embeddable Dynamic Content" configured in CMS does not have configured the "url" field in all items
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "dynamic_content_row_list.text_row_list" list is displayed
      And the "dynamic_content_row_list.row_list" list is not displayed

    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.0 | QANOV-311343 |
          | blaude  | 14.0 | QANOV-311344 |
          | o2de    | 24.0 | QANOV-554817 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @qa @regression @web @webapp
  @fixture.cms.dynamic_content.embedded_content_with_row_list_with_url
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can click on an element in a row list in an Embeddable Dynamic Content module with url on webapp
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "row-list-section" section
      And the row list section in the "Embeddable Dynamic Content" configured in CMS has configured the "url" field in all items
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on any element in the "dynamic_content_row_list.row_list" list
     Then the current URL contains "[CONF:web_url_base]<url>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv   | url                                    | jira_id      |
          | moves   | 14.0 | /consumptions/modular-screen/internet/ | QANOV-311347 |
          | blaude  | 14.0 | /link/vertrag-daten                    | QANOV-311348 |
          | o2de    | 24.0 | /link/vertrag-daten                    | QANOV-554818 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression
  @fixture.cms.dynamic_content.embedded_content_with_row_list_with_url
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can click on an element in a row list in an Embeddable Dynamic Content module with url
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "row-list-section" section
      And the row list section in the "Embeddable Dynamic Content" configured in CMS has configured the "url" field in all items
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on any element in the "dynamic_content_row_list.row_list" list
     Then the internal webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.0 | QANOV-377162 |
          | blaude  | 14.0 | QANOV-377163 |
          | o2de    | 24.0 | QANOV-554819 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.dynamic_content.embedded_content_with_banner_card
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can see an Embeddable Dynamic Content module with an banner card
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "banner-card-section" section
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "dynamic_content_banner_card.title" textfield with "[CONTEXT:embeddable_dynamic_content.title]" text is displayed
      And the "dynamic_content_banner_card.action" link with "[CONTEXT:embeddable_dynamic_content.action.text]" text is displayed
      And the "src" property of the "dynamic_content_banner_card.image" element matches "[CONTEXT:embeddable_dynamic_content.imageUrl]" text

    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.0 | QANOV-311351 |
          | blaude  | 14.0 | QANOV-311352 |
          | o2de    | 24.0 | QANOV-554820 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @qa @regression @web @webapp
  @fixture.cms.dynamic_content.embedded_content_with_banner_card
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can see click on the action in a banner card in an Embeddable Dynamic Content module in webapp
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "banner-card-section" section
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "dynamic_content_banner_card.action" link
     Then the current URL contains "<url>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv   | url                     | jira_id      |
          | moves   | 14.0 | modular-screen/internet | QANOV-311355 |
          | blaude  | 14.0 | link/vertrag-daten      | QANOV-311356 |
          | o2de    | 24.0 | link/vertrag-daten      | QANOV-554821 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression
  @fixture.cms.dynamic_content.embedded_content_with_banner_card
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can click on the action in a banner card in an Embeddable Dynamic Content module
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "banner-card-section" section
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "dynamic_content_banner_card.action" link
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | header         | cv   | jira_id      |
          | moves   | Internet       | 14.0 | QANOV-377164 |
          | blaude  | Daten-Optionen |  14.0 | QANOV-377165 |
          | o2de    | Daten-Optionen |  24.0 | QANOV-554822 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.dynamic_content.embedded_content_with_empty_case
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can see an Embeddable Dynamic Content module with an empty case section
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "empty-case-section" section
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "dynamic_content_empty_case.image" image is displayed
      And the "dynamic_content_empty_case.title" textfield with "[CONTEXT:embeddable_dynamic_content.title]" text is displayed
      And the "dynamic_content_empty_case.description" textfield with "[CONTEXT:embeddable_dynamic_content.subtitle]" text is displayed
      And the "dynamic_content_empty_case.button" button with "[CONTEXT:embeddable_dynamic_content.action.text]" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.0 | QANOV-311359 |
          | blaude  | 14.0 | QANOV-311360 |
          | o2de    | 24.0 | QANOV-554823 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression
  @fixture.cms.dynamic_content.embedded_content_with_empty_case
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can click on a button in an empty case section in an Embeddable Dynamic Content module
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "empty-case-section" section
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "dynamic_content_empty_case.button" button
     Then the internal webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.0 | QANOV-311363 |
          | blaude  | 14.0 | QANOV-311364 |
          | o2de    | 24.0 | QANOV-554824 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @qa @regression @web @webapp
  @fixture.cms.dynamic_content.embedded_content_with_empty_case
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can click on a button in an empty case section in an Embeddable Dynamic Content module in webapp
    We're assuming the content checked is already created in Dynamic Content CMS
    To be executed in QA
    Given the "Embeddable Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Embeddable Dynamic Content" module has the "Embeddable Content" dynamic content type
      And the "Embeddable Dynamic Content" dynamic content configured in CMS has a "empty-case-section" section
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "dynamic_content_empty_case.button" button
     Then the current URL is "[CONF:web_url_base][CONTEXT:embeddable_dynamic_content.action.url]"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.0 | QANOV-377166 |
          | blaude  | 14.0 | QANOV-377167 |
          | o2de    | 24.0 | QANOV-554825 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user can see an Embeddable Dynamic Content module with several sections in the order configured in CMS
    We are assuming that there is a dynamic content page in QA environment
    Given the "<module>" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Feedback icon section" section is configured in CMS for embeddable content configured in the "Embeddable Dynamic Content (dynamic_content)" module configured in CMS for "Modular Page Configurable Modules" in the "1" position
      And the "Markdown section" section is configured in CMS for embeddable content configured in the "Embeddable Dynamic Content (dynamic_content)" module configured in CMS for "Modular Page Configurable Modules" in the "2" position
      And the "Image section" section is configured in CMS for embeddable content configured in the "Embeddable Dynamic Content (dynamic_content)" module configured in CMS for "Modular Page Configurable Modules" in the "3" position
      And the "Action section" section is configured in CMS for embeddable content configured in the "Embeddable Dynamic Content (dynamic_content)" module configured in CMS for "Modular Page Configurable Modules" in the "4" position
      And the "Row List section" section is configured in CMS for embeddable content configured in the "Embeddable Dynamic Content (dynamic_content)" module configured in CMS for "Modular Page Configurable Modules" in the "5" position
      And the "Banner card section" section is configured in CMS for embeddable content configured in the "Embeddable Dynamic Content (dynamic_content)" module configured in CMS for "Modular Page Configurable Modules" in the "6" position
      And the "Empty case section" section is configured in CMS for embeddable content configured in the "Embeddable Dynamic Content (dynamic_content)" module configured in CMS for "Modular Page Configurable Modules" in the "7" position
      And user is in the "Modular Page Configurable Modules" dynamic content page
     Then the "dynamic_content_module" module is displayed
      And the "dynamic_content_module.feedback_icon_section" section is displayed in the "1" position
      And the "dynamic_content_module.markdown_section" section is displayed in the "2" position
      And the "dynamic_content_module.image_section" section is displayed in the "3" position
      And the "dynamic_content_module.action_section" section is displayed in the "4" position
      And the "dynamic_content_module.row_list_section" section is displayed in the "5" position
      And the "dynamic_content_module.banner_card_section" section is displayed in the "6" position
      And the "dynamic_content_module.empty_case_section" section is displayed in the "7" position

    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.0 | QANOV-311367 |
          | blaude  | 14.0 | QANOV-311368 |
          | o2de    | 24.0 | QANOV-554826 |
