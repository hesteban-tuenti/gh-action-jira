# -*- coding: utf-8 -*-
@jira.QANOV-388779
Feature: Device Plan Row


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.device_plan_rows
  Scenario Outline: A user can see a Device Plan Rows module configured with the default fields
    To be executed in QA
    Given the "Device Plan Rows" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Device Plan Rows" configured in CMS has only the mandatory fields filled
      And user has a "<product_type>" product
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "device_plan_rows" element is visible
     Then the "device_plan_rows" module is displayed
      And the "device_plan_rows.invoices" textfield is not displayed
      And the "device_plan_rows.more_details" textfield is not displayed
      And the "device_plan_rows.payment_history" textfield is not displayed
      And the "device_plan_rows.payment_plan" textfield is not displayed
      And the "device_plan_rows.finantial_information_icon" textfield is not displayed

    Examples:
          | product | product_type | cv   | jira_id      |
          | o2uk    | mobile_line  | 14.6 | QANOV-388780 |
          | blaude  | my_handy     | 14.6 | QANOV-420088 |
          | o2de    | my_handy     | 24.0 | QANOV-420089 |

  @jira.<jira_id> @<execution_mode> @<product> @android @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.device_plan_rows_with_manual_url_<element>
  Scenario Outline: A user can see a Device Plan Rows module with the optional "<element>" textfield configured
    To be executed in QA
    Given the "Device Plan Rows" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has a "<product_type>" product
      And the "Device Plan Rows" module configured in CMS has the "<field>" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "device_plan_rows" element is visible
     Then the "device_plan_rows" module is displayed
      And the "device_plan_rows.<element>" textfield is displayed

    Examples:
          | product | product_type | element                    | field                | cv     | execution_mode | jira_id      |
          | o2uk    | mobile_line  | invoices                   | invoicesUrl          | 14.6   | automatic      | QANOV-388781 |
          | o2uk    | mobile_line  | more_details               | moreDetailsUrl       | 14.6   | automatic      | QANOV-388782 |
          | o2uk    | mobile_line  | payment_history            | paymentHistoryUrl    | 14.6   | automatic      | QANOV-388783 |
          | o2uk    | mobile_line  | payment_plan               | paymentPlanUrl       | 14.6   | automatic      | QANOV-388784 |
          | o2uk    | mobile_line  | finantial_information_icon | paymentSectionCtaUrl | 14.6   | automatic      | QANOV-388785 |
          | blaude  | my_handy     | invoices                   | invoicesUrl          | 14.6   | automatic      | QANOV-420090 |
          | blaude  | my_handy     | more_details               | moreDetailsUrl       | Future | manual         | QANOV-420091 |
          | blaude  | my_handy     | payment_history            | paymentHistoryUrl    | 14.6   | automatic      | QANOV-420092 |
          | blaude  | my_handy     | payment_plan               | paymentPlanUrl       | 14.6   | automatic      | QANOV-420093 |
          | blaude  | my_handy     | finantial_information_icon | paymentSectionCtaUrl | 14.6   | automatic      | QANOV-420094 |
          | o2de    | my_handy     | invoices                   | invoicesUrl          | 24.0   | automatic      | QANOV-420095 |
          | o2de    | my_handy     | more_details               | moreDetailsUrl       | Future | manual         | QANOV-420096 |
          | o2de    | my_handy     | payment_history            | paymentHistoryUrl    | 24.0   | automatic      | QANOV-420097 |
          | o2de    | my_handy     | payment_plan               | paymentPlanUrl       | 24.0   | automatic      | QANOV-420098 |
          | o2de    | my_handy     | finantial_information_icon | paymentSectionCtaUrl | 24.0   | automatic      | QANOV-420099 |

  @jira.<jira_id> @<execution_mode> @<product> @jira.cv.<cv> @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.device_plan_rows_with_<url_type>_url_<element>
  Scenario Outline: A user clicks on the Device Plan Rows: user is redirected to a <url_type> url in webapp
    To be executed in QA
    Given the "Device Plan Rows" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "device_plan_rows" configured in CMS has the "<field>" field with a "<link_type>" link to "<link>" destination
      And user has a "<product_type>" product
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "device_plan_rows" element is visible
     When clicks on the "device_plan_rows.<element>" button
     Then the current URL is "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules By Product" modular page is displayed

    Examples:
          | product | product_type | element                    | field                | url_type      | link_type     | link                                                       | destination_url                                                | cv     | execution_mode | jira_id      |
          | o2uk    | mobile_line  | invoices                   | invoicesUrl          | manual        | url           | [CONTEXT:device_plan_rows.invoicesUrl.urlAddress]          | https://www.telefonica.com/es/                                 | 14.6   | automatic      | QANOV-388786 |
          | o2uk    | mobile_line  | invoices                   | invoicesUrl          | preconfigured | preconfigured | priority                                                   | https://priority.o2.co.uk/offers                               | 14.6   | automatic      | QANOV-388787 |
          | o2uk    | mobile_line  | more_details               | moreDetailsUrl       | manual        | url           | [CONTEXT:device_plan_rows.moreDetailsUrl.urlAddress]       | https://www.telefonica.com/es/                                 | 14.6   | automatic      | QANOV-388788 |
          | o2uk    | mobile_line  | more_details               | moreDetailsUrl       | preconfigured | preconfigured | priority                                                   | https://priority.o2.co.uk/offers                               | 14.6   | automatic      | QANOV-388789 |
          | o2uk    | mobile_line  | payment_history            | paymentHistoryUrl    | manual        | url           | [CONTEXT:device_plan_rows.paymentHistoryUrl.urlAddress]    | https://www.telefonica.com/es/                                 | 14.6   | automatic      | QANOV-388790 |
          | o2uk    | mobile_line  | payment_history            | paymentHistoryUrl    | preconfigured | preconfigured | priority                                                   | https://priority.o2.co.uk/offers                               | 14.6   | automatic      | QANOV-388791 |
          | o2uk    | mobile_line  | payment_plan               | paymentPlanUrl       | manual        | url           | [CONTEXT:device_plan_rows.paymentPlanUrl.urlAddress]       | https://www.telefonica.com/es/                                 | 14.6   | automatic      | QANOV-388792 |
          | o2uk    | mobile_line  | payment_plan               | paymentPlanUrl       | preconfigured | preconfigured | priority                                                   | https://priority.o2.co.uk/offers                               | 14.6   | automatic      | QANOV-388793 |
          | o2uk    | mobile_line  | finantial_information_icon | paymentSectionCtaUrl | manual        | url           | [CONTEXT:device_plan_rows.paymentSectionCtaUrl.urlAddress] | https://www.telefonica.com/es/                                 | 14.6   | automatic      | QANOV-388794 |
          | o2uk    | mobile_line  | finantial_information_icon | paymentSectionCtaUrl | preconfigured | preconfigured | priority                                                   | https://priority.o2.co.uk/offers                               | 14.6   | automatic      | QANOV-388795 |
          | blaude  | my_handy     | invoices                   | invoicesUrl          | manual        | url           | [CONTEXT:device_plan_rows.invoicesUrl.urlAddress]          | https://www.telefonica.com/es/                                 | 14.6   | automatic      | QANOV-420100 |
          | blaude  | my_handy     | invoices                   | invoicesUrl          | preconfigured | preconfigured | FAQ                                                        | https://www.blau.de/mobileapp/b2c_app_faq.html                 | 14.6   | automatic      | QANOV-420101 |
          | blaude  | my_handy     | more_details               | moreDetailsUrl       | manual        | url           | [CONTEXT:device_plan_rows.moreDetailsUrl.urlAddress]       | https://www.telefonica.com/es/                                 | Future | manual         | QANOV-420102 |
          | blaude  | my_handy     | more_details               | moreDetailsUrl       | preconfigured | preconfigured | FAQ                                                        | https://www.blau.de/mobileapp/b2c_app_faq.html                 | Future | manual         | QANOV-420103 |
          | blaude  | my_handy     | payment_history            | paymentHistoryUrl    | manual        | url           | [CONTEXT:device_plan_rows.paymentHistoryUrl.urlAddress]    | https://www.telefonica.com/es/                                 | 14.6   | automatic      | QANOV-420104 |
          | blaude  | my_handy     | payment_history            | paymentHistoryUrl    | preconfigured | preconfigured | FAQ                                                        | https://www.blau.de/mobileapp/b2c_app_faq.html                 | 14.6   | automatic      | QANOV-420105 |
          | blaude  | my_handy     | payment_plan               | paymentPlanUrl       | manual        | url           | [CONTEXT:device_plan_rows.paymentPlanUrl.urlAddress]       | https://www.telefonica.com/es/                                 | 14.6   | automatic      | QANOV-420106 |
          | blaude  | my_handy     | payment_plan               | paymentPlanUrl       | preconfigured | preconfigured | FAQ                                                        | https://www.blau.de/mobileapp/b2c_app_faq.html                 | 14.6   | automatic      | QANOV-420107 |
          | blaude  | my_handy     | finantial_information_icon | paymentSectionCtaUrl | manual        | url           | [CONTEXT:device_plan_rows.paymentSectionCtaUrl.urlAddress] | https://www.telefonica.com/es/                                 | 14.6   | automatic      | QANOV-420108 |
          | blaude  | my_handy     | finantial_information_icon | paymentSectionCtaUrl | preconfigured | preconfigured | FAQ                                                        | https://www.blau.de/mobileapp/b2c_app_faq.html                 | 14.6   | automatic      | QANOV-420109 |
          | o2de    | my_handy     | invoices                   | invoicesUrl          | manual        | url           | [CONTEXT:device_plan_rows.invoicesUrl.urlAddress]          | https://www.telefonica.com/es/                                 | 24.0   | automatic      | QANOV-420110 |
          | o2de    | my_handy     | invoices                   | invoicesUrl          | preconfigured | preconfigured | FAQ                                                        | https://angebote.webviews.o2online.de/novum/faqs/o2/index.html | 24.0   | automatic      | QANOV-420111 |
          | o2de    | my_handy     | more_details               | moreDetailsUrl       | manual        | url           | [CONTEXT:device_plan_rows.moreDetailsUrl.urlAddress]       | https://www.telefonica.com/es/                                 | Future | manual         | QANOV-420112 |
          | o2de    | my_handy     | more_details               | moreDetailsUrl       | preconfigured | preconfigured | FAQ                                                        | https://angebote.webviews.o2online.de/novum/faqs/o2/index.html | Future | manual         | QANOV-420113 |
          | o2de    | my_handy     | payment_history            | paymentHistoryUrl    | manual        | url           | [CONTEXT:device_plan_rows.paymentHistoryUrl.urlAddress]    | https://www.telefonica.com/es/                                 | 24.0   | automatic      | QANOV-420114 |
          | o2de    | my_handy     | payment_history            | paymentHistoryUrl    | preconfigured | preconfigured | FAQ                                                        | https://angebote.webviews.o2online.de/novum/faqs/o2/index.html | 24.0   | automatic      | QANOV-420115 |
          | o2de    | my_handy     | payment_plan               | paymentPlanUrl       | manual        | url           | [CONTEXT:device_plan_rows.paymentPlanUrl.urlAddress]       | https://www.telefonica.com/es/                                 | 24.0   | automatic      | QANOV-420116 |
          | o2de    | my_handy     | payment_plan               | paymentPlanUrl       | preconfigured | preconfigured | FAQ                                                        | https://angebote.webviews.o2online.de/novum/faqs/o2/index.html | 24.0   | automatic      | QANOV-420117 |
          | o2de    | my_handy     | finantial_information_icon | paymentSectionCtaUrl | manual        | url           | [CONTEXT:device_plan_rows.paymentSectionCtaUrl.urlAddress] | https://www.telefonica.com/es/                                 | 24.0   | automatic      | QANOV-420118 |
          | o2de    | my_handy     | finantial_information_icon | paymentSectionCtaUrl | preconfigured | preconfigured | FAQ                                                        | https://angebote.webviews.o2online.de/novum/faqs/o2/index.html | 24.0   | automatic      | QANOV-420119 |

  @jira.<jira_id> @<execution_mode> @android @ios @jira.cv.14.6 @mobile @o2uk @qa @regression
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.device_plan_rows_with_<url_type>_url_<element>
  Scenario Outline: A user clicks on the Device Plan Rows: user is redirected to the external webview
    To be executed in QA
    Given the "Device Plan Rows" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "device_plan_rows" configured in CMS has the "<field>" field with a "<url_type>" link to "<link>" destination
      And user has a "<product_type>" product
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "device_plan_rows" element is visible
     When clicks on the "device_plan_rows.<element>" button
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules By Product" modular page is displayed

    Examples:
          | product_type | element                    | field                | url_type      | link                                                       | execution_mode | jira_id      |
          | mobile_line  | invoices                   | invoicesUrl          | manual        | [CONTEXT:device_plan_rows.invoicesUrl.urlAddress]          | automatic      | QANOV-388796 |
          | mobile_line  | invoices                   | invoicesUrl          | preconfigured | priority                                                   | automatic      | QANOV-388797 |
          | mobile_line  | more_details               | moreDetailsUrl       | manual        | [CONTEXT:device_plan_rows.moreDetailsUrl.urlAddress]       | manual         | QANOV-388798 |
          | mobile_line  | more_details               | moreDetailsUrl       | preconfigured | priority                                                   | manual         | QANOV-388799 |
          | mobile_line  | payment_history            | paymentHistoryUrl    | manual        | [CONTEXT:device_plan_rows.paymentHistoryUrl.urlAddress]    | automatic      | QANOV-388800 |
          | mobile_line  | payment_history            | paymentHistoryUrl    | preconfigured | priority                                                   | automatic      | QANOV-388801 |
          | mobile_line  | payment_plan               | paymentPlanUrl       | manual        | [CONTEXT:device_plan_rows.paymentPlanUrl.urlAddress]       | automatic      | QANOV-388802 |
          | mobile_line  | payment_plan               | paymentPlanUrl       | preconfigured | priority                                                   | automatic      | QANOV-388803 |
          | mobile_line  | finantial_information_icon | paymentSectionCtaUrl | manual        | [CONTEXT:device_plan_rows.paymentSectionCtaUrl.urlAddress] | automatic      | QANOV-388804 |
          | mobile_line  | finantial_information_icon | paymentSectionCtaUrl | preconfigured | priority                                                   | automatic      | QANOV-388805 |

  @jira.<jira_id> @<execution_mode> @<product> @android @ios @jira.cv.<cv> @mobile @qa @regression
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.device_plan_rows_with_<url_type>_url_<element>
  Scenario Outline: A user clicks on the Device Plan Rows: user is redirected to the internal webview
    To be executed in QA
    Given the "Device Plan Rows" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "device_plan_rows" configured in CMS has the "<field>" field with a "<url_type>" link to "<link>" destination
      And user has a "my_handy" product
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "device_plan_rows" element is visible
     When clicks on the "device_plan_rows.<element>" button
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules By Product" page is displayed

    Examples:
          | product | element                    | field                | url_type        | link                                                       | cv     | execution_mode | jira_id      |
          | blaude  | invoices                   | invoicesUrl          | manual_internal | [CONTEXT:device_plan_rows.invoicesUrl.urlAddress]          | 14.6   | automatic      | QANOV-420120 |
          | blaude  | invoices                   | invoicesUrl          | preconfigured   | NAME_CHANGE                                                | 14.6   | automatic      | QANOV-420121 |
          | blaude  | more_details               | moreDetailsUrl       | manual_internal | [CONTEXT:device_plan_rows.moreDetailsUrl.urlAddress]       | Future | manual         | QANOV-420122 |
          | blaude  | more_details               | moreDetailsUrl       | preconfigured   | NAME_CHANGE                                                | Future | manual         | QANOV-420123 |
          | blaude  | payment_history            | paymentHistoryUrl    | manual_internal | [CONTEXT:device_plan_rows.paymentHistoryUrl.urlAddress]    | 14.6   | automatic      | QANOV-420124 |
          | blaude  | payment_history            | paymentHistoryUrl    | preconfigured   | NAME_CHANGE                                                | 14.6   | automatic      | QANOV-420125 |
          | blaude  | payment_plan               | paymentPlanUrl       | manual_internal | [CONTEXT:device_plan_rows.paymentPlanUrl.urlAddress]       | 14.6   | automatic      | QANOV-420126 |
          | blaude  | payment_plan               | paymentPlanUrl       | preconfigured   | NAME_CHANGE                                                | 14.6   | automatic      | QANOV-420127 |
          | blaude  | finantial_information_icon | paymentSectionCtaUrl | manual_internal | [CONTEXT:device_plan_rows.paymentSectionCtaUrl.urlAddress] | 14.6   | automatic      | QANOV-420128 |
          | blaude  | finantial_information_icon | paymentSectionCtaUrl | preconfigured   | NAME_CHANGE                                                | 14.6   | automatic      | QANOV-420129 |
          | o2de    | invoices                   | invoicesUrl          | manual_internal | [CONTEXT:device_plan_rows.invoicesUrl.urlAddress]          | 24.0   | automatic      | QANOV-420130 |
          | o2de    | invoices                   | invoicesUrl          | preconfigured   | NAME_CHANGE                                                | 24.0   | automatic      | QANOV-420131 |
          | o2de    | more_details               | moreDetailsUrl       | manual_internal | [CONTEXT:device_plan_rows.moreDetailsUrl.urlAddress]       | Future | manual         | QANOV-420132 |
          | o2de    | more_details               | moreDetailsUrl       | preconfigured   | NAME_CHANGE                                                | Future | manual         | QANOV-420133 |
          | o2de    | payment_history            | paymentHistoryUrl    | manual_internal | [CONTEXT:device_plan_rows.paymentHistoryUrl.urlAddress]    | 24.0   | automatic      | QANOV-420134 |
          | o2de    | payment_history            | paymentHistoryUrl    | preconfigured   | NAME_CHANGE                                                | 24.0   | automatic      | QANOV-420135 |
          | o2de    | payment_plan               | paymentPlanUrl       | manual_internal | [CONTEXT:device_plan_rows.paymentPlanUrl.urlAddress]       | 24.0   | automatic      | QANOV-420136 |
          | o2de    | payment_plan               | paymentPlanUrl       | preconfigured   | NAME_CHANGE                                                | 24.0   | automatic      | QANOV-420137 |
          | o2de    | finantial_information_icon | paymentSectionCtaUrl | manual_internal | [CONTEXT:device_plan_rows.paymentSectionCtaUrl.urlAddress] | 24.0   | automatic      | QANOV-420138 |
          | o2de    | finantial_information_icon | paymentSectionCtaUrl | preconfigured   | NAME_CHANGE                                                | 24.0   | automatic      | QANOV-420139 |
