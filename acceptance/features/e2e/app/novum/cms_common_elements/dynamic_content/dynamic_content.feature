# -*- coding: utf-8 -*-
@jira.QANOV-311179
Feature: Dynamic content


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.0 @jira.link.detects.ACCOUNT-22190 @mobile @qa @sanity
  @fixture.cms.dynamic_content.dynamic_page_with_markdown
  Scenario Outline: A user can see a dynamic content page with a markdown section
    We are assuming that there is a dynamic content page in QA environment
    Given the "markdown-section" section is configured in CMS for the dynamic content page
      And user is in the "Dynamic Page" dynamic content page
      And waits until the "dynamic_content_markdown" element is visible
     Then the "[CONTEXT:dynamic_content.title]" header is displayed
      And the "dynamic_content_markdown.title" textfield with "Title" text is displayed
      And the "dynamic_content_markdown.body" textfield with "Body" text is displayed
      And clicks on the "navigation_top_bar.back_button" button

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311180 |
          | o2uk    | QANOV-311181 |
          | moves   | QANOV-311182 |
          | blaude  | QANOV-311183 |
          | o2de    | QANOV-531502 |

  @jira.<jira_id> @<product> @automatic @jira.cv.14.0 @qa @sanity @web @webapp
  @fixture.cms.dynamic_content.dynamic_page_with_markdown
  Scenario Outline: A user can see a dynamic content page with a markdown section in webapp
    We are assuming that there is a dynamic content page in QA environment
    Given the "markdown-section" section is configured in CMS for the dynamic content page
      And user is in the "Dynamic Page" dynamic content page
      And waits until the "dynamic_content_markdown" element is visible
     Then the browser title is "[CONTEXT:dynamic_content.title]"
      And the "dynamic_content_markdown.title" textfield with "Title" text is displayed
      And the "dynamic_content_markdown.body" textfield with "Body" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-358927 |
          | o2uk    | QANOV-358928 |
          | moves   | QANOV-358929 |
          | blaude  | QANOV-358930 |
          | o2de    | QANOV-531503 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can see a dynamic content page with an link
    We are assuming that there is a dynamic content page in QA environment
    Given the "Action section" section is configured in CMS for "Dynamic Content Page" dynamic content page
      And user is in the "Dynamic Content Page" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "action_section.link" link with "[CONTEXT:dynamic_content.current.content.action.link]" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311184 |
          | o2uk    | QANOV-311185 |
          | moves   | QANOV-311186 |
          | blaude  | QANOV-311187 |
          | o2de    | QANOV-531504 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can click on the link in a dynamic content page
    We are assuming that there is a dynamic content page in QA environment
    Given the "Action section" section is configured in CMS for "Dynamic Content Page" dynamic content page
      And user is in the "Dynamic Content Page" dynamic content page
     When clicks on the "action_section.link" button
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dynamic Content Page" dynamic content page

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311188 |
          | o2uk    | QANOV-311189 |
          | moves   | QANOV-311190 |
          | blaude  | QANOV-311191 |
          | o2de    | QANOV-531505 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario Outline: A user can see a dynamic content page with an image
    We are assuming that there is a dynamic content page in QA environment
    Given the "Image section" section is configured in CMS for "Dynamic Content Page" dynamic content page
      And user is in the "Dynamic Content Page" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "image_section.image" image is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311192 |
          | o2uk    | QANOV-311193 |
          | moves   | QANOV-311194 |
          | blaude  | QANOV-311195 |
          | o2de    | QANOV-531506 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario Outline: A user can see a dynamic content page with an <icon_type> feedback icon
    We are assuming that there is a dynamic content page in QA environment
    Given the "Feedback icon section" section is configured in CMS for "Dynamic Content Page" dynamic content page
      And the feedback icon section configured in CMS has the "<icon_type>" icon
      And user is in the "Dynamic Content Page" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "feedback_icon_section.<icon_element>" image is displayed

    Examples:
          | product | icon_type | icon_element | jira_id      |
          | vivobr  | Info      | info_icon    | QANOV-311196 |
          | vivobr  | Success   | success_icon | QANOV-311197 |
          | vivobr  | Error     | error_icon   | QANOV-311198 |
          | o2uk    | Info      | info_icon    | QANOV-311199 |
          | o2uk    | Success   | success_icon | QANOV-311200 |
          | o2uk    | Error     | error_icon   | QANOV-311201 |
          | moves   | Info      | info_icon    | QANOV-311202 |
          | moves   | Success   | success_icon | QANOV-311203 |
          | moves   | Error     | error_icon   | QANOV-311204 |
          | blaude  | Info      | info_icon    | QANOV-311205 |
          | blaude  | Success   | success_icon | QANOV-311206 |
          | blaude  | Error     | error_icon   | QANOV-311207 |
          | o2de    | Info      | info_icon    | QANOV-531507 |
          | o2de    | Success   | success_icon | QANOV-531508 |
          | o2de    | Error     | error_icon   | QANOV-531509 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario Outline: A user can see a dynamic content page with a row list with all elements
    We are assuming that there is a dynamic content page in QA environment
    Given the "Row List section" section is configured in CMS for "Dynamic Content Page" dynamic content page
      And the row list section in the dynamic content page configured in CMS has configured the "icon" element in all items
      And the row list section in the dynamic content page configured in CMS has configured the "title" element in all items
      And the row list section in the dynamic content page configured in CMS has configured the "subtitle" element in all items
      And the row list section in the dynamic content page configured in CMS has configured the "url" element in all items
      And user is in the "Dynamic Content Page" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "row_list_section" list is displayed
      And each element in the "row_list_section" list has the "icon" field
      And each element in the "row_list_section" list has the "title" field
      And each element in the "row_list_section" list has the "subtitle" field
      And each element in the "row_list_section" list has the "chevron" field

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311208 |
          | o2uk    | QANOV-311209 |
          | moves   | QANOV-311210 |
          | blaude  | QANOV-311211 |
          | o2de    | QANOV-531510 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can see a dynamic content page with a row list with title and url
    We are assuming that there is a dynamic content page in QA environment
    Given the "Row List section" section is configured in CMS for "Dynamic Content Page" dynamic content page
      And the row list section in the dynamic content page configured in CMS does not have configured the "icon" element in all items
      And the row list section in the dynamic content page configured in CMS has configured the "title" element in all items
      And the row list section in the dynamic content page configured in CMS does not have configured the "subtitle" element in all items
      And the row list section in the dynamic content page configured in CMS has configured the "url" element in all items
      And user is in the "Dynamic Content Page" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "row_list_section" list is displayed
      And each element in the "row_list_section" list does not have the "icon" field
      And each element in the "row_list_section" list has the "title" field
      And each element in the "row_list_section" list does not have the "subtitle" field
      And each element in the "row_list_section" list has the "chevron" field

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311212 |
          | o2uk    | QANOV-311213 |
          | moves   | QANOV-311214 |
          | blaude  | QANOV-311215 |
          | o2de    | QANOV-531511 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can see a dynamic content page with a row list with only title
    We are assuming that there is a dynamic content page in QA environment
    Given the "Row List section" section is configured in CMS for "Dynamic Content Page" dynamic content page
      And the row list section in the dynamic content page configured in CMS does not have configured the "icon" element in all items
      And the row list section in the dynamic content page configured in CMS has configured the "title" element in all items
      And the row list section in the dynamic content page configured in CMS does not have configured the "subtitle" element in all items
      And the row list section in the dynamic content page configured in CMS does not have configured the "url" element in all items
      And user is in the "Dynamic Content Page" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "row_list_section" list is displayed
      And each element in the "row_list_section" list does not have the "icon" field
      And each element in the "row_list_section" list has the "title" field
      And each element in the "row_list_section" list does not have the "subtitle" field
      And each element in the "row_list_section" list does not have the "chevron" field

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311216 |
          | o2uk    | QANOV-311217 |
          | moves   | QANOV-311218 |
          | blaude  | QANOV-311219 |
          | o2de    | QANOV-531512 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can click on an element in a row list in a dynamic content page
    We are assuming that there is a dynamic content page in QA environment
    Given the "Row List section" section is configured in CMS for "Dynamic Content Page" dynamic content page
      And the row list section in the dynamic content page configured in CMS has configured the "url" element in all items
      And user is in the "Dynamic Content Page" dynamic content page
     When clicks on any element in the "row_list_section" list
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dynamic Content Page" dynamic content page is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311220 |
          | o2uk    | QANOV-311221 |
          | moves   | QANOV-311222 |
          | blaude  | QANOV-311223 |
          | o2de    | QANOV-531513 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can see a dynamic content page with no actions
    We are assuming that there is a dynamic content page in QA environment
    Given the dynamic content page configured in CMS had "0" actions
      And user is in the "Dynamic Content Page" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "main_action" button is not displayed
      And the "secondary_action" button is not displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311224 |
          | o2uk    | QANOV-311225 |
          | moves   | QANOV-311226 |
          | blaude  | QANOV-311227 |
          | o2de    | QANOV-531514 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario Outline: A user can see a dynamic content page with one action
    We are assuming that there is a dynamic content page in QA environment
    Given the dynamic content page configured in CMS had "1" actions
      And user is in the "Dynamic Content Page" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "main_action" button with "[CONTEXT:dynamic_content.current.content.main_action]" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311228 |
          | o2uk    | QANOV-311229 |
          | moves   | QANOV-311230 |
          | blaude  | QANOV-311231 |
          | o2de    | QANOV-531515 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can click on the main action button in a dynamic content page
    We are assuming that there is a dynamic content page in QA environment
    Given the dynamic content page configured in CMS had "1" actions
      And user is in the "Dynamic Content Page" dynamic content page
     When clicks on the "main_action" button
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dynamic Content Page" dynamic content page is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311232 |
          | o2uk    | QANOV-311233 |
          | moves   | QANOV-311234 |
          | blaude  | QANOV-311235 |
          | o2de    | QANOV-531516 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can see a dynamic content page with two actions
    We are assuming that there is a dynamic content page in QA environment
    Given the dynamic content page configured in CMS had "2" actions
      And user is in the "Dynamic Content Page" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "main_action" button with "[CONTEXT:dynamic_content.current.content.main_action]" text is displayed
      And the "secondary_action" button with "[CONTEXT:dynamic_content.current.content.secondary_action]" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311236 |
          | o2uk    | QANOV-311237 |
          | moves   | QANOV-311238 |
          | blaude  | QANOV-311239 |
          | o2de    | QANOV-531517 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can click on the secondary action button in a dynamic content page
    We are assuming that there is a dynamic content page in QA environment
    Given the dynamic content page configured in CMS had "2" actions
      And user is in the "Dynamic Content Page" dynamic content page
     When clicks on the "secondary_action" button
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dynamic Content Page" dynamic content page is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311240 |
          | o2uk    | QANOV-311241 |
          | moves   | QANOV-311242 |
          | blaude  | QANOV-311243 |
          | o2de    | QANOV-531518 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can see a dynamic content page with several sections in the order configured in CMS
    We are assuming that there is a dynamic content page in QA environment
    Given the "Feedback icon section" section is configured in CMS for "Dynamic Content Page" dynamic content page in the "1" position
      And the "Markdown section" section is configured in CMS for "Dynamic Content Page" dynamic content page in the "2" position
      And the "Image section" section is configured in CMS for "Dynamic Content Page" dynamic content page in the "3" position
      And the "Action section" section is configured in CMS for "Dynamic Content Page" dynamic content page in the "4" position
      And the "Row List section" section is configured in CMS for "Dynamic Content Page" dynamic content page in the "5" position
      And user is in the "Dynamic Content Page" dynamic content page
     Then the "feedback_icon_section" section is displayed in the "1" position
      And the "markdown_section" section is displayed in the "2" position
      And the "image_section" section is displayed in the "3" position
      And the "action_section" section is displayed in the "4" position
      And the "row_list_section" section is displayed in the "5" position

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311244 |
          | o2uk    | QANOV-311245 |
          | moves   | QANOV-311246 |
          | blaude  | QANOV-311247 |
          | o2de    | QANOV-531519 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can see a dynamic content banner
    We are assuming that there is a dynamic content page in QA environment
    Given the dynamic content banner configured in CMS has an image
      And user is in the "Dynamic Content Banner" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "banner.title" textfield with "[CONTEXT:dynamic_content.current.content.banner.title]" text is displayed
      And the "banner.action" link with "[CONTEXT:dynamic_content.current.content.banner.action]" text is displayed
      And the "banner.image" image is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311248 |
          | o2uk    | QANOV-311249 |
          | moves   | QANOV-311250 |
          | blaude  | QANOV-311251 |
          | o2de    | QANOV-531520 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can click on the action in a dynamic content banner
    We are assuming that there is a dynamic content page in QA environment
    Given the dynamic content banner configured in CMS has an image
      And user is in the "Dynamic Content Banner" dynamic content page
     When clicks on the "banner.action" link
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dynamic Content Banner" dynamic content page is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311252 |
          | o2uk    | QANOV-311253 |
          | moves   | QANOV-311254 |
          | blaude  | QANOV-311255 |
          | o2de    | QANOV-531521 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario Outline: A user can see a dynamic content empty case
    We are assuming that there is a dynamic content page in QA environment
    Given the dynamic content empty case configured in CMS has an image
      And user is in the "Dynamic Content Empty Case" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "empty_case_image" image is displayed
      And the "empty_case_title" textfield with "[CONTEXT:dynamic_content.current.content.empty_case.title]" text is displayed
      And the "empty_case_description" textfield with "[CONTEXT:dynamic_content.current.content.empty_case.description]" text is displayed
      And the "empty_case_action" button with "[CONTEXT:dynamic_content.current.content.empty_case.action]" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311256 |
          | o2uk    | QANOV-311257 |
          | moves   | QANOV-311258 |
          | blaude  | QANOV-311259 |
          | o2de    | QANOV-531522 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can click on the button in a dynamic content empty case
    We are assuming that there is a dynamic content page in QA environment
    Given the dynamic content empty case configured in CMS has an image
      And user is in the "Dynamic Content Empty Case" dynamic content page
     When clicks on the "empty_case_action" button
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dynamic Content Empty Case" dynamic content page is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311260 |
          | o2uk    | QANOV-311261 |
          | moves   | QANOV-311262 |
          | blaude  | QANOV-311263 |
          | o2de    | QANOV-531523 |

  @jira.<jira_id> @<priority> @<product> @android @automatic @ios @jira.cv.14.0 @mobile @qa
  @fixture.cms.dynamic_content.terms_and_conditions_page_with_markdown
  Scenario Outline: A user can see a dynamic content terms and conditions page with a markdown section
    We are assuming that there is a dynamic content page in QA environment
    Given the "markdown-section" section is configured in CMS for the terms and conditions page
      And user is in the "Terms And Conditions Page" terms and conditions page
      And waits until the "dynamic_content_markdown" element is visible
     Then the "[CONTEXT:dynamic_content.title]" header is displayed
      And the "dynamic_content_markdown.title" textfield with "Title" text is displayed
      And the "dynamic_content_markdown.body" textfield with "Body" text is displayed
      And clicks on the "navigation_top_bar.<button>" button

    Examples:
          | product | priority | button       | jira_id      |
          | vivobr  | sanity   | back_button  | QANOV-311264 |
          | o2uk    | sanity   | close_button | QANOV-311265 |
          | moves   | sanity   | back_button  | QANOV-311266 |
          | blaude  | smoke    | back_button  | QANOV-311267 |
          | o2de    | smoke    | back_button  | QANOV-531524 |

  @jira.<jira_id> @<product> @automatic @jira.cv.14.0 @qa @regression @web @webapp
  @fixture.cms.dynamic_content.terms_and_conditions_page_with_markdown
  Scenario Outline: A user can see a dynamic content terms and conditions page with a markdown section in webapp
    We are assuming that there is a dynamic content page in QA environment
    Given the "markdown-section" section is configured in CMS for the terms and conditions page
      And user is in the "Terms And Conditions Page" terms and conditions page
      And waits until the "dynamic_content_markdown" element is visible
     Then the browser title is "[CONTEXT:dynamic_content.title]"
      And the "dynamic_content_markdown.title" textfield with "Title" text is displayed
      And the "dynamic_content_markdown.body" textfield with "Body" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-358931 |
          | o2uk    | QANOV-358932 |
          | moves   | QANOV-358933 |
          | blaude  | QANOV-358934 |
          | o2de    | QANOV-531525 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario Outline: A user can see a dynamic content terms and conditions page with an link
    We are assuming that there is a dynamic content page in QA environment
    Given the "Action section" section is configured in CMS for "Dynamic Content Terms And Coditions" dynamic content page
      And user is in the "Dynamic Content Terms And Conditions" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "action_section.link" link with "[CONTEXT:dynamic_content.current.content.action.link]" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311268 |
          | o2uk    | QANOV-311269 |
          | moves   | QANOV-311270 |
          | blaude  | QANOV-311271 |
          | o2de    | QANOV-531526 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can click on the link in a dynamic content terms and conditions page
    We are assuming that there is a dynamic content page in QA environment
    Given the "Action section" section is configured in CMS for "Dynamic Content Terms And Coditions" dynamic content page
      And user is in the "Dynamic Content Terms And Conditions" dynamic content page
     When clicks on the "action_section.link" button
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dynamic Content Terms And Conditions" dynamic content page is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311272 |
          | o2uk    | QANOV-311273 |
          | moves   | QANOV-311274 |
          | blaude  | QANOV-311275 |
          | o2de    | QANOV-531527 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario Outline: A user can see a dynamic content terms and conditions page with an image
    We are assuming that there is a dynamic content page in QA environment
    Given the "Image section" section is configured in CMS for "Dynamic Content Terms And Coditions" dynamic content page
      And user is in the "Dynamic Content Terms And Conditions" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "image_section.image" image is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311276 |
          | o2uk    | QANOV-311277 |
          | moves   | QANOV-311278 |
          | blaude  | QANOV-311279 |
          | o2de    | QANOV-531528 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can see a dynamic content terms and conditions page with no actions
    We are assuming that there is a dynamic content page in QA environment
    Given the dynamic content page configured in CMS had "0" actions
      And user is in the "Dynamic Content Terms And Conditions" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "main_action" button is not displayed
      And the "secondary_action" button is not displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311280 |
          | o2uk    | QANOV-311281 |
          | moves   | QANOV-311282 |
          | blaude  | QANOV-311283 |
          | o2de    | QANOV-531529 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario Outline: A user can see a dynamic content terms and conditions page with one action
    We are assuming that there is a dynamic content page in QA environment
    Given the dynamic content page configured in CMS had "1" actions
      And user is in the "Dynamic Content Terms And Conditions" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "main_action" button with "[CONTEXT:dynamic_content.current.content.main_action]" text is displayed
      And the "secondary_action" button is not displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311284 |
          | o2uk    | QANOV-311285 |
          | moves   | QANOV-311286 |
          | blaude  | QANOV-311287 |
          | o2de    | QANOV-531530 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can click on the main action button in a dynamic content terms and conditions page
    We are assuming that there is a dynamic content terms and conditions page in QA environment
    Given the dynamic content page configured in CMS had "1" actions
      And user is in the "Dynamic Content Terms And Conditions" dynamic content page
     When clicks on the "main_action" button
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dynamic Content Terms And Conditions" dynamic content page is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311288 |
          | o2uk    | QANOV-311289 |
          | moves   | QANOV-311290 |
          | blaude  | QANOV-311291 |
          | o2de    | QANOV-531531 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can see a dynamic content terms and conditions page with two actions
    We are assuming that there is a dynamic content page in QA environment
    Given the dynamic content page configured in CMS had "2" actions
      And user is in the "Dynamic Content Terms And Conditions" dynamic content page
     Then the "[CONTEXT:dynamic_content.current.content.header]" header is displayed
      And the "main_action" button with "[CONTEXT:dynamic_content.current.content.main_action]" text is displayed
      And the "secondary_action" button with "[CONTEXT:dynamic_content.current.content.secondary_action]" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311292 |
          | o2uk    | QANOV-311293 |
          | moves   | QANOV-311294 |
          | blaude  | QANOV-311295 |
          | o2de    | QANOV-531532 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can click on the secondary action button in a dynamic content terms and conditions page
    We are assuming that there is a dynamic content page in QA environment
    Given the dynamic content page configured in CMS had "2" actions
      And user is in the "Dynamic Content Terms And Conditions" dynamic content page
     When clicks on the "secondary_action" button
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dynamic Content Terms And Conditions" dynamic content page is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311296 |
          | o2uk    | QANOV-311297 |
          | moves   | QANOV-311298 |
          | blaude  | QANOV-311299 |
          | o2de    | QANOV-531533 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A user can see a dynamic content terms and conditions page with several sections in the order configured in CMS
    We are assuming that there is a dynamic content page in QA environment
    Given the "Markdown section" section is configured in CMS for "Dynamic Content Page" dynamic content page in the "1" position
      And the "Image section" section is configured in CMS for "Dynamic Content Page" dynamic content page in the "2" position
      And the "Action section" section is configured in CMS for "Dynamic Content Page" dynamic content page in the "3" position
      And user is in the "Dynamic Content Terms And Conditions" dynamic content page
     Then the "markdown_section" section is displayed in the "1" position
      And the "image_section" section is displayed in the "2" position
      And the "action_section" section is displayed in the "3" position

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-311300 |
          | o2uk    | QANOV-311301 |
          | moves   | QANOV-311302 |
          | blaude  | QANOV-311303 |
          | o2de    | QANOV-531534 |
