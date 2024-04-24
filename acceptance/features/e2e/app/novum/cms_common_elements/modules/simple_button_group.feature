# -*- coding: utf-8 -*-
@jira.QANOV-594712
Feature: Simple Button Group


  @jira.<jira_id> @<product> @android @automatic @e2e @ios @jira.cv.24.2 @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_button_group_<button_type>_button
  Scenario Outline: A user can see a Simple Button Group module with <button_type> button configured with the default fields
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     Then the "simple_button_group.<button_type>_button" button with "[CONTEXT:simple_button_group.firstButtonText]" text is displayed
      And the "simple_button_group.<other_button_1>_button" button is not displayed
      And the "simple_button_group.<other_button_2>_button" button is not displayed

    Examples:
          | button_type | other_button_1 | other_button_2 | field            | product | jira_id      |
          | primary     | secondary      | link           | PRIMARY_BUTTON   | blaude  | QANOV-594713 |
          | secondary   | primary        | link           | SECONDARY_BUTTON | blaude  | QANOV-594714 |
          | link        | primary        | secondary      | BUTTON_LINK      | blaude  | QANOV-594715 |
          | primary     | secondary      | link           | PRIMARY_BUTTON   | moves   | QANOV-594716 |
          | secondary   | primary        | link           | SECONDARY_BUTTON | moves   | QANOV-594717 |
          | link        | primary        | secondary      | BUTTON_LINK      | moves   | QANOV-594718 |
          | primary     | secondary      | link           | PRIMARY_BUTTON   | o2de    | QANOV-594719 |
          | secondary   | primary        | link           | SECONDARY_BUTTON | o2de    | QANOV-594720 |
          | link        | primary        | secondary      | BUTTON_LINK      | o2de    | QANOV-594721 |
          | primary     | secondary      | link           | PRIMARY_BUTTON   | o2uk    | QANOV-594722 |
          | secondary   | primary        | link           | SECONDARY_BUTTON | o2uk    | QANOV-594723 |
          | link        | primary        | secondary      | BUTTON_LINK      | o2uk    | QANOV-594724 |
          | primary     | secondary      | link           | PRIMARY_BUTTON   | vivobr  | QANOV-594725 |
          | secondary   | primary        | link           | SECONDARY_BUTTON | vivobr  | QANOV-594726 |
          | link        | primary        | secondary      | BUTTON_LINK      | vivobr  | QANOV-594727 |

  @jira.<jira_id> @<priority> @<product> @android @automatic @e2e @ios @jira.cv.24.2 @mobile @qa @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_button_group_<button_type>_button_with_icon
  Scenario Outline: A user can see a Simple Button Group module with <button_type> button configured with icon
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And the "simple-button-group" module configured in CMS has the "firstButtonStartIcon" filled
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     Then the "simple_button_group.<button_type>_button" button with "[CONTEXT:simple_button_group.firstButtonText]" text is displayed
      And the "src" property of the "simple_button_group.<button_type>_button_icon" element matches "[CONTEXT:simple_button_group.firstButtonStartIcon.url]" text
      And the "simple_button_group.<other_button_1>_button" button is not displayed
      And the "simple_button_group.<other_button_2>_button" button is not displayed

    Examples:
          | button_type | other_button_1 | other_button_2 | field            | priority   | product | jira_id      |
          | primary     | secondary      | link           | PRIMARY_BUTTON   | regression | blaude  | QANOV-594728 |
          | secondary   | primary        | link           | SECONDARY_BUTTON | regression | blaude  | QANOV-594729 |
          | link        | primary        | secondary      | BUTTON_LINK      | regression | blaude  | QANOV-594730 |
          | primary     | secondary      | link           | PRIMARY_BUTTON   | regression | moves   | QANOV-594731 |
          | secondary   | primary        | link           | SECONDARY_BUTTON | regression | moves   | QANOV-594732 |
          | link        | primary        | secondary      | BUTTON_LINK      | sanity     | moves   | QANOV-594733 |
          | primary     | secondary      | link           | PRIMARY_BUTTON   | regression | o2de    | QANOV-594734 |
          | secondary   | primary        | link           | SECONDARY_BUTTON | regression | o2de    | QANOV-594735 |
          | link        | primary        | secondary      | BUTTON_LINK      | regression | o2de    | QANOV-594736 |
          | primary     | secondary      | link           | PRIMARY_BUTTON   | regression | o2uk    | QANOV-594738 |
          | secondary   | primary        | link           | SECONDARY_BUTTON | regression | o2uk    | QANOV-594739 |
          | link        | primary        | secondary      | BUTTON_LINK      | regression | o2uk    | QANOV-594740 |
          | primary     | secondary      | link           | PRIMARY_BUTTON   | regression | vivobr  | QANOV-594742 |
          | secondary   | primary        | link           | SECONDARY_BUTTON | regression | vivobr  | QANOV-594743 |
          | link        | primary        | secondary      | BUTTON_LINK      | regression | vivobr  | QANOV-594744 |

  @jira.<jira_id> @<product> @android @automation.hard @e2e @ios @jira.cv.24.2 @manual @mobile @regression
  Scenario Outline: A user can see a Simple Button Group module with <button_type> button configured in centered mode
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "isCentered" field with "true" value
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     Then the "simple_button_group.<button_type>_button" button is displayed in centered mode
      And the "simple_button_group.<button_type>_button_icon" element is not displayed

    Examples:
          | button_type | field            | product | jira_id      |
          | primary     | PRIMARY_BUTTON   | blaude  | QANOV-594745 |
          | secondary   | SECONDARY_BUTTON | blaude  | QANOV-594746 |
          | link        | BUTTON_LINK      | blaude  | QANOV-594748 |
          | primary     | PRIMARY_BUTTON   | moves   | QANOV-594749 |
          | secondary   | SECONDARY_BUTTON | moves   | QANOV-594750 |
          | link        | BUTTON_LINK      | moves   | QANOV-594751 |
          | primary     | PRIMARY_BUTTON   | o2de    | QANOV-594752 |
          | secondary   | SECONDARY_BUTTON | o2de    | QANOV-594753 |
          | link        | BUTTON_LINK      | o2de    | QANOV-594754 |
          | primary     | PRIMARY_BUTTON   | o2uk    | QANOV-594755 |
          | secondary   | SECONDARY_BUTTON | o2uk    | QANOV-594756 |
          | link        | BUTTON_LINK      | o2uk    | QANOV-594757 |
          | primary     | PRIMARY_BUTTON   | vivobr  | QANOV-594758 |
          | secondary   | SECONDARY_BUTTON | vivobr  | QANOV-594759 |
          | link        | BUTTON_LINK      | vivobr  | QANOV-594760 |

  @jira.<jira_id> @<product> @android @automation.hard @e2e @ios @jira.cv.24.2 @manual @mobile @regression
  Scenario Outline: A user can see a Simple Button Group module with <button_type> button configured in centered mode with icon
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And the "simple-button-group" module configured in CMS has the "isCentered" field with "true" value
      And the "simple-button-group" module configured in CMS has the "firstButtonStartIcon" filled
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     Then the "simple_button_group.<button_type>_button" button is displayed in centered mode
      And the "src" property of the "simple_button_group.<button_type>_button_icon" element matches "[CONTEXT:simple_button_group.firstButtonStartIcon.url]" text

    Examples:
          | button_type | field            | product | jira_id      |
          | primary     | PRIMARY_BUTTON   | blaude  | QANOV-594761 |
          | secondary   | SECONDARY_BUTTON | blaude  | QANOV-594762 |
          | link        | BUTTON_LINK      | blaude  | QANOV-594763 |
          | primary     | PRIMARY_BUTTON   | moves   | QANOV-594764 |
          | secondary   | SECONDARY_BUTTON | moves   | QANOV-594765 |
          | link        | BUTTON_LINK      | moves   | QANOV-594766 |
          | primary     | PRIMARY_BUTTON   | o2de    | QANOV-594767 |
          | secondary   | SECONDARY_BUTTON | o2de    | QANOV-594768 |
          | link        | BUTTON_LINK      | o2de    | QANOV-594769 |
          | primary     | PRIMARY_BUTTON   | o2uk    | QANOV-594770 |
          | secondary   | SECONDARY_BUTTON | o2uk    | QANOV-594771 |
          | link        | BUTTON_LINK      | o2uk    | QANOV-594772 |
          | primary     | PRIMARY_BUTTON   | vivobr  | QANOV-594773 |
          | secondary   | SECONDARY_BUTTON | vivobr  | QANOV-594774 |
          | link        | BUTTON_LINK      | vivobr  | QANOV-594776 |

  @jira.<jira_id> @<product> @android @automatic @e2e @ios @jira.cv.24.2 @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_button_group_<button_type>_button_danger_mode
  Scenario Outline: A user can see a Simple Button Group module with <button_type> button configured in danger mode without icon
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And the "simple-button-group" module configured in CMS has the "firstButtonIsDanger" field with "True" value
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     Then the "simple_button_group.<button_type>_button_danger" button with "[CONTEXT:simple_button_group.firstButtonText]" text is displayed
      And the "simple_button_group.<button_type>_button_icon" element is not displayed

    Examples:
          | button_type | field          | product | jira_id      |
          | primary     | PRIMARY_BUTTON | blaude  | QANOV-594777 |
          | link        | BUTTON_LINK    | blaude  | QANOV-594778 |
          | primary     | PRIMARY_BUTTON | moves   | QANOV-594779 |
          | link        | BUTTON_LINK    | moves   | QANOV-594780 |
          | primary     | PRIMARY_BUTTON | o2de    | QANOV-594781 |
          | link        | BUTTON_LINK    | o2de    | QANOV-594782 |
          | primary     | PRIMARY_BUTTON | o2uk    | QANOV-594784 |
          | link        | BUTTON_LINK    | o2uk    | QANOV-594785 |
          | primary     | PRIMARY_BUTTON | vivobr  | QANOV-594786 |
          | link        | BUTTON_LINK    | vivobr  | QANOV-594787 |

  @jira.<jira_id> @<product> @android @automatic @e2e @ios @jira.cv.24.2 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_button_group_<button_type>_button_danger_mode_with_icon
  Scenario Outline: A user can see a Simple Button Group module with <button_type> button configured in danger mode with icon
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And the "simple-button-group" module configured in CMS has the "firstButtonIsDanger" field with "True" value
      And the "simple-button-group" module configured in CMS has the "firstButtonStartIcon" filled
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     Then the "simple_button_group.<button_type>_button_danger" button with "[CONTEXT:simple_button_group.firstButtonText]" text is displayed
      And the "src" property of the "simple_button_group.<button_type>_button_danger_icon" element matches "[CONTEXT:simple_button_group.firstButtonStartIcon.url]" text

    Examples:
          | button_type | field          | product | jira_id      |
          | primary     | PRIMARY_BUTTON | blaude  | QANOV-594788 |
          | link        | BUTTON_LINK    | blaude  | QANOV-594789 |
          | primary     | PRIMARY_BUTTON | moves   | QANOV-594790 |
          | link        | BUTTON_LINK    | moves   | QANOV-594791 |
          | primary     | PRIMARY_BUTTON | o2de    | QANOV-594793 |
          | link        | BUTTON_LINK    | o2de    | QANOV-594794 |
          | primary     | PRIMARY_BUTTON | o2uk    | QANOV-594796 |
          | link        | BUTTON_LINK    | o2uk    | QANOV-594797 |
          | primary     | PRIMARY_BUTTON | vivobr  | QANOV-594798 |
          | link        | BUTTON_LINK    | vivobr  | QANOV-594799 |

  @jira.<jira_id> @<product> @android @automation.hard @e2e @ios @jira.cv.24.2 @manual @mobile @regression
  Scenario Outline: A user can see a Simple Button Group module with <button_type> button configured in danger mode without icon in centered mode
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And the "simple-button-group" module configured in CMS has the "firstButtonIsDanger" field with "true" value
      And the "simple-button-group" module configured in CMS has the "isCentered" field with "true" value
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     Then the "simple_button_group.<button_type>_button_danger" button with "[CONTEXT:simple_button_group.firstButtonText]" text is displayed
      And the "simple_button_group.<button_type>_button" button is displayed in centered mode
      And the "simple_button_group.<button_type>_button_icon" element is not displayed

    Examples:
          | button_type | field          | product | jira_id      |
          | primary     | PRIMARY_BUTTON | blaude  | QANOV-594800 |
          | link        | BUTTON_LINK    | blaude  | QANOV-594801 |
          | primary     | PRIMARY_BUTTON | moves   | QANOV-594802 |
          | link        | BUTTON_LINK    | moves   | QANOV-594804 |
          | primary     | PRIMARY_BUTTON | o2de    | QANOV-594805 |
          | link        | BUTTON_LINK    | o2de    | QANOV-594806 |
          | primary     | PRIMARY_BUTTON | o2uk    | QANOV-594807 |
          | link        | BUTTON_LINK    | o2uk    | QANOV-594808 |
          | primary     | PRIMARY_BUTTON | vivobr  | QANOV-594809 |
          | link        | BUTTON_LINK    | vivobr  | QANOV-594810 |

  @jira.<jira_id> @<product> @android @automation.hard @e2e @ios @jira.cv.24.2 @manual @mobile @regression
  Scenario Outline: A user can see a Simple Button Group module with <button_type> button configured in danger mode with icon in centered mode
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And the "simple-button-group" module configured in CMS has the "firstButtonIsDanger" field with "true" value
      And the "simple-button-group" module configured in CMS has the "isCentered" field with "true" value
      And the "simple-button-group" module configured in CMS has the "firstButtonStartIcon" filled
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     Then the "simple_button_group.<button_type>_button_danger" button with "[CONTEXT:simple_button_group.firstButtonText]" text is displayed
      And the "simple_button_group.<button_type>_button" button is displayed in centered mode
      And the "src" property of the "simple_button_group.<button_type>_button_icon" element matches "[CONTEXT:simple_button_group.firstButtonStartIcon.url]" text

    Examples:
          | button_type | field          | product | jira_id      |
          | primary     | PRIMARY_BUTTON | blaude  | QANOV-594811 |
          | link        | BUTTON_LINK    | blaude  | QANOV-594813 |
          | primary     | PRIMARY_BUTTON | moves   | QANOV-594814 |
          | link        | BUTTON_LINK    | moves   | QANOV-594815 |
          | primary     | PRIMARY_BUTTON | o2de    | QANOV-594816 |
          | link        | BUTTON_LINK    | o2de    | QANOV-594817 |
          | primary     | PRIMARY_BUTTON | o2uk    | QANOV-594818 |
          | link        | BUTTON_LINK    | o2uk    | QANOV-594820 |
          | primary     | PRIMARY_BUTTON | vivobr  | QANOV-594821 |
          | link        | BUTTON_LINK    | vivobr  | QANOV-594822 |

  @jira.<jira_id> @<product> @android @automatic @e2e @ios @jira.cv.24.2 @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_button_group_<first>_<second>_button
  Scenario Outline: A user can see a Simple Button Group module with <first> and <second> buttons configured with the default fields
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     Then the "simple_button_group.<first>_button" button with "[CONTEXT:simple_button_group.firstButtonText]" text is displayed
      And the "simple_button_group.<second>_button" button with "[CONTEXT:simple_button_group.secondButtonText]" text is displayed
      And the "simple_button_group.<other_button>_button" button is not displayed

    Examples:
          | first     | second    | other_button | field                 | product | jira_id      |
          | primary   | secondary | link         | PRIMARY_AND_SECONDARY | blaude  | QANOV-594823 |
          | primary   | link      | secondary    | PRIMARY_AND_LINK      | blaude  | QANOV-594824 |
          | secondary | link      | primary      | SECONDARY_AND_LINK    | blaude  | QANOV-594825 |
          | primary   | secondary | link         | PRIMARY_AND_SECONDARY | moves   | QANOV-594826 |
          | primary   | link      | secondary    | PRIMARY_AND_LINK      | moves   | QANOV-594827 |
          | secondary | link      | primary      | SECONDARY_AND_LINK    | moves   | QANOV-594828 |
          | primary   | secondary | link         | PRIMARY_AND_SECONDARY | o2de    | QANOV-594829 |
          | primary   | link      | secondary    | PRIMARY_AND_LINK      | o2de    | QANOV-594830 |
          | secondary | link      | primary      | SECONDARY_AND_LINK    | o2de    | QANOV-594831 |
          | primary   | secondary | link         | PRIMARY_AND_SECONDARY | o2uk    | QANOV-594832 |
          | primary   | link      | secondary    | PRIMARY_AND_LINK      | o2uk    | QANOV-594833 |
          | secondary | link      | primary      | SECONDARY_AND_LINK    | o2uk    | QANOV-594834 |
          | primary   | secondary | link         | PRIMARY_AND_SECONDARY | vivobr  | QANOV-594835 |
          | primary   | link      | secondary    | PRIMARY_AND_LINK      | vivobr  | QANOV-594836 |
          | secondary | link      | primary      | SECONDARY_AND_LINK    | vivobr  | QANOV-594837 |

  @jira.<jira_id> @<product> @android @automatic @e2e @ios @jira.cv.24.2 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_button_group_<first>_<second>_buttons_with_icon
  Scenario Outline: A user can see a Simple Button Group module with <first> and <second> buttons configured with icon
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And the "simple-button-group" module configured in CMS has the "firstButtonStartIcon" filled
      And the "simple-button-group" module configured in CMS has the "secondButtonStartIcon" filled
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     Then the "simple_button_group.<first>_button" button with "[CONTEXT:simple_button_group.firstButtonText]" text is displayed
      And the "src" property of the "simple_button_group.<first>_button_icon" element matches "[CONTEXT:simple_button_group.firstButtonStartIcon.url]" text
      And the "simple_button_group.<second>_button" button with "[CONTEXT:simple_button_group.secondButtonText]" text is displayed
      And the "src" property of the "simple_button_group.<second>_button_icon" element matches "[CONTEXT:simple_button_group.secondButtonStartIcon.url]" text
      And the "simple_button_group.<other_button>_button" button is not displayed

    Examples:
          | first     | second    | other_button | field                 | product | jira_id      |
          | primary   | secondary | link         | PRIMARY_AND_SECONDARY | blaude  | QANOV-594838 |
          | primary   | link      | secondary    | PRIMARY_AND_LINK      | blaude  | QANOV-594839 |
          | secondary | link      | primary      | SECONDARY_AND_LINK    | blaude  | QANOV-594840 |
          | primary   | secondary | link         | PRIMARY_AND_SECONDARY | moves   | QANOV-594841 |
          | primary   | link      | secondary    | PRIMARY_AND_LINK      | moves   | QANOV-594842 |
          | secondary | link      | primary      | SECONDARY_AND_LINK    | moves   | QANOV-594843 |
          | primary   | secondary | link         | PRIMARY_AND_SECONDARY | o2de    | QANOV-594844 |
          | primary   | link      | secondary    | PRIMARY_AND_LINK      | o2de    | QANOV-594845 |
          | secondary | link      | primary      | SECONDARY_AND_LINK    | o2de    | QANOV-594846 |
          | primary   | secondary | link         | PRIMARY_AND_SECONDARY | o2uk    | QANOV-594847 |
          | primary   | link      | secondary    | PRIMARY_AND_LINK      | o2uk    | QANOV-594848 |
          | secondary | link      | primary      | SECONDARY_AND_LINK    | o2uk    | QANOV-594849 |
          | primary   | secondary | link         | PRIMARY_AND_SECONDARY | vivobr  | QANOV-594850 |
          | primary   | link      | secondary    | PRIMARY_AND_LINK      | vivobr  | QANOV-594851 |
          | secondary | link      | primary      | SECONDARY_AND_LINK    | vivobr  | QANOV-594852 |

  @jira.<jira_id> @<product> @android @automatic @e2e @ios @jira.cv.24.2 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_button_group_<first>_<second>_buttons_with_<button_with_icon>_icon
  Scenario Outline: A user can see a Simple Button Group module with <first> and <second> buttons configured with icon in the <button_with_icon> button
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And the "simple-button-group" module configured in CMS has the "<button_with_icon>ButtonStartIcon" filled
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     Then the "src" property of the "simple_button_group.<button_with_icon_element>_button_icon" element matches "[CONTEXT:simple_button_group.<button_with_icon>ButtonStartIcon.url]" text
      And the "simple_button_group.<second>_button" button is displayed
      And the "simple_button_group.<button_without_icon_element>_button_icon" image is not displayed

    Examples:
          | first     | second    | button_with_icon_element | button_without_icon_element | button_with_icon | field                 | product | jira_id      |
          | primary   | secondary | primary                  | secondary                   | first            | PRIMARY_AND_SECONDARY | blaude  | QANOV-594853 |
          | primary   | secondary | secondary                | primary                     | second           | PRIMARY_AND_SECONDARY | blaude  | QANOV-594854 |
          | primary   | link      | primary                  | link                        | first            | PRIMARY_AND_LINK      | blaude  | QANOV-594855 |
          | primary   | link      | link                     | primary                     | second           | PRIMARY_AND_LINK      | blaude  | QANOV-594856 |
          | secondary | link      | secondary                | link                        | first            | SECONDARY_AND_LINK    | blaude  | QANOV-594857 |
          | secondary | link      | link                     | secondary                   | second           | SECONDARY_AND_LINK    | blaude  | QANOV-594858 |
          | primary   | secondary | primary                  | secondary                   | first            | PRIMARY_AND_SECONDARY | moves   | QANOV-594859 |
          | primary   | secondary | secondary                | primary                     | second           | PRIMARY_AND_SECONDARY | moves   | QANOV-594860 |
          | primary   | link      | primary                  | link                        | first            | PRIMARY_AND_LINK      | moves   | QANOV-594861 |
          | primary   | link      | link                     | primary                     | second           | PRIMARY_AND_LINK      | moves   | QANOV-594862 |
          | secondary | link      | secondary                | link                        | first            | SECONDARY_AND_LINK    | moves   | QANOV-594863 |
          | secondary | link      | link                     | secondary                   | second           | SECONDARY_AND_LINK    | moves   | QANOV-594864 |
          | primary   | secondary | primary                  | secondary                   | first            | PRIMARY_AND_SECONDARY | o2de    | QANOV-594865 |
          | primary   | secondary | secondary                | primary                     | second           | PRIMARY_AND_SECONDARY | o2de    | QANOV-594866 |
          | primary   | link      | primary                  | link                        | first            | PRIMARY_AND_LINK      | o2de    | QANOV-594867 |
          | primary   | link      | link                     | primary                     | second           | PRIMARY_AND_LINK      | o2de    | QANOV-594869 |
          | secondary | link      | secondary                | link                        | first            | SECONDARY_AND_LINK    | o2de    | QANOV-594870 |
          | secondary | link      | link                     | secondary                   | second           | SECONDARY_AND_LINK    | o2de    | QANOV-594871 |
          | primary   | secondary | primary                  | secondary                   | first            | PRIMARY_AND_SECONDARY | o2uk    | QANOV-594872 |
          | primary   | secondary | secondary                | primary                     | second           | PRIMARY_AND_SECONDARY | o2uk    | QANOV-594874 |
          | primary   | link      | primary                  | link                        | first            | PRIMARY_AND_LINK      | o2uk    | QANOV-594875 |
          | primary   | link      | link                     | primary                     | second           | PRIMARY_AND_LINK      | o2uk    | QANOV-594876 |
          | secondary | link      | secondary                | link                        | first            | SECONDARY_AND_LINK    | o2uk    | QANOV-594877 |
          | secondary | link      | link                     | secondary                   | second           | SECONDARY_AND_LINK    | o2uk    | QANOV-594878 |
          | primary   | secondary | primary                  | secondary                   | first            | PRIMARY_AND_SECONDARY | vivobr  | QANOV-594879 |
          | primary   | secondary | secondary                | primary                     | second           | PRIMARY_AND_SECONDARY | vivobr  | QANOV-594880 |
          | primary   | link      | primary                  | link                        | first            | PRIMARY_AND_LINK      | vivobr  | QANOV-594881 |
          | primary   | link      | link                     | primary                     | second           | PRIMARY_AND_LINK      | vivobr  | QANOV-594882 |
          | secondary | link      | secondary                | link                        | first            | SECONDARY_AND_LINK    | vivobr  | QANOV-594883 |
          | secondary | link      | link                     | secondary                   | second           | SECONDARY_AND_LINK    | vivobr  | QANOV-594884 |

  @jira.<jira_id> @<product> @android @automatic @e2e @ios @jira.cv.24.2 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_button_group_<first>_<second>_buttons_<button_in_danger_element>_danger_mode
  Scenario Outline: A user can see a Simple Button Group module with <first> and <second> buttons configured in danger mode
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And the "simple-button-group" module configured in CMS has the "<button_in_danger>ButtonIsDanger" field with "True" value
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     Then the "simple_button_group.<button_in_danger_element>_button_danger" button with "[CONTEXT:simple_button_group.<button_in_danger>ButtonText]" text is displayed
      And the "simple_button_group.<button_in_no_danger_element>_button" button with "[CONTEXT:simple_button_group.<button_in_no_danger>ButtonText]" text is displayed

    Examples:
          | first   | second    | button_in_danger_element | button_in_no_danger_element | button_in_danger | button_in_no_danger | field                 | product | jira_id      |
          | primary | secondary | primary                  | secondary                   | first            | second              | PRIMARY_AND_SECONDARY | blaude  | QANOV-594885 |
          | primary | link      | primary                  | link                        | first            | second              | PRIMARY_AND_LINK      | blaude  | QANOV-594886 |
          | primary | link      | link                     | primary                     | second           | first               | PRIMARY_AND_LINK      | blaude  | QANOV-601617 |
          | link    | secondary | link                     | secondary                   | second           | first               | SECONDARY_AND_LINK    | blaude  | QANOV-594887 |
          | primary | secondary | primary                  | secondary                   | first            | second              | PRIMARY_AND_SECONDARY | moves   | QANOV-594888 |
          | primary | link      | primary                  | link                        | first            | second              | PRIMARY_AND_LINK      | moves   | QANOV-594889 |
          | primary | link      | link                     | primary                     | second           | first               | PRIMARY_AND_LINK      | moves   | QANOV-601618 |
          | link    | secondary | link                     | secondary                   | second           | first               | SECONDARY_AND_LINK    | moves   | QANOV-594890 |
          | primary | secondary | primary                  | secondary                   | first            | second              | PRIMARY_AND_SECONDARY | o2de    | QANOV-594891 |
          | primary | link      | primary                  | link                        | first            | second              | PRIMARY_AND_LINK      | o2de    | QANOV-594892 |
          | primary | link      | link                     | primary                     | second           | first               | PRIMARY_AND_LINK      | o2de    | QANOV-601620 |
          | link    | secondary | link                     | secondary                   | second           | first               | SECONDARY_AND_LINK    | o2de    | QANOV-594893 |
          | primary | secondary | primary                  | secondary                   | first            | second              | PRIMARY_AND_SECONDARY | o2uk    | QANOV-594894 |
          | primary | link      | primary                  | link                        | first            | second              | PRIMARY_AND_LINK      | o2uk    | QANOV-594895 |
          | primary | link      | link                     | primary                     | second           | first               | PRIMARY_AND_LINK      | o2uk    | QANOV-601622 |
          | link    | secondary | link                     | secondary                   | second           | first               | SECONDARY_AND_LINK    | o2uk    | QANOV-594896 |
          | primary | secondary | primary                  | secondary                   | first            | second              | PRIMARY_AND_SECONDARY | vivobr  | QANOV-594897 |
          | primary | link      | primary                  | link                        | first            | second              | PRIMARY_AND_LINK      | vivobr  | QANOV-594898 |
          | primary | link      | link                     | primary                     | second           | first               | PRIMARY_AND_LINK      | vivobr  | QANOV-601623 |
          | link    | secondary | link                     | secondary                   | second           | first               | SECONDARY_AND_LINK    | vivobr  | QANOV-594899 |

  @jira.<jira_id> @<product> @android @automatic @e2e @ios @jira.cv.24.2 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_button_group_<first>_<second>_buttons_<button_in_danger_element>_danger_mode_with_icon
  Scenario Outline: A user can see a Simple Button Group module with <first> and <second> buttons configured with icon and <button_in_danger_element> button in danger mode
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And the "simple-button-group" module configured in CMS has the "firstButtonStartIcon" filled
      And the "simple-button-group" module configured in CMS has the "secondButtonStartIcon" filled
      And the "simple-button-group" module configured in CMS has the "<button_in_danger>ButtonIsDanger" field with "True" value
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     Then the "simple_button_group.<button_in_danger_element>_button_danger" button with "[CONTEXT:simple_button_group.<button_in_danger>ButtonText]" text is displayed
      And the "src" property of the "simple_button_group.<button_in_danger_element>_button_danger_icon" element matches "[CONTEXT:simple_button_group.<button_in_danger>ButtonStartIcon.url]" text
      And the "simple_button_group.<button_in_no_danger_element>_button" button with "[CONTEXT:simple_button_group.<button_in_no_danger>ButtonText]" text is displayed
      And the "src" property of the "simple_button_group.<button_in_no_danger_element>_button_icon" element matches "[CONTEXT:simple_button_group.<button_in_no_danger>ButtonStartIcon.url]" text

    Examples:
          | first     | second    | button_in_danger_element | button_in_no_danger_element | button_in_danger | button_in_no_danger | field                 | product | jira_id      |
          | primary   | secondary | primary                  | secondary                   | first            | second              | PRIMARY_AND_SECONDARY | blaude  | QANOV-594901 |
          | primary   | link      | primary                  | link                        | first            | second              | PRIMARY_AND_LINK      | blaude  | QANOV-594902 |
          | primary   | link      | link                     | primary                     | second           | first               | PRIMARY_AND_LINK      | blaude  | QANOV-601624 |
          | secondary | link      | link                     | secondary                   | second           | first               | SECONDARY_AND_LINK    | blaude  | QANOV-594903 |
          | primary   | secondary | primary                  | secondary                   | first            | second              | PRIMARY_AND_SECONDARY | moves   | QANOV-594904 |
          | primary   | link      | primary                  | link                        | first            | second              | PRIMARY_AND_LINK      | moves   | QANOV-594905 |
          | primary   | link      | link                     | primary                     | second           | first               | PRIMARY_AND_LINK      | moves   | QANOV-601625 |
          | secondary | link      | link                     | secondary                   | second           | first               | SECONDARY_AND_LINK    | moves   | QANOV-594906 |
          | primary   | secondary | primary                  | secondary                   | first            | second              | PRIMARY_AND_SECONDARY | o2de    | QANOV-594907 |
          | primary   | link      | primary                  | link                        | first            | second              | PRIMARY_AND_LINK      | o2de    | QANOV-594908 |
          | primary   | link      | link                     | primary                     | second           | first               | PRIMARY_AND_LINK      | o2de    | QANOV-601626 |
          | secondary | link      | link                     | secondary                   | second           | first               | SECONDARY_AND_LINK    | o2de    | QANOV-594909 |
          | primary   | secondary | primary                  | secondary                   | first            | second              | PRIMARY_AND_SECONDARY | o2uk    | QANOV-594910 |
          | primary   | link      | primary                  | link                        | first            | second              | PRIMARY_AND_LINK      | o2uk    | QANOV-594911 |
          | primary   | link      | link                     | primary                     | second           | first               | PRIMARY_AND_LINK      | o2uk    | QANOV-601628 |
          | secondary | link      | link                     | secondary                   | second           | first               | SECONDARY_AND_LINK    | o2uk    | QANOV-594912 |
          | primary   | secondary | primary                  | secondary                   | first            | second              | PRIMARY_AND_SECONDARY | vivobr  | QANOV-594913 |
          | primary   | link      | primary                  | link                        | first            | second              | PRIMARY_AND_LINK      | vivobr  | QANOV-594914 |
          | primary   | link      | link                     | primary                     | second           | first               | PRIMARY_AND_LINK      | vivobr  | QANOV-601629 |
          | secondary | link      | link                     | secondary                   | second           | first               | SECONDARY_AND_LINK    | vivobr  | QANOV-594915 |

  @jira.<jira_id> @<product> @android @automatic @e2e @ios @jira.cv.24.2 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_button_group_<first>_<second>_buttons_danger_mode_with_<button_with_icon>_icon
  Scenario Outline: A user can see a Simple Button Group module with <first> and <second> buttons configured with icon in the <button_with_icon> button and in danger mode
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And the "simple-button-group" module configured in CMS has the "<button_with_icon>ButtonStartIcon" filled
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     Then the "simple_button_group.<button_in_danger>_button_danger" button is displayed
      And the "src" property of the "simple_button_group.<button_with_icon_element>" element matches "[CONTEXT:simple_button_group.<button_with_icon>ButtonStartIcon.url]" text
      And the "simple_button_group.<second>_button" button is displayed
      And the "simple_button_group.<button_without_icon_element>" image is not displayed

    Examples:
          | first   | second    | button_with_icon_element   | button_without_icon_element | button_with_icon | button_in_danger | field                 | product | jira_id      |
          | primary | secondary | primary_button_danger_icon | secondary_button_icon       | first            | primary          | PRIMARY_AND_SECONDARY | blaude  | QANOV-594916 |
          | primary | secondary | secondary_button_icon      | primary_button_danger_icon  | second           | primary          | PRIMARY_AND_SECONDARY | blaude  | QANOV-594917 |
          | primary | link      | primary_button_danger_icon | link_button_icon            | first            | primary          | PRIMARY_AND_LINK      | blaude  | QANOV-594918 |
          | primary | link      | link_button_icon           | primary_button_danger_icon  | second           | primary          | PRIMARY_AND_LINK      | blaude  | QANOV-594919 |
          | link    | secondary | secondary_button_icon      | link_button_danger_icon     | first            | link             | SECONDARY_AND_LINK    | blaude  | QANOV-594920 |
          | link    | secondary | link_button_danger_icon    | secondary_button_icon       | second           | link             | SECONDARY_AND_LINK    | blaude  | QANOV-594921 |
          | primary | secondary | primary_button_danger_icon | secondary_button_icon       | first            | primary          | PRIMARY_AND_SECONDARY | moves   | QANOV-594922 |
          | primary | secondary | secondary_button_icon      | primary_button_danger_icon  | second           | primary          | PRIMARY_AND_SECONDARY | moves   | QANOV-594923 |
          | primary | link      | primary_button_danger_icon | link_button_icon            | first            | primary          | PRIMARY_AND_LINK      | moves   | QANOV-594924 |
          | primary | link      | link_button_icon           | primary_button_danger_icon  | second           | primary          | PRIMARY_AND_LINK      | moves   | QANOV-594925 |
          | link    | secondary | secondary_button_icon      | link_button_danger_icon     | first            | link             | SECONDARY_AND_LINK    | moves   | QANOV-594926 |
          | link    | secondary | link_button_danger_icon    | secondary_button_icon       | second           | link             | SECONDARY_AND_LINK    | moves   | QANOV-594927 |
          | primary | secondary | primary_button_danger_icon | secondary_button_icon       | first            | primary          | PRIMARY_AND_SECONDARY | o2de    | QANOV-594928 |
          | primary | secondary | secondary_button_icon      | primary_button_danger_icon  | second           | primary          | PRIMARY_AND_SECONDARY | o2de    | QANOV-594929 |
          | primary | link      | primary_button_danger_icon | link_button_icon            | first            | primary          | PRIMARY_AND_LINK      | o2de    | QANOV-594930 |
          | primary | link      | link_button_icon           | primary_button_danger_icon  | second           | primary          | PRIMARY_AND_LINK      | o2de    | QANOV-594931 |
          | link    | secondary | secondary_button_icon      | link_button_danger_icon     | first            | link             | SECONDARY_AND_LINK    | o2de    | QANOV-594932 |
          | link    | secondary | link_button_danger_icon    | secondary_button_icon       | second           | link             | SECONDARY_AND_LINK    | o2de    | QANOV-594933 |
          | primary | secondary | primary_button_danger_icon | secondary_button_icon       | first            | primary          | PRIMARY_AND_SECONDARY | o2uk    | QANOV-594934 |
          | primary | secondary | secondary_button_icon      | primary_button_danger_icon  | second           | primary          | PRIMARY_AND_SECONDARY | o2uk    | QANOV-594935 |
          | primary | link      | primary_button_danger_icon | link_button_icon            | first            | primary          | PRIMARY_AND_LINK      | o2uk    | QANOV-594936 |
          | primary | link      | link_button_icon           | primary_button_danger_icon  | second           | primary          | PRIMARY_AND_LINK      | o2uk    | QANOV-594937 |
          | link    | secondary | secondary_button_icon      | link_button_danger_icon     | first            | link             | SECONDARY_AND_LINK    | o2uk    | QANOV-594938 |
          | link    | secondary | link_button_danger_icon    | secondary_button_icon       | second           | link             | SECONDARY_AND_LINK    | o2uk    | QANOV-594939 |
          | primary | secondary | primary_button_danger_icon | secondary_button_icon       | first            | primary          | PRIMARY_AND_SECONDARY | vivobr  | QANOV-594940 |
          | primary | secondary | secondary_button_icon      | primary_button_danger_icon  | second           | primary          | PRIMARY_AND_SECONDARY | vivobr  | QANOV-594941 |
          | primary | link      | primary_button_danger_icon | link_button_icon            | first            | primary          | PRIMARY_AND_LINK      | vivobr  | QANOV-594942 |
          | primary | link      | link_button_icon           | primary_button_danger_icon  | second           | primary          | PRIMARY_AND_LINK      | vivobr  | QANOV-594943 |
          | link    | secondary | secondary_button_icon      | link_button_danger_icon     | first            | link             | SECONDARY_AND_LINK    | vivobr  | QANOV-594944 |
          | link    | secondary | link_button_danger_icon    | secondary_button_icon       | second           | link             | SECONDARY_AND_LINK    | vivobr  | QANOV-594945 |

  @jira.<jira_id> @<priority> @<product> @android @automatic @e2e @ios @jira.cv.24.2 @mobile @qa
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_button_group_<button_type>_button_preconfigured_url
  Scenario Outline: A user clicks on the <button_element> button in a <button_type> simple button group when it is configured to open a preconfigured target
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And the "simple-button-group" configured in CMS has a "preconfigured" link to "<link>" destination
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     When clicks on the "simple_button_group.<button_element>_button" button
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | button_element | button_type       | field                 | link                  | header        | button       | priority   | product | jira_id      |
          | primary        | primary           | PRIMARY_BUTTON        | NAME_CHANGE           | Namen ändern  | close_button | regression | blaude  | QANOV-594946 |
          | secondary      | secondary         | SECONDARY_BUTTON      | NAME_CHANGE           | Namen ändern  | close_button | regression | blaude  | QANOV-594947 |
          | link           | link              | BUTTON_LINK           | NAME_CHANGE           | Namen ändern  | close_button | regression | blaude  | QANOV-594949 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | NAME_CHANGE           | Namen ändern  | close_button | regression | blaude  | QANOV-594950 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | NAME_CHANGE           | Namen ändern  | close_button | regression | blaude  | QANOV-594951 |
          | link           | primary_link      | PRIMARY_AND_LINK      | NAME_CHANGE           | Namen ändern  | close_button | regression | blaude  | QANOV-594952 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | NAME_CHANGE           | Namen ändern  | close_button | regression | blaude  | QANOV-594953 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | NAME_CHANGE           | Namen ändern  | close_button | regression | blaude  | QANOV-594954 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | NAME_CHANGE           | Namen ändern  | close_button | regression | blaude  | QANOV-594955 |
          | primary        | primary           | PRIMARY_BUTTON        | appointmentBookingUrl | Movistar      | back_button  | regression | moves   | QANOV-594956 |
          | secondary      | secondary         | SECONDARY_BUTTON      | appointmentBookingUrl | Movistar      | back_button  | regression | moves   | QANOV-594957 |
          | link           | link              | BUTTON_LINK           | appointmentBookingUrl | Movistar      | back_button  | sanity     | moves   | QANOV-594958 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | appointmentBookingUrl | Movistar      | back_button  | regression | moves   | QANOV-594959 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | appointmentBookingUrl | Movistar      | back_button  | regression | moves   | QANOV-594960 |
          | link           | primary_link      | PRIMARY_AND_LINK      | appointmentBookingUrl | Movistar      | back_button  | regression | moves   | QANOV-594961 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | appointmentBookingUrl | Movistar      | back_button  | regression | moves   | QANOV-594962 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | appointmentBookingUrl | Movistar      | back_button  | regression | moves   | QANOV-594963 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | appointmentBookingUrl | Movistar      | back_button  | regression | moves   | QANOV-594966 |
          | primary        | primary           | PRIMARY_BUTTON        | NAME_CHANGE           | Namen ändern  | close_button | regression | o2de    | QANOV-594967 |
          | secondary      | secondary         | SECONDARY_BUTTON      | NAME_CHANGE           | Namen ändern  | close_button | regression | o2de    | QANOV-594968 |
          | link           | link              | BUTTON_LINK           | NAME_CHANGE           | Namen ändern  | close_button | regression | o2de    | QANOV-594969 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | NAME_CHANGE           | Namen ändern  | close_button | regression | o2de    | QANOV-594970 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | NAME_CHANGE           | Namen ändern  | close_button | regression | o2de    | QANOV-594971 |
          | link           | primary_link      | PRIMARY_AND_LINK      | NAME_CHANGE           | Namen ändern  | close_button | regression | o2de    | QANOV-594972 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | NAME_CHANGE           | Namen ändern  | close_button | regression | o2de    | QANOV-594973 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | NAME_CHANGE           | Namen ändern  | close_button | regression | o2de    | QANOV-594974 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | NAME_CHANGE           | Namen ändern  | close_button | regression | o2de    | QANOV-594975 |
          | primary        | primary           | PRIMARY_BUTTON        | billing_card_invoices | Total billed  | back_button  | regression | o2uk    | QANOV-594976 |
          | secondary      | secondary         | SECONDARY_BUTTON      | billing_card_invoices | Total billed  | back_button  | regression | o2uk    | QANOV-594977 |
          | link           | link              | BUTTON_LINK           | billing_card_invoices | Total billed  | back_button  | regression | o2uk    | QANOV-594978 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | billing_card_invoices | Total billed  | back_button  | regression | o2uk    | QANOV-594979 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | billing_card_invoices | Total billed  | back_button  | regression | o2uk    | QANOV-594981 |
          | link           | primary_link      | PRIMARY_AND_LINK      | billing_card_invoices | Total billed  | back_button  | regression | o2uk    | QANOV-594982 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | billing_card_invoices | Total billed  | back_button  | regression | o2uk    | QANOV-594983 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | billing_card_invoices | Total billed  | back_button  | regression | o2uk    | QANOV-594984 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | billing_card_invoices | Total billed  | back_button  | regression | o2uk    | QANOV-594985 |
          | primary        | primary           | PRIMARY_BUTTON        | services-list         | Mais serviços | back_button  | regression | vivobr  | QANOV-594986 |
          | secondary      | secondary         | SECONDARY_BUTTON      | services-list         | Mais serviços | back_button  | regression | vivobr  | QANOV-594987 |
          | link           | link              | BUTTON_LINK           | services-list         | Mais serviços | back_button  | regression | vivobr  | QANOV-594988 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | services-list         | Mais serviços | back_button  | regression | vivobr  | QANOV-594989 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | services-list         | Mais serviços | back_button  | regression | vivobr  | QANOV-594990 |
          | link           | primary_link      | PRIMARY_AND_LINK      | services-list         | Mais serviços | back_button  | regression | vivobr  | QANOV-594991 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | services-list         | Mais serviços | back_button  | regression | vivobr  | QANOV-594992 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | services-list         | Mais serviços | back_button  | regression | vivobr  | QANOV-594993 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | services-list         | Mais serviços | back_button  | regression | vivobr  | QANOV-594994 |

  @jira.<jira_id> @<product> @automatic @e2e @jira.cv.24.2 @qa @regression @web @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_button_group_<button_type>_button_preconfigured_url
  Scenario Outline: A user clicks on the <button_element> button in a <button_type> simple button group when it is configured to open a preconfigured target in webapp
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And the "simple-button-group" configured in CMS has a "preconfigured" link to "<link>" destination
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     When clicks on the "simple_button_group.<button_element>_button" button
     Then the current URL contains "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | button_element | button_type       | field                 | link                  | destination_url                              | product | jira_id      |
          | primary        | primary           | PRIMARY_BUTTON        | NAME_CHANGE           | /pages/change-name                           | blaude  | QANOV-594995 |
          | secondary      | secondary         | SECONDARY_BUTTON      | NAME_CHANGE           | /pages/change-name                           | blaude  | QANOV-594996 |
          | link           | link              | BUTTON_LINK           | NAME_CHANGE           | /pages/change-name                           | blaude  | QANOV-594997 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | NAME_CHANGE           | /pages/change-name                           | blaude  | QANOV-594998 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | NAME_CHANGE           | /pages/change-name                           | blaude  | QANOV-594999 |
          | link           | primary_link      | PRIMARY_AND_LINK      | NAME_CHANGE           | /pages/change-name                           | blaude  | QANOV-595000 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | NAME_CHANGE           | /pages/change-name                           | blaude  | QANOV-595001 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | NAME_CHANGE           | /pages/change-name                           | blaude  | QANOV-595002 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | NAME_CHANGE           | /pages/change-name                           | blaude  | QANOV-595003 |
          | primary        | primary           | PRIMARY_BUTTON        | appointmentBookingUrl | /pages/appointment-booking/                  | moves   | QANOV-595004 |
          | secondary      | secondary         | SECONDARY_BUTTON      | appointmentBookingUrl | /pages/appointment-booking/                  | moves   | QANOV-595005 |
          | link           | link              | BUTTON_LINK           | appointmentBookingUrl | /pages/appointment-booking/                  | moves   | QANOV-595006 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | appointmentBookingUrl | /pages/appointment-booking/                  | moves   | QANOV-595007 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | appointmentBookingUrl | /pages/appointment-booking/                  | moves   | QANOV-595008 |
          | link           | primary_link      | PRIMARY_AND_LINK      | appointmentBookingUrl | /pages/appointment-booking/                  | moves   | QANOV-595009 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | appointmentBookingUrl | /pages/appointment-booking/                  | moves   | QANOV-595010 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | appointmentBookingUrl | /pages/appointment-booking/                  | moves   | QANOV-595011 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | appointmentBookingUrl | /pages/appointment-booking/                  | moves   | QANOV-595012 |
          | primary        | primary           | PRIMARY_BUTTON        | NAME_CHANGE           | /pages/change-name                           | o2de    | QANOV-595013 |
          | secondary      | secondary         | SECONDARY_BUTTON      | NAME_CHANGE           | /pages/change-name                           | o2de    | QANOV-595014 |
          | link           | link              | BUTTON_LINK           | NAME_CHANGE           | /pages/change-name                           | o2de    | QANOV-595015 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | NAME_CHANGE           | /pages/change-name                           | o2de    | QANOV-595016 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | NAME_CHANGE           | /pages/change-name                           | o2de    | QANOV-595017 |
          | link           | primary_link      | PRIMARY_AND_LINK      | NAME_CHANGE           | /pages/change-name                           | o2de    | QANOV-595018 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | NAME_CHANGE           | /pages/change-name                           | o2de    | QANOV-595019 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | NAME_CHANGE           | /pages/change-name                           | o2de    | QANOV-595023 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | NAME_CHANGE           | /pages/change-name                           | o2de    | QANOV-595024 |
          | primary        | primary           | PRIMARY_BUTTON        | billing_card_invoices | /start-tab-invoices-details                  | o2uk    | QANOV-595025 |
          | secondary      | secondary         | SECONDARY_BUTTON      | billing_card_invoices | /start-tab-invoices-details                  | o2uk    | QANOV-595026 |
          | link           | link              | BUTTON_LINK           | billing_card_invoices | /start-tab-invoices-details                  | o2uk    | QANOV-595027 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | billing_card_invoices | /start-tab-invoices-details                  | o2uk    | QANOV-595028 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | billing_card_invoices | /start-tab-invoices-details                  | o2uk    | QANOV-595029 |
          | link           | primary_link      | PRIMARY_AND_LINK      | billing_card_invoices | /start-tab-invoices-details                  | o2uk    | QANOV-595030 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | billing_card_invoices | /start-tab-invoices-details                  | o2uk    | QANOV-595031 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | billing_card_invoices | /start-tab-invoices-details                  | o2uk    | QANOV-595032 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | billing_card_invoices | /start-tab-invoices-details                  | o2uk    | QANOV-595033 |
          | primary        | primary           | PRIMARY_BUTTON        | services-list         | /pages/services-list/?web_view_mode=settings | vivobr  | QANOV-595034 |
          | secondary      | secondary         | SECONDARY_BUTTON      | services-list         | /pages/services-list/?web_view_mode=settings | vivobr  | QANOV-595035 |
          | link           | link              | BUTTON_LINK           | services-list         | /pages/services-list/?web_view_mode=settings | vivobr  | QANOV-595036 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | services-list         | /pages/services-list/?web_view_mode=settings | vivobr  | QANOV-595037 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | services-list         | /pages/services-list/?web_view_mode=settings | vivobr  | QANOV-595038 |
          | link           | primary_link      | PRIMARY_AND_LINK      | services-list         | /pages/services-list/?web_view_mode=settings | vivobr  | QANOV-595039 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | services-list         | /pages/services-list/?web_view_mode=settings | vivobr  | QANOV-595040 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | services-list         | /pages/services-list/?web_view_mode=settings | vivobr  | QANOV-595041 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | services-list         | /pages/services-list/?web_view_mode=settings | vivobr  | QANOV-595042 |

  @jira.<jira_id> @<product> @android @automatic @e2e @ios @jira.cv.24.2 @mobile @qa @smoke
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_button_group_<button_type>_button
  Scenario Outline: A user clicks on the <button_element> button in a <button_type> simple button group when it is configured to open a manual URL
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And the "simple-button-group" configured in CMS has the "<button_url>ButtonUrl" field with a "urlAddress" link to "[CONTEXT:simple_button_group.<button_url>ButtonUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     When clicks on the "simple_button_group.<button_element>_button" button
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | button_element | button_type       | field                 | button_url | product | jira_id      |
          | primary        | primary           | PRIMARY_BUTTON        | first      | blaude  | QANOV-595044 |
          | secondary      | secondary         | SECONDARY_BUTTON      | first      | blaude  | QANOV-595045 |
          | link           | link              | BUTTON_LINK           | first      | blaude  | QANOV-595046 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | first      | blaude  | QANOV-595047 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | second     | blaude  | QANOV-595048 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | first      | blaude  | QANOV-595049 |
          | link           | primary_link      | PRIMARY_AND_LINK      | second     | blaude  | QANOV-595050 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | first      | blaude  | QANOV-595051 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | second     | blaude  | QANOV-595052 |
          | primary        | primary           | PRIMARY_BUTTON        | first      | moves   | QANOV-595053 |
          | secondary      | secondary         | SECONDARY_BUTTON      | first      | moves   | QANOV-595054 |
          | link           | link              | BUTTON_LINK           | first      | moves   | QANOV-595055 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | first      | moves   | QANOV-595056 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | second     | moves   | QANOV-595057 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | first      | moves   | QANOV-595058 |
          | link           | primary_link      | PRIMARY_AND_LINK      | second     | moves   | QANOV-595059 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | first      | moves   | QANOV-595060 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | second     | moves   | QANOV-595061 |
          | primary        | primary           | PRIMARY_BUTTON        | first      | o2de    | QANOV-595062 |
          | secondary      | secondary         | SECONDARY_BUTTON      | first      | o2de    | QANOV-595063 |
          | link           | link              | BUTTON_LINK           | first      | o2de    | QANOV-595064 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | first      | o2de    | QANOV-595065 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | second     | o2de    | QANOV-595066 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | first      | o2de    | QANOV-595067 |
          | link           | primary_link      | PRIMARY_AND_LINK      | second     | o2de    | QANOV-595068 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | first      | o2de    | QANOV-595070 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | second     | o2de    | QANOV-595071 |
          | primary        | primary           | PRIMARY_BUTTON        | first      | o2uk    | QANOV-595072 |
          | secondary      | secondary         | SECONDARY_BUTTON      | first      | o2uk    | QANOV-595073 |
          | link           | link              | BUTTON_LINK           | first      | o2uk    | QANOV-595074 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | first      | o2uk    | QANOV-595075 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | second     | o2uk    | QANOV-595076 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | first      | o2uk    | QANOV-595077 |
          | link           | primary_link      | PRIMARY_AND_LINK      | second     | o2uk    | QANOV-595078 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | first      | o2uk    | QANOV-595079 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | second     | o2uk    | QANOV-595080 |
          | primary        | primary           | PRIMARY_BUTTON        | first      | vivobr  | QANOV-595081 |
          | secondary      | secondary         | SECONDARY_BUTTON      | first      | vivobr  | QANOV-595082 |
          | link           | link              | BUTTON_LINK           | first      | vivobr  | QANOV-595083 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | first      | vivobr  | QANOV-595084 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | second     | vivobr  | QANOV-595085 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | first      | vivobr  | QANOV-595086 |
          | link           | primary_link      | PRIMARY_AND_LINK      | second     | vivobr  | QANOV-595087 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | first      | vivobr  | QANOV-595088 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | second     | vivobr  | QANOV-595089 |

  @jira.<jira_id> @<product> @automatic @e2e @jira.cv.24.2 @qa @regression @web @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_button_group_<button_type>_button
  Scenario Outline: A user clicks on the <button_element> button in a <button_type> simple button group when it is configured to open a manual URL in webapp
    To be executed in QA
    Given the "simple-button-group" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-button-group" module configured in CMS has the "buttonGroupType" field with "<field>" value
      And the "simple-button-group" configured in CMS has the "<button_url>ButtonUrl" field with a "urlAddress" link to "[CONTEXT:simple_button_group.<button_url>ButtonUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_button_group" element is visible
     When clicks on the "simple_button_group.<button_element>_button" button
     Then the current URL contains "<destination>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | button_element | button_type       | field                 | button_url | destination                    | product | jira_id      |
          | primary        | primary           | PRIMARY_BUTTON        | first      | https://www.telefonica.com/ | blaude  | QANOV-595090 |
          | secondary      | secondary         | SECONDARY_BUTTON      | first      | https://www.telefonica.com/ | blaude  | QANOV-595091 |
          | link           | link              | BUTTON_LINK           | first      | https://www.telefonica.com/ | blaude  | QANOV-595092 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | first      | https://www.telefonica.com/ | blaude  | QANOV-595093 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | second     | https://www.google.com/     | blaude  | QANOV-595094 |
          | link           | primary_link      | PRIMARY_AND_LINK      | second     | https://www.google.com/     | blaude  | QANOV-595095 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | first      | https://www.telefonica.com/ | blaude  | QANOV-595096 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | first      | https://www.telefonica.com/ | blaude  | QANOV-595097 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | second     | https://www.google.com/     | blaude  | QANOV-595098 |
          | primary        | primary           | PRIMARY_BUTTON        | first      | https://www.telefonica.com/ | moves   | QANOV-595099 |
          | secondary      | secondary         | SECONDARY_BUTTON      | first      | https://www.telefonica.com/ | moves   | QANOV-595100 |
          | link           | link              | BUTTON_LINK           | first      | https://www.telefonica.com/ | moves   | QANOV-595101 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | first      | https://www.telefonica.com/ | moves   | QANOV-595102 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | second     | https://www.google.com/     | moves   | QANOV-595103 |
          | link           | primary_link      | PRIMARY_AND_LINK      | second     | https://www.google.com/     | moves   | QANOV-595104 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | first      | https://www.telefonica.com/ | moves   | QANOV-595105 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | first      | https://www.telefonica.com/ | moves   | QANOV-595106 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | second     | https://www.google.com/     | moves   | QANOV-595107 |
          | primary        | primary           | PRIMARY_BUTTON        | first      | https://www.telefonica.com/ | o2de    | QANOV-595108 |
          | secondary      | secondary         | SECONDARY_BUTTON      | first      | https://www.telefonica.com/ | o2de    | QANOV-595109 |
          | link           | link              | BUTTON_LINK           | first      | https://www.telefonica.com/ | o2de    | QANOV-595110 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | first      | https://www.telefonica.com/ | o2de    | QANOV-595111 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | second     | https://www.google.com/     | o2de    | QANOV-595112 |
          | link           | primary_link      | PRIMARY_AND_LINK      | second     | https://www.google.com/     | o2de    | QANOV-595113 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | first      | https://www.telefonica.com/ | o2de    | QANOV-595114 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | first      | https://www.telefonica.com/ | o2de    | QANOV-595115 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | second     | https://www.google.com/     | o2de    | QANOV-595116 |
          | primary        | primary           | PRIMARY_BUTTON        | first      | https://www.telefonica.com/ | o2uk    | QANOV-595118 |
          | secondary      | secondary         | SECONDARY_BUTTON      | first      | https://www.telefonica.com/ | o2uk    | QANOV-595119 |
          | link           | link              | BUTTON_LINK           | first      | https://www.telefonica.com/ | o2uk    | QANOV-595120 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | first      | https://www.telefonica.com/ | o2uk    | QANOV-595121 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | second     | https://www.google.com/     | o2uk    | QANOV-595122 |
          | link           | primary_link      | PRIMARY_AND_LINK      | second     | https://www.google.com/     | o2uk    | QANOV-595124 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | first      | https://www.telefonica.com/ | o2uk    | QANOV-595125 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | first      | https://www.telefonica.com/ | o2uk    | QANOV-595126 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | second     | https://www.google.com/     | o2uk    | QANOV-595127 |
          | primary        | primary           | PRIMARY_BUTTON        | first      | https://www.telefonica.com/ | vivobr  | QANOV-595128 |
          | secondary      | secondary         | SECONDARY_BUTTON      | first      | https://www.telefonica.com/ | vivobr  | QANOV-595129 |
          | link           | link              | BUTTON_LINK           | first      | https://www.telefonica.com/ | vivobr  | QANOV-595130 |
          | primary        | primary_secondary | PRIMARY_AND_SECONDARY | first      | https://www.telefonica.com/ | vivobr  | QANOV-595131 |
          | secondary      | primary_secondary | PRIMARY_AND_SECONDARY | second     | https://www.google.com/     | vivobr  | QANOV-595132 |
          | link           | primary_link      | PRIMARY_AND_LINK      | second     | https://www.google.com/     | vivobr  | QANOV-595133 |
          | primary        | primary_link      | PRIMARY_AND_LINK      | first      | https://www.telefonica.com/ | vivobr  | QANOV-595134 |
          | secondary      | secondary_link    | SECONDARY_AND_LINK    | first      | https://www.telefonica.com/ | vivobr  | QANOV-595135 |
          | link           | secondary_link    | SECONDARY_AND_LINK    | second     | https://www.google.com/     | vivobr  | QANOV-595136 |
