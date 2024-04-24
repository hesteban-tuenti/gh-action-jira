# -*- coding: utf-8 -*-
@jira.QANOV-389223
Feature: Virtual modules

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-386148 @manual @mobile
  Scenario Outline: User can see a <module_type> module included in a Virtual module
    This is an example. The virtual modules have a container with a certain configuration injected via API Content v4,
    this module will have the modules and cards defined in the container.
    It should be validated for each type of module.
    Given user has a virtual module with a container associated in the Explore tab
      And the container has a "<module_type>" module
     When searches the "module"
     Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text

    @smoke
    Examples:
          | product | module_type      | jira_id      |
          | vivobr  | featured_content | QANOV-389224 |
          | moves   | featured_content | QANOV-389225 |
          | blaude  | featured_content | QANOV-389226 |
          | o2uk    | featured_content | QANOV-389227 |
          | o2de    | featured_content | QANOV-389228 |
          | o2es    | featured_content | QANOV-389229 |

    @regression
    Examples:
          | product | module_type       | jira_id      |
          | vivobr  | vertical_cards    | QANOV-422079 |
          | vivobr  | rows              | QANOV-422085 |
          | vivobr  | banner            | QANOV-422091 |
          | vivobr  | highlighted_cards | QANOV-422097 |
          | vivobr  | data_cards        | QANOV-422103 |
          | vivobr  | display_cards     | QANOV-422109 |
          | vivobr  | banner_hero       | QANOV-422115 |
          | moves   | vertical_cards    | QANOV-422080 |
          | moves   | rows              | QANOV-422086 |
          | moves   | banner            | QANOV-422092 |
          | moves   | highlighted_cards | QANOV-422098 |
          | moves   | data_cards        | QANOV-422104 |
          | moves   | display_cards     | QANOV-422110 |
          | moves   | banner_hero       | QANOV-422116 |
          | blaude  | vertical_cards    | QANOV-422081 |
          | blaude  | rows              | QANOV-422087 |
          | blaude  | banner            | QANOV-422093 |
          | blaude  | highlighted_cards | QANOV-422099 |
          | blaude  | data_cards        | QANOV-422105 |
          | blaude  | display_cards     | QANOV-422111 |
          | blaude  | banner_hero       | QANOV-422117 |
          | o2uk    | vertical_cards    | QANOV-422082 |
          | o2uk    | rows              | QANOV-422088 |
          | o2uk    | banner            | QANOV-422094 |
          | o2uk    | highlighted_cards | QANOV-422100 |
          | o2uk    | data_cards        | QANOV-422106 |
          | o2uk    | display_cards     | QANOV-422112 |
          | o2uk    | banner_hero       | QANOV-422118 |
          | o2de    | vertical_cards    | QANOV-422083 |
          | o2de    | rows              | QANOV-422089 |
          | o2de    | banner            | QANOV-422095 |
          | o2de    | highlighted_cards | QANOV-422101 |
          | o2de    | data_cards        | QANOV-422107 |
          | o2de    | display_cards     | QANOV-422113 |
          | o2de    | banner_hero       | QANOV-422119 |
          | o2es    | vertical_cards    | QANOV-422084 |
          | o2es    | rows              | QANOV-422090 |
          | o2es    | banner            | QANOV-422096 |
          | o2es    | highlighted_cards | QANOV-422102 |
          | o2es    | data_cards        | QANOV-422108 |
          | o2es    | display_cards     | QANOV-422114 |
          | o2es    | banner_hero       | QANOV-422120 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-386148 @manual @mobile
  Scenario Outline: User can see a card from a <module_type> module included in a Virtual module
    This is an example. The virtual modules have a container with a certain configuration injected via API Content v4,
    this module will have the modules and cards defined in the container.
    It should be validated for each type of module.
    Given user has a virtual module with a container associated in the Explore tab
      And the container has a "<module_type>" module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "description" field with "[CONTEXT:card_description]" text

    @ber @sanity
    Examples:
          | product | module_type      | jira_id      |
          | vivobr  | featured_content | QANOV-389230 |
          | moves   | featured_content | QANOV-389231 |
          | blaude  | featured_content | QANOV-389232 |
          | o2uk    | featured_content | QANOV-389233 |
          | o2de    | featured_content | QANOV-389234 |
          | o2es    | featured_content | QANOV-389235 |

    @regression
    Examples:
          | product | module_type       | jira_id      |
          | vivobr  | vertical_cards    | QANOV-422121 |
          | vivobr  | rows              | QANOV-422127 |
          | vivobr  | banner            | QANOV-422133 |
          | vivobr  | highlighted_cards | QANOV-422139 |
          | vivobr  | data_cards        | QANOV-422145 |
          | vivobr  | display_cards     | QANOV-422151 |
          | vivobr  | banner_hero       | QANOV-422157 |
          | moves   | vertical_cards    | QANOV-422122 |
          | moves   | rows              | QANOV-422128 |
          | moves   | banner            | QANOV-422134 |
          | moves   | highlighted_cards | QANOV-422140 |
          | moves   | data_cards        | QANOV-422146 |
          | moves   | display_cards     | QANOV-422152 |
          | moves   | banner_hero       | QANOV-422158 |
          | blaude  | vertical_cards    | QANOV-422123 |
          | blaude  | rows              | QANOV-422129 |
          | blaude  | banner            | QANOV-422135 |
          | blaude  | highlighted_cards | QANOV-422141 |
          | blaude  | data_cards        | QANOV-422147 |
          | blaude  | display_cards     | QANOV-422153 |
          | blaude  | banner_hero       | QANOV-422159 |
          | o2uk    | vertical_cards    | QANOV-422124 |
          | o2uk    | rows              | QANOV-422130 |
          | o2uk    | banner            | QANOV-422136 |
          | o2uk    | highlighted_cards | QANOV-422142 |
          | o2uk    | data_cards        | QANOV-422148 |
          | o2uk    | display_cards     | QANOV-422154 |
          | o2uk    | banner_hero       | QANOV-422160 |
          | o2de    | vertical_cards    | QANOV-422125 |
          | o2de    | rows              | QANOV-422131 |
          | o2de    | banner            | QANOV-422137 |
          | o2de    | highlighted_cards | QANOV-422143 |
          | o2de    | data_cards        | QANOV-422149 |
          | o2de    | display_cards     | QANOV-422155 |
          | o2de    | banner_hero       | QANOV-422161 |
          | o2es    | vertical_cards    | QANOV-422126 |
          | o2es    | rows              | QANOV-422132 |
          | o2es    | banner            | QANOV-422138 |
          | o2es    | highlighted_cards | QANOV-422144 |
          | o2es    | data_cards        | QANOV-422150 |
          | o2es    | display_cards     | QANOV-422156 |
          | o2es    | banner_hero       | QANOV-422162 |
