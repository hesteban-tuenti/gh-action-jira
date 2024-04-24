# -*- coding: utf-8 -*-
@jira.QANOV-2713
Feature: Consumption

  Actions Before each Scenario:
    Given user has a "mobile_line" product


  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-174884 @mobile @sanity @vivobr @old_app
  Scenario Outline: A <account_type> user can access to the data consumption screen of their mobile line
    If the user has any 'Internet pra usar só em alguns apps' bundle, the 'Internet pra usar só em alguns apps'
    module will also be displayed in the 'Mobile Line Consumption' page.
    For prepay users, a 'MAIS DETALHES SOBRE O QUE USEI' section is also displayed.
    User in QA: qavivo-02, qavivo-03, qavivo-04, qavivo-05
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "data" tab is selected
      And waits until the "bundles_title" element is visible
      And the "bundles_title" textfield with "INTERNET PRA USAR COMO QUISER" text is displayed
      And the "como_quiser_bundles_list.bundle_list" list is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "<current_page>" page is displayed

    @automatic @qa @webapp
    Examples:
          | cv   | account_type | current_page          | cms_page | parent_test_plan        | ber | jira_id    |
          | 12.0 | convergente  | Mobile Line Dashboard | mobile   | QANOV-21791:QANOV-24947 | ber | QANOV-2726 |

    @automatic @live @next @qa @webapp
    Examples:
          | cv    | account_type | current_page          | cms_page  | parent_test_plan        | ber | jira_id    |
          | 11.12 | beatrix      | Account               | dashboard | QANOV-21949:QANOV-24947 | ber | QANOV-2725 |
          | 11.12 | multivivo    | Mobile Line Dashboard | mobile    | QANOV-21949:QANOV-24947 |     | QANOV-2728 |

    @manual
    Examples:
          | cv   | account_type  | current_page | cms_page  | parent_test_plan         | ber | jira_id      |
          | 14.5 | legacy prepay | Account      | dashboard | QANOV-132105:QANOV-24947 | ber | QANOV-145204 |
          | 14.5 | jeri prepay   | Account      | dashboard | QANOV-132105             |     | QANOV-272629 |
          | 13.5 | jeri control  | Account      | dashboard | QANOV-200803             |     | QANOV-202295 |
          | 13.5 | control_n     | Account      | dashboard | QANOV-200803             |     | QANOV-202296 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.Future @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-174884 @mobile @sanity @vivobr @old_app
  Scenario Outline: A <account_type> user can access to the data consumption screen of their mobile line
    If the user has any 'Internet pra usar só em alguns apps' bundle, the 'Internet pra usar só em alguns apps'
    module will also be displayed in the 'Mobile Line Consumption' page.
    For prepay users, a 'MAIS DETALHES SOBRE O QUE USEI' section is also displayed.
    User in QA: qavivo-02, qavivo-03, qavivo-04, qavivo-05
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the "TBD-consumptions_history" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "data" tab is selected
      And the "bundles_title" textfield with "INTERNET PRA USAR COMO QUISER" text is displayed
      And the "como_quiser_bundles_list" list is displayed
      And the "consumptions_history" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<current_page>" page is displayed

    @manual @qa
    Examples:
          | account_type | current_page          | cms_page | parent_test_plan                     | ber | jira_id      |
          | convergente  | Mobile Line Dashboard | mobile   | QANOV-21791:QANOV-24947:QANOV-377185 | ber | QANOV-243624 |

    @live @manual @next @qa
    Examples:
          | account_type | current_page          | cms_page  | parent_test_plan                     | ber | jira_id      |
          | beatrix      | Account               | dashboard | QANOV-21949:QANOV-24947:QANOV-377185 | ber | QANOV-243625 |
          | multivivo    | Mobile Line Dashboard | mobile    | QANOV-21949:QANOV-24947:QANOV-377185 |     | QANOV-243626 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-377185 @mobile @sanity @vivobr
  @old_app
  Scenario Outline: A <account_type> user can access to the consumptions_history from the data tab
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "TBD-consumptions_history" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
      And the "Mobile Line Consumption" page is displayed
      And the "data" tab is selected
      And the "consumptions_history" module is displayed
      And clicks on the "consumptions_history" module
     Then the internal webview with "Histórico de Consumo" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<current_page>" page is displayed

    @manual @qa
    Examples:
          | account_type | current_page          | cms_page | ber | jira_id      |
          | convergente  | Mobile Line Dashboard | mobile   | ber | QANOV-243628 |

    @live @manual @next @qa
    Examples:
          | account_type | current_page          | cms_page  | ber | jira_id      |
          | beatrix      | Account               | dashboard | ber | QANOV-243629 |
          | multivivo    | Mobile Line Dashboard | mobile    |     | QANOV-243630 |

    @manual
    Examples:
          | account_type  | current_page | cms_page  | ber | jira_id      |
          | legacy prepay | Account      | dashboard | ber | QANOV-243631 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-175373 @mobile @smoke @vivobr @old_app
  Scenario Outline: A <account_type> user can access to the Minutes consumption screen of their mobile line
    For prepay users, a 'MAIS DETALHES SOBRE O QUE USEI' section is also displayed.
    User in QA: qavivo-02, qavivo-03, qavivo-04, qavivo-05
    Given user has a "<account_type>" account type
      And user has "minutes" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
      And the "Mobile Line Consumption" page is displayed
      And clicks on the "minutes" tab
     Then the "minutes" tab is selected
      And waits until the "bundles_title" element is visible
      And the "bundles_title" textfield with "LIGAÇOES" text is displayed
      And the "minutes_bundles_list.bundle_list" list is displayed
      And the "unlimited_apps" module is not displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "<current_page>" page is displayed

    @automatic @qa @webapp
    Examples:
          | cv   | account_type | current_page          | cms_page | parent_test_plan        | ber | jira_id      |
          | 12.0 | convergente  | Mobile Line Dashboard | mobile   | QANOV-21791:QANOV-24947 | ber | QANOV-339928 |

    @automatic @live @next @qa @webapp
    Examples:
          | cv    | account_type | current_page          | cms_page  | parent_test_plan        | ber | jira_id      |
          | 11.12 | beatrix      | Account               | dashboard | QANOV-21949:QANOV-24947 | ber | QANOV-339929 |
          | 11.12 | multivivo    | Mobile Line Dashboard | mobile    | QANOV-21949:QANOV-24947 |     | QANOV-339930 |

    @manual
    Examples:
          | cv   | account_type  | current_page | cms_page  | parent_test_plan         | ber | jira_id      |
          | 14.5 | legacy prepay | Account      | dashboard | QANOV-132105:QANOV-24947 | ber | QANOV-145205 |
          | 14.5 | jeri prepay   | Account      | dashboard | QANOV-132105             |     | QANOV-272631 |
          | 13.5 | jeri control  | Account      | dashboard | QANOV-200803             |     | QANOV-202297 |
          | 13.5 | control_n     | Account      | dashboard | QANOV-200803             |     | QANOV-202298 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-377185
  @jira.link.relates_to.NOV-175373 @mobile @smoke @vivobr @old_app
  Scenario Outline: A <account_type> user can access to the Minutes consumption screen of their mobile line
    For prepay users, a 'MAIS DETALHES SOBRE O QUE USEI' section is also displayed.
    User in QA: qavivo-02, qavivo-03, qavivo-04, qavivo-05
    Given user has a "<account_type>" account type
      And user has "minutes" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user has the "TBD-consumptions_history" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
      And the "Mobile Line Consumption" page is displayed
      And clicks on the "minutes" tab
     Then the "minutes" tab is selected
      And the "bundles_title" textfield with "LIGAÇOES" text is displayed
      And the "minutes_bundles_list" list is displayed
      And the "unlimited_apps" module is not displayed
      And the "consumptions_history" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<current_page>" page is displayed

    @manual @qa
    Examples:
          | account_type | current_page          | cms_page | parent_test_plan                     | ber | jira_id      |
          | convergente  | Mobile Line Dashboard | mobile   | QANOV-21791:QANOV-24947:QANOV-377185 | ber | QANOV-243632 |

    @live @manual @next @qa
    Examples:
          | account_type | current_page          | cms_page  | parent_test_plan                     | ber | jira_id      |
          | beatrix      | Account               | dashboard | QANOV-21949:QANOV-24947:QANOV-377185 | ber | QANOV-243633 |
          | multivivo    | Mobile Line Dashboard | mobile    | QANOV-21949:QANOV-24947:QANOV-377185 |     | QANOV-243634 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-377185 @mobile @sanity @vivobr
  @old_app
  Scenario Outline: A <account_type> user can access to the consumptions_history from minutes tab
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "TBD-consumptions_history" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
      And the "Mobile Line Consumption" page is displayed
      And clicks on the "minutes" tab
      And the "minutes" tab is selected
      And the "consumptions_history" module is displayed
      And clicks on the "consumptions_history" module
     Then the internal webview with "Histórico de Consumo" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<current_page>" page is displayed

    @manual @qa
    Examples:
          | account_type | current_page          | cms_page | ber | jira_id      |
          | convergente  | Mobile Line Dashboard | mobile   | ber | QANOV-243636 |

    @live @manual @next @qa
    Examples:
          | account_type | current_page          | cms_page  | ber | jira_id      |
          | beatrix      | Account               | dashboard | ber | QANOV-243637 |
          | multivivo    | Mobile Line Dashboard | mobile    |     | QANOV-243638 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-175375 @mobile @smoke @vivobr @old_app
  Scenario Outline: A <account_type> user can access to the SMS consumption screen of their mobile line
    For prepay users, a 'MAIS DETALHES SOBRE O QUE USEI' section is also displayed.
    User in QA: qavivo-02, qavivo-03, qavivo-05
    Given user has a "<account_type>" account type
      And user has "messages" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
      And the "Mobile Line Consumption" page is displayed
      And clicks on the "sms" tab
     Then the "sms" tab is selected
      And waits until the "bundles_title" element is visible
      And the "bundles_title" textfield with "SMS DO MEU CELULAR" text is displayed
      And the "sms_bundles_list.bundle_list" list is displayed
      And the "unlimited_apps" module is not displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "<current_page>" page is displayed

    @automatic @qa @webapp
    Examples:
          | cv   | account_type | current_page          | cms_page | parent_test_plan        | ber | jira_id    |
          | 12.0 | convergente  | Mobile Line Dashboard | mobile   | QANOV-21791:QANOV-24947 | ber | QANOV-2805 |

    @automatic @live @next @qa @webapp
    Examples:
          | cv    | account_type | current_page          | cms_page  | parent_test_plan        | ber | jira_id    |
          | 11.12 | beatrix      | Account               | dashboard | QANOV-21949:QANOV-24947 | ber | QANOV-2803 |
          | 11.12 | multivivo    | Mobile Line Dashboard | mobile    | QANOV-21949:QANOV-24947 |     | QANOV-2806 |

    @manual
    Examples:
          | cv   | account_type  | current_page | cms_page  | parent_test_plan         | ber | jira_id      |
          | 14.5 | legacy prepay | Account      | dashboard | QANOV-132105:QANOV-24947 | ber | QANOV-145206 |
          | 14.5 | jeri prepay   | Account      | dashboard | QANOV-132105             |     | QANOV-272633 |
          | 13.5 | jeri control  | Account      | dashboard | QANOV-200803             |     | QANOV-202299 |
          | 13.5 | control_n     | Account      | dashboard | QANOV-200803             |     | QANOV-202300 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.Future @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-175375 @mobile @smoke @vivobr @old_app
  Scenario Outline: A <account_type> user can access to the SMS consumption screen of their mobile line
    For prepay users, a 'MAIS DETALHES SOBRE O QUE USEI' section is also displayed.
    User in QA: qavivo-02, qavivo-03, qavivo-05
    Given user has a "<account_type>" account type
      And user has "messages" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user has the "TBD-consumptions_history" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
      And the "Mobile Line Consumption" page is displayed
      And clicks on the "sms" tab
     Then the "sms" tab is selected
      And the "bundles_title" textfield with "SMS DO MEU CELULAR" text is displayed
      And the "sms_bundles_list" list is displayed
      And the "unlimited_apps" module is not displayed
      And the "consumptions_history" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<current_page>" page is displayed

    @manual @qa
    Examples:
          | account_type | current_page          | cms_page | parent_test_plan                     | ber | jira_id      |
          | convergente  | Mobile Line Dashboard | mobile   | QANOV-21791:QANOV-24947:QANOV-377185 | ber | QANOV-243640 |

    @live @manual @next @qa
    Examples:
          | account_type | current_page          | cms_page  | parent_test_plan                     | ber | jira_id      |
          | beatrix      | Account               | dashboard | QANOV-21949:QANOV-24947:QANOV-377185 | ber | QANOV-243641 |
          | multivivo    | Mobile Line Dashboard | mobile    | QANOV-21949:QANOV-24947:QANOV-377185 |     | QANOV-243642 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-377185 @mobile @sanity @vivobr
  @old_app
  Scenario Outline: A <account_type> user can access to the consumptions_history from sms tab
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "TBD-consumptions_history" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
      And the "Mobile Line Consumption" page is displayed
      And clicks on the "sms" tab
      And the "sms" tab is selected
      And the "consumptions_history" module is displayed
      And clicks on the "consumptions_history" module
     Then the internal webview with "Histórico de Consumo" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<current_page>" page is displayed

    @manual @qa
    Examples:
          | account_type | current_page          | cms_page | ber | jira_id      |
          | convergente  | Mobile Line Dashboard | mobile   | ber | QANOV-243644 |

    @live @manual @next @qa
    Examples:
          | account_type | current_page          | cms_page  | ber | jira_id      |
          | beatrix      | Account               | dashboard | ber | QANOV-243645 |
          | multivivo    | Mobile Line Dashboard | mobile    |     | QANOV-243646 |

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.ACCOUNT-12177 @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-175379 @mobile
  @vivobr @old_app
  Scenario Outline: A <account_type> user can see the billing cycle and the days until renovation at the top of the consumption screen
    User in QA: qavivo-02, qavivo-03, qavivo-05
    Given user has a "<account_type>" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
      And the "Mobile Line Consumption" page is displayed
      And the "Consumo do celular" header is displayed
      And clicks on the "<allowance_tab>" tab
     Then the "<allowance_tab>" tab is selected
      And the "header.pretitle" textfield with the "Minha franquia renova em \d+ (dia|dias|horas|hora)" format is displayed
      And the "header.title" textfield with the "Faturamento \d\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez) - \d\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "<current_page>" page is displayed

    @automatic @qa @webapp
    Examples:
          | cv   | account_type | current_page          | cms_page | allowance_type | allowance_tab | test_priority | parent_test_plan | depends_on | jira_id      |
          | 12.0 | convergente  | Mobile Line Dashboard | mobile   | data           | data          | regression    | QANOV-21791      | QANOV-2726 | QANOV-339931 |
          | 12.0 | convergente  | Mobile Line Dashboard | mobile   | minutes        | minutes       | smoke         | QANOV-21791      |            | QANOV-339932 |
          | 12.0 | convergente  | Mobile Line Dashboard | mobile   | messages       | sms           | regression    | QANOV-21791      | QANOV-2805 | QANOV-2873   |

    @automatic @live @next @qa @webapp
    Examples:
          | cv    | account_type | current_page          | cms_page  | allowance_type | allowance_tab | test_priority | parent_test_plan | depends_on | jira_id      |
          | 11.12 | beatrix      | Account               | dashboard | data           | data          | smoke         | QANOV-21949      | QANOV-2725 | QANOV-339933 |
          | 11.12 | beatrix      | Account               | dashboard | minutes        | minutes       | regression    | QANOV-21949      |            | QANOV-339934 |
          | 11.12 | beatrix      | Account               | dashboard | messages       | sms           | regression    | QANOV-21949      | QANOV-2803 | QANOV-2866   |
          | 11.12 | multivivo    | Mobile Line Dashboard | mobile    | data           | data          | regression    | QANOV-21949      | QANOV-2728 | QANOV-339935 |
          | 11.12 | multivivo    | Mobile Line Dashboard | mobile    | minutes        | minutes       | regression    | QANOV-21949      |            | QANOV-339936 |
          | 11.12 | multivivo    | Mobile Line Dashboard | mobile    | messages       | sms           | regression    | QANOV-21949      | QANOV-2806 | QANOV-2870   |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @regression @vivobr @old_app
  Scenario Outline: A <account_type> user can see the data, minutes and sms tabs in the consumption screen
    internal_checkpoint="If the user has any 'Internet pra usar só em alguns apps' bundle, the 'Internet pra usar só em
    alguns apps' module will also be displayed in the 'Mobile Line Consumption' page."
    commented_tags="@depends_on.NOV-164088"
    User in QA: qavivo-02, qavivo-03, qavivo-04, qavivo-05
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "data" tab with "Internet" text is displayed
      And the "minutes" tab with "Minutos" text is displayed
      And the "sms" tab with "SMS" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "<current_page>" page is displayed

    @automatic @qa @webapp
    Examples:
          | cv   | account_type | current_page          | cms_page | parent_test_plan | depends_on | jira_id      |
          | 12.0 | convergente  | Mobile Line Dashboard | mobile   | QANOV-21791      | QANOV-2726 | QANOV-339937 |

    @automatic @live @next @qa @webapp
    Examples:
          | cv    | account_type | current_page          | cms_page  | parent_test_plan | depends_on | jira_id      |
          | 11.12 | beatrix      | Account               | dashboard | QANOV-21949      | QANOV-2725 | QANOV-339938 |
          | 11.12 | multivivo    | Mobile Line Dashboard | mobile    | QANOV-21949      | QANOV-2728 | QANOV-339939 |

    @manual
    Examples:
          | cv   | account_type  | current_page | cms_page  | parent_test_plan | depends_on   | jira_id      |
          | 14.5 | legacy prepay | Account      | dashboard | QANOV-132105     | QANOV-145204 | QANOV-145213 |
          | 14.5 | jeri prepay   | Account      | dashboard | QANOV-132105     | QANOV-145204 | QANOV-272635 |
          | 13.5 | jeri control  | Account      | dashboard | QANOV-200803     | QANOV-202295 | QANOV-202324 |
          | 13.5 | control_n     | Account      | dashboard | QANOV-200803     | QANOV-202296 | QANOV-202325 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-175494 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: A <account_type> user can see the "Internet pra usar como quiser" module in the mobile consumption screen when user has no additional packages/bonus
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And user has purchased "none" data bundles
      And user has purchased "none" data bonus
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "Mobile Line Consumption" page
     When clicks on the "data" tab
     Then the "como_quiser_bundles_title" textfield with "INTERNET PRA USAR COMO QUISER" text is displayed
      And the "como_quiser_bundles_list" list is displayed
      And the "allowance" element in the "como_quiser_bundles_list" list has the "icon" field
      And the "allowance" element in the "como_quiser_bundles_list" list has the "quota" textfield with the "Já usei \d+ (MB|GB) de (\d+ (MB|GB)|ilimitado)" format
      And the "allowance" element in the "como_quiser_bundles_list" list has the "name" textfield with "Meu Plano" text
      And the "allowance" element in the "como_quiser_bundles_list" list has the "date" textfield with the "(Renova|Válido até) em dd/mmm" format
      And no "additional_bundle" element in the "como_quiser_bundles_list" list is displayed

    Examples:
          | cv    | account_type | cms_page  | parent_test_plan | depends_on   | jira_id      |
          | 11.12 | beatrix      | dashboard | QANOV-21949      | QANOV-2725   | QANOV-2733   |
          | 11.12 | multivivo    | mobile    | QANOV-21949      | QANOV-2726   | QANOV-2735   |
          | 12.0  | convergente  | mobile    | QANOV-21791      | QANOV-2728   | QANOV-2734   |
          | 13.5  | jeri control | dashboard | QANOV-200803     | QANOV-202295 | QANOV-202331 |
          | 13.5  | control_n    | dashboard | QANOV-200803     | QANOV-202296 | QANOV-202332 |

  @jira.<jira_id> @android @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-132105 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: A prepay user can see the "<plan_promotion>" module in the mobile consumption screen when user has no additional packages/bonus
    Given user has any "legacy prepay;jeri prepay" account types
      And user has "data" allowances in the "mobile_line" product
      And user has activated "<plan_promotion>" data bundles
      And user has purchased "none" data bonus
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "Mobile Line Consumption" page
     When clicks on the "data" tab
     Then the "como_quiser_bundles_title" textfield with "INTERNET PRA USAR COMO QUISER" text is displayed
      And the "como_quiser_bundles_list" list is displayed
      And the "allowance" element in the "como_quiser_bundles_list" list has the "icon" field
      And the "allowance" element in the "como_quiser_bundles_list" list has the "quota" textfield with the "Já usei \d+ (MB|GB) de (\d+ (MB|GB)|ilimitado)" format
      And the "allowance" element in the "como_quiser_bundles_list" list has the "name" field
      And the "allowance" element in the "como_quiser_bundles_list" list has the "date" textfield with the "Válido até dd/mmm" format
      And no "additional_bundle" element in the "como_quiser_bundles_list" list is displayed

    Examples:
          | plan_promotion  | jira_id      |
          | vivo_pre_turbo  | QANOV-214355 |
          | vivo_pre_diario | QANOV-214356 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-175494 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: A <account_type> user can see the "Internet pra usar como quiser" module in the mobile consumption screen when user has additional internet packages/bonus
    internal_checkpoint="The 'date' element for the packages and bonus list can be the renewal or the due date
    (the bonus can only have due date, so this will be the one displayed for them)"
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And user has purchased "como_quiser" data bundles
      And user has purchased "any" data bonus
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "Mobile Line Consumption" page
     When clicks on the "data" tab
     Then the "como_quiser_bundles_title" textfield with "INTERNET PRA USAR COMO QUISER" text is displayed
      And the "como_quiser_bundles_list" list is displayed
      And the "allowance" element in the "como_quiser_bundles_list" list has the "icon" field
      And the "allowance" element in the "como_quiser_bundles_list" list has the "data_quota" textfield with the "Já usei \d+ (MB|GB) de (\d+ (MB|GB)|ilimitado)" format
      And the "allowance" element in the "como_quiser_bundles_list" list has the "name" textfield with "Meu Plano" text
      And the "allowance" element in the "como_quiser_bundles_list" list has the "date" textfield with the "(Renova|Válido até) em dd/mmm" format
      And the "additional_bundle" element in the "como_quiser_bundles_list" list has the "icon" field
      And the "additional_bundle" element in the "como_quiser_bundles_list" list has the "quota" textfield with the "Já usei \d+ (MB|GB) de (\d+ (MB|GB)|ilimitado)" format
      And the "additional_bundle" element in the "como_quiser_bundles_list" list has the "name" field
      And the "additional_bundle" element in the "como_quiser_bundles_list" list has the "date" field
      And the "como_quiser_bundles_list" is ordered by the "in use;not used;totally consumed" priorities

    Examples:
          | cv    | account_type | cms_page  | parent_test_plan | depends_on   | jira_id      |
          | 11.12 | beatrix      | dashboard | QANOV-21949      | QANOV-2725   | QANOV-2743   |
          | 11.12 | multivivo    | mobile    | QANOV-21949      | QANOV-2726   | QANOV-2746   |
          | 12.0  | convergente  | mobile    | QANOV-21791      | QANOV-2728   | QANOV-2744   |
          | 13.5  | jeri control | dashboard | QANOV-200803     | QANOV-202295 | QANOV-202338 |
          | 13.5  | control_n    | dashboard | QANOV-200803     | QANOV-202296 | QANOV-202340 |

  @jira.<jira_id> @android @ios @jira.cv.14.5 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-132105
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A prepay user can see the "<plan_promotion>" module in the mobile consumption screen when user has additional internet packages/bonus
    Given user has any "legacy prepay;jeri prepay" account types
      And user has "data" allowances in the "mobile_line" product
      And user has activated "<plan_promotion>" data bundles
      And user has purchased "any" data bonus
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "Mobile Line Consumption" page
     When clicks on the "data" tab
     Then the "como_quiser_bundles_title" textfield with "INTERNET PRA USAR COMO QUISER" text is displayed
      And the "como_quiser_bundles_list" list is displayed
      And the "allowance" element in the "como_quiser_bundles_list" list has the "icon" field
      And the "allowance" element in the "como_quiser_bundles_list" list has the "data_quota" textfield with the "Já usei \d+ (MB|GB) de (\d+ (MB|GB)|ilimitado)" format
      And the "allowance" element in the "como_quiser_bundles_list" list has the "name" field
      And the "allowance" element in the "como_quiser_bundles_list" list has the "date" textfield with the "Válido até em dd/mmm" format
      And the "additional_bundle" element in the "como_quiser_bundles_list" list has the "icon" field
      And the "additional_bundle" element in the "como_quiser_bundles_list" list has the "quota" textfield with the "Já usei \d+ (MB|GB) de (\d+ (MB|GB)|ilimitado)" format
      And the "additional_bundle" element in the "como_quiser_bundles_list" list has the "name" field
      And the "additional_bundle" element in the "como_quiser_bundles_list" list has the "date" field
      And the "como_quiser_bundles_list" is ordered by the "in use;not used;totally consumed" priorities

    Examples:
          | plan_promotion  | depends_on | jira_id      |
          | vivo_pre_turbo  | QANOV-2725 | QANOV-145215 |
          | vivo_pre_diario | QANOV-2726 | QANOV-145214 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-175498 @manual @mobile @regression @vivobr
  Scenario Outline: A <account_type> user without "Internet pra usar em apps axclusivos" bundles cannot see the respective section in the mobile consumption screen
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And user has not purchased "apps_use" data bundles
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "Mobile Line Consumption" page
     When clicks on the "data" tab
     Then the "data" tab is selected
      And the "apps_use_bundles" module is not displayed

    Examples:
          | cv    | account_type | cms_page  | parent_test_plan | depends_on   | jira_id      |
          | 11.12 | beatrix      | dashboard | QANOV-21949      | QANOV-2725   | QANOV-2740   |
          | 11.12 | multivivo    | mobile    | QANOV-21949      | QANOV-2726   | QANOV-2742   |
          | 12.0  | convergente  | mobile    | QANOV-21791      | QANOV-2728   | QANOV-2741   |
          | 13.5  | jeri control | dashboard | QANOV-200803     | QANOV-202295 | QANOV-202346 |
          | 13.5  | control_n    | dashboard | QANOV-200803     | QANOV-202296 | QANOV-202347 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-175495 @manual @mobile @smoke @vivobr
  Scenario Outline: A <account_type> user with "Internet pra usar em apps axclusivos" bundles can see the respective section in the mobile consumption screen
    The 'Internet pra usar em apps axclusivos' bundles are: 'Double Play', 'Weekend Pack', 'Night Pack',
    'Social Network Pack', ...
    Beatrix (Live): CPF 05883800831
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And user has purchased "apps_use" data bundles
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "Mobile Line Consumption" page
     When clicks on the "data" tab
     Then the "apps_use_bundles_title" textfield with "Internet pra usar em apps axclusivos" text is displayed
      And the "apps_use_bundles_list" list is displayed
      And the "additional_bundle" element in the "apps_use_bundles_list" list has the "icon" field
      And the "additional_bundle" element in the "apps_use_bundles_list" has the "quota" textfield with the "Já usei \d+ (MB|GB) de (\d+ (MB|GB)|ilimitado)" format
      And the "additional_bundle" element in the "apps_use_bundles_list" has the "name" field
      And the "additional_bundle" element in the "apps_use_bundles_list" has the "date" field
      And the "apps_use_bundles_list" list is ordered by the "in use;not used;totally consumed" priorities

    Examples:
          | cv    | account_type | cms_page  | parent_test_plan | depends_on | jira_id    |
          | 11.12 | beatrix      | dashboard | QANOV-21949      | QANOV-2725 | QANOV-2736 |
          | 11.12 | multivivo    | mobile    | QANOV-21949      | QANOV-2726 | QANOV-2738 |
          | 12.0  | convergente  | mobile    | QANOV-21791      | QANOV-2728 | QANOV-2737 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.ACCOUNT-10410
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-176255 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: A <account_type> user can see the "Minutos do meu celular" module in the mobile consumption screen when user has no additional voice packages
    Given user has a "<account_type>" account type
      And user has "minutes" allowances in the "mobile_line" product
      And user has purchased "none" minutes bundles
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user is in the "Mobile Line Consumption" page
     When clicks on the "minutes" tab
     Then the "minutes_bundles_title" textfield with "LIGAÇOES" text is displayed
      And the "minutes_bundles_list" list is displayed
      And each element in the "minutes_bundles_list" list has the "icon" textfield
      And each element in the "minutes_bundles_list" list has the "quota" textfield with the "Já usei \d+ min de (\d+ min|ilimitado)" format
      And each element in the "minutes_bundles_list" list has the "name" textfield
      And each element in the "minutes_bundles_list" list has the "date" textfield with the "(Renova|Válido até) em dd/mmm" format
      And no "additional_bundle" element in the "minutes_bundles_list" list is displayed

    Examples:
          | cv    | account_type | cms_page  | parent_test_plan | depends_on   | jira_id      |
          | 11.12 | beatrix      | dashboard | QANOV-21949      |              | QANOV-2775   |
          | 11.12 | multivivo    | mobile    | QANOV-21949      |              | QANOV-2778   |
          | 12.0  | convergente  | mobile    | QANOV-21791      |              | QANOV-2776   |
          | 13.5  | jeri control | dashboard | QANOV-200803     | QANOV-202297 | QANOV-202350 |
          | 13.5  | control_n    | dashboard | QANOV-200803     | QANOV-202298 | QANOV-202351 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.ACCOUNT-10410
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-176255 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: A <account_type> user can see the "Minutos do meu celular" module in the mobile consumption screen when user has no additional voice packages
    Given user has a "<account_type>" account type
      And user has "minutes" allowances in the "mobile_line" product
      And user has purchased "none" minutes bundles
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user is in the "Mobile Line Consumption" page
     When clicks on the "minutes" tab
     Then the "minutes_bundles_title" textfield with "LIGAÇOES" text is displayed
      And the "minutes_bundles_list" list is displayed
      And each element in the "minutes_bundles_list" list has the "icon" textfield
      And each element in the "minutes_bundles_list" list has the "quota" textfield with the "Já usei \d+ min de (\d+ min|ilimitado)" format
      And each element in the "minutes_bundles_list" list has the "name" textfield
      And each element in the "minutes_bundles_list" list has the "date" textfield with the "Válido até dd/mmm" format
      And no "additional_bundle" element in the "minutes_bundles_list" list is displayed

    Examples:
          | cv   | account_type  | cms_page  | parent_test_plan | depends_on   | jira_id      |
          | 14.5 | legacy prepay | dashboard | QANOV-132105     | QANOV-145205 | QANOV-145219 |
          | 14.5 | jeri prepay   | dashboard | QANOV-132105     | QANOV-145205 | QANOV-272636 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.ACCOUNT-10410
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-176255 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: A <account_type> user can see the "Minutos do meu celular" module in the mobile consumption screen when user has additional voice packages
    internal_checkpoint="The como_quiser_bundles_list includes the plan's allowance and any bonus package purchased that's not expired"
    Given user has a "<account_type>" account type
      And user has "minutes" allowances in the "mobile_line" product
      And user has purchased "any" minutes bundles
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user is in the "Mobile Line Consumption" page
     When clicks on the "minutes" tab
     Then the "minutes_bundles_title" textfield with "LIGAÇOES" text is displayed
      And the "minutes_bundles_list" list is displayed
      And each element in the "minutes_bundles_list" list has the "icon" textfield
      And each element in the "minutes_bundles_list" list has the "quota" textfield with the "Já usei \d+ min de (\d+ min|ilimitado)" format
      And each element in the "minutes_bundles_list" list has the "name" textfield
      And each element in the "minutes_bundles_list" list has the "date" textfield with the "(Renova|Válido até) em dd/mmm" format
      And the "minutes_bundles_list" list is ordered by the "in use;not used;totally consumed" priorities

    Examples:
          | cv    | account_type | cms_page  | parent_test_plan | depends_on   | jira_id      |
          | 11.12 | beatrix      | dashboard | QANOV-21949      |              | QANOV-2771   |
          | 11.12 | multivivo    | mobile    | QANOV-21949      |              | QANOV-2774   |
          | 12.0  | convergente  | mobile    | QANOV-21791      |              | QANOV-2773   |
          | 13.5  | jeri control | dashboard | QANOV-200803     | QANOV-202297 | QANOV-202352 |
          | 13.5  | control_n    | dashboard | QANOV-200803     | QANOV-202298 | QANOV-202353 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.ACCOUNT-10410
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-176255 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: A <account_type> user can see the "Minutos do meu celular" module in the mobile consumption screen when user has additional voice packages
    internal_checkpoint="The como_quiser_bundles_list includes the plan's allowance and any bonus package purchased that's not expired"
    Given user has a "<account_type>" account type
      And user has "minutes" allowances in the "mobile_line" product
      And user has purchased "any" minutes bundles
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user is in the "Mobile Line Consumption" page
     When clicks on the "minutes" tab
     Then the "minutes_bundles_title" textfield with "LIGAÇOES" text is displayed
      And the "minutes_bundles_list" list is displayed
      And each element in the "minutes_bundles_list" list has the "icon" textfield
      And each element in the "minutes_bundles_list" list has the "quota" textfield with the "Já usei \d+ min de (\d+ min|ilimitado)" format
      And each element in the "minutes_bundles_list" list has the "name" textfield
      And each element in the "minutes_bundles_list" list has the "date" textfield with the "Válido até dd/mmm" format
      And the "minutes_bundles_list" list is ordered by the "in use;not used;totally consumed" priorities

    Examples:
          | cv   | account_type  | cms_page  | parent_test_plan | depends_on   | jira_id      |
          | 14.5 | legacy prepay | dashboard | QANOV-132105     | QANOV-145205 | QANOV-145220 |
          | 14.5 | jeri prepay   | dashboard | QANOV-132105     | QANOV-145205 | QANOV-272637 |

  @jira.<jira_id> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-185544 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A <account_type> user can see the "SMS do meu celular" module in the mobile consumption screen
    internal_checkpoint="Vivo doesn’t have any more SMS packs and bonus. It will be only one allowance and generally
    is always unlimited."
    User in QA: qavivo-02, qavivo-03, qavivo-05
    Given user has a "<account_type>" account type
      And user has "messages" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
      And the "Mobile Line Consumption" page is displayed
      And clicks on the "sms" tab
     Then the "bundles_title" textfield with "SMS DO MEU CELULAR" text is displayed
      And the "sms_bundles_list.bundle_list" list is displayed
      And each element in the "sms_bundles_list.bundle_list" list has the "icon" field
      And each element in the "sms_bundles_list.bundle_list" list has the "title" textfield with the "Já usei \d+ SMS de ilimitado|Já usei \d+ SMS de \d+ SMS" format
      And each element in the "sms_bundles_list.bundle_list" list has the "subtitle" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "<current_page>" page is displayed

    @android
    Examples:
          | cv    | account_type | current_page          | cms_page  | parent_test_plan | depends_on | jira_id    |
          | 12.0  | convergente  | Mobile Line Dashboard | mobile    | QANOV-21791      | QANOV-2805 | QANOV-2812 |
          | 11.12 | beatrix      | Account               | dashboard | QANOV-21949      | QANOV-2803 | QANOV-2811 |
          | 11.12 | multivivo    | Mobile Line Dashboard | mobile    | QANOV-21949      | QANOV-2806 | QANOV-2813 |

    @android @ios
    Examples:
          | cv   | account_type | current_page | cms_page  | parent_test_plan | depends_on   | jira_id      |
          | 13.5 | jeri control | Account      | dashboard | QANOV-200803     | QANOV-202299 | QANOV-202354 |
          | 13.5 | control_n    | Account      | dashboard | QANOV-200803     | QANOV-202300 | QANOV-202355 |

  @jira.<jira_id> @automatic @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-185544 @mobile @regression @vivobr @webapp
  Scenario Outline: A <account_type> user can see the "SMS do meu celular" module in the mobile consumption screen
    internal_checkpoint="Vivo doesn’t have any more SMS packs and bonus. It will be only one allowance and generally
    is always unlimited."
    User in QA: qavivo-02, qavivo-03, qavivo-05
    Given user has a "<account_type>" account type
      And user has "messages" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
      And the "Mobile Line Consumption" page is displayed
      And clicks on the "sms" tab
     Then the "bundles_title" textfield with "SMS DO MEU CELULAR" text is displayed
      And the "sms_bundles_list.bundle_list" list is displayed
      And each element in the "sms_bundles_list.bundle_list" list has the "icon" field
      And each element in the "sms_bundles_list.bundle_list" list has the "title" textfield with the "Já usei \d+ SMS de ilimitado|Já usei \d+ SMS de \d+ SMS" format
      And each element in the "sms_bundles_list.bundle_list" list has the "subtitle" field
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "<current_page>" page is displayed

    @qa
    Examples:
          | cv   | account_type | current_page          | cms_page | parent_test_plan | depends_on | jira_id      |
          | 12.0 | convergente  | Mobile Line Dashboard | mobile   | QANOV-21791      | QANOV-2805 | QANOV-493663 |

    @live @next @qa
    Examples:
          | cv    | account_type | current_page          | cms_page  | parent_test_plan | depends_on | jira_id      |
          | 11.12 | beatrix      | Account               | dashboard | QANOV-21949      | QANOV-2803 | QANOV-493664 |
          | 11.12 | multivivo    | Mobile Line Dashboard | mobile    | QANOV-21949      | QANOV-2806 | QANOV-493665 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-185544 @mobile @regression @vivobr
  Scenario Outline: A <account_type> user can see the "SMS do meu celular" module in the mobile consumption screen
    internal_checkpoint="Vivo doesn’t have any more SMS packs and bonus. It will be only one allowance and generally
    is always unlimited."
    User in QA: qavivo-02, qavivo-03, qavivo-05
    Given user has a "<account_type>" account type
      And user has "messages" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
      And the "Mobile Line Consumption" page is displayed
      And clicks on the "sms" tab
     Then the "bundles_title" textfield with "SMS DO MEU CELULAR" text is displayed
      And the "sms_bundles_list" list is displayed
      And each element in the "sms_bundles_list" list has the "icon" field
      And each element in the "sms_bundles_list" list has the "quota" textfield with the "Já usei \d+ SMS de ilimitado" format
      And each element in the "sms_bundles_list" list has the "name" field
      And each element in the "sms_bundles_list" list has the "date" textfield with the "Válido até \d\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format
      And clicks on the "navigation_top_bar.back_button" button
      And the "<current_page>" page is displayed

    @manual
    Examples:
          | cv   | account_type  | current_page | cms_page  | parent_test_plan | depends_on   | jira_id      |
          | 14.5 | legacy prepay | Account      | dashboard | QANOV-132105     | QANOV-145206 | QANOV-145221 |
          | 14.5 | jeri prepay   | Account      | dashboard | QANOV-132105     | QANOV-145206 | QANOV-272638 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-64074 @mobile @regression @vivobr
  Scenario Outline: A <account_type> user can switch among the consumption details
    commented_tags="@depends_on.NOV-175372 @depends_on.NOV-175374 @depends_on.NOV-175377"
    User in QA: qavivo-02, qavivo-03, qavivo-05
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "<cms_page>" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumption-details" page for the "mobile" product
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
      And the "Mobile Line Consumption" page is displayed
      And clicks on the "<allowance_type>" tab
      And waits "1" seconds
      And clicks on the "<allowance_type_final>" tab
     Then the "<allowance_type_final>" tab is selected
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "<current_page>" page is displayed

    @automatic @qa @webapp
    Examples:
          | cv   | account_type | allowance_type | allowance_type_final | current_page          | cms_page | parent_test_plan | depends_on | jira_id      |
          | 12.0 | convergente  | data           | sms                  | Mobile Line Dashboard | mobile   | QANOV-21791      | QANOV-2726 | QANOV-339946 |
          | 12.0 | convergente  | sms            | minutes              | Mobile Line Dashboard | mobile   | QANOV-21791      | QANOV-2726 | QANOV-339947 |
          | 12.0 | convergente  | minutes        | data                 | Mobile Line Dashboard | mobile   | QANOV-21791      | QANOV-2726 | QANOV-339948 |

    @automatic @live @next @qa @webapp
    Examples:
          | cv    | account_type | allowance_type | allowance_type_final | current_page          | cms_page  | parent_test_plan | depends_on | jira_id      |
          | 11.12 | beatrix      | data           | sms                  | Account               | dashboard | QANOV-21949      | QANOV-2725 | QANOV-339950 |
          | 11.12 | beatrix      | sms            | minutes              | Account               | dashboard | QANOV-21949      | QANOV-2725 | QANOV-339951 |
          | 11.12 | beatrix      | minutes        | data                 | Account               | dashboard | QANOV-21949      | QANOV-2725 | QANOV-339953 |
          | 11.12 | multivivo    | data           | sms                  | Mobile Line Dashboard | mobile    | QANOV-21949      | QANOV-2728 | QANOV-339954 |
          | 11.12 | multivivo    | sms            | minutes              | Mobile Line Dashboard | mobile    | QANOV-21949      | QANOV-2728 | QANOV-339955 |
          | 11.12 | multivivo    | minutes        | data                 | Mobile Line Dashboard | mobile    | QANOV-21949      | QANOV-2728 | QANOV-339956 |

    @manual
    Examples:
          | cv   | account_type  | allowance_type | allowance_type_final | current_page | cms_page  | parent_test_plan | depends_on   | jira_id      |
          | 14.5 | legacy prepay | data           | sms                  | Account      | dashboard | QANOV-132105     | QANOV-145204 | QANOV-145222 |
          | 14.5 | legacy prepay | sms            | minutes              | Account      | dashboard | QANOV-132105     | QANOV-145204 | QANOV-145223 |
          | 14.5 | legacy prepay | minutes        | data                 | Account      | dashboard | QANOV-132105     | QANOV-145204 | QANOV-145224 |
          | 14.5 | jeri prepay   | data           | sms                  | Account      | dashboard | QANOV-132105     | QANOV-145204 | QANOV-272639 |
          | 14.5 | jeri prepay   | sms            | minutes              | Account      | dashboard | QANOV-132105     | QANOV-145204 | QANOV-272640 |
          | 14.5 | jeri prepay   | minutes        | data                 | Account      | dashboard | QANOV-132105     | QANOV-145204 | QANOV-272641 |
          | 13.5 | jeri control  | data           | sms                  | Account      | dashboard | QANOV-200803     | QANOV-202295 | QANOV-202356 |
          | 13.5 | jeri control  | sms            | minutes              | Account      | dashboard | QANOV-200803     | QANOV-202295 | QANOV-202357 |
          | 13.5 | jeri control  | minutes        | data                 | Account      | dashboard | QANOV-200803     | QANOV-202295 | QANOV-202358 |
          | 13.5 | control_n     | data           | sms                  | Account      | dashboard | QANOV-200803     | QANOV-202296 | QANOV-202359 |
          | 13.5 | control_n     | sms            | minutes              | Account      | dashboard | QANOV-200803     | QANOV-202296 | QANOV-202360 |
          | 13.5 | control_n     | minutes        | data                 | Account      | dashboard | QANOV-200803     | QANOV-202296 | QANOV-202361 |

  @jira.QANOV-2896 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.9 @old_app
  @jira.link.parent_test_plan.QANOV-21949 @jira.link.relates_to.NOV-210064 @manual @mobile @regression @vivobr
  Scenario: Beatrix user with a billing cycle that starts and ends at the same day will se an Empty case in the Consumption page
    other_affected_versions="2021-45-B"
    Given user has a "beatrix" account type
      And the billing cycle starts and ends the same day
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "any_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "empty_case.icon" icon is displayed
      And the "empty_case.title" textfield is displayed
      And the "empty_case.subtitle" textfield is displayed

  @jira.QANOV-272642 @android @ios @jira.cv.11.9 @jira.link.parent_test_plan.QANOV-132105 @manual @mobile @regression
  @vivobr @old_app
  Scenario: Prepay user without data consumption will see an Empty case in the Account page
    Given user has any "legacy prepay;jeri prepay" account types
      And user has no "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "consumption-counters-mobile" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "empty_case" module is displayed
      And the "empty_case.icon" icon is displayed
      And the "empty_case.title" textfield is displayed
      And the "empty_case.subtitle" textfield is displayed
