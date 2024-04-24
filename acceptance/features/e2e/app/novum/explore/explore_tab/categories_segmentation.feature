# -*- coding: utf-8 -*-
@jira.QANOV-228715
Feature: Categories segmentation

  Actions Before each Scenario:
    Given user is in the "Explore" page

  Actions After each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @sanity @ber
  Scenario Outline: User belonging to a given audience will see the cards included in the category that has been segmented with this audience
    To execute this scenario automatically a category(QACategory) with a segment has been created in the QA environment CMS
    Given an explore category has been segmented with an audience
      And user belongs to the audience
     When opens the "[CONTEXT:category_name]" Explore category
      And the "Explore Category" page is displayed
     Then the cards belonging to the segmented category are displayed

    @automatic @qa @webapp @old_app
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228716 |
          | moves   | 13.5 | QANOV-228717 |
          | o2uk    | 13.5 | QANOV-228718 |
          | blaude  | 13.9 | QANOV-257957 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-228719 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: User not belonging to a given audience won't see the cards included in a category that has been segmented with this audience
    Given an explore category has been segmented with an audience
      And user does not belong to the audience
      And there is content for the segmented category
     Then the categories carousel does not show the segmented category
      And the cards belonging to the segmented category are not displayed

    @old_app
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228720 |

    Examples:
          | product | cv   | jira_id      |
          | moves   | 13.5 | QANOV-228721 |
          | o2uk    | 13.5 | QANOV-228722 |
          | blaude  | 13.9 | QANOV-257958 |
          | o2de    | 14.2 | QANOV-228723 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User not belonging to a given audience won't see a module having only cards included in a category that has been segmented with this audience
    Given an explore category has been segmented with an audience
      And user does not belong to the audience
      And there is a module only containing cards for the segmented category
     Then the categories carousel does not show the segmented category
      And the module is not displayed

    @old_app
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228724 |

    Examples:
          | product | cv   | jira_id      |
          | moves   | 13.5 | QANOV-228725 |
          | o2uk    | 13.5 | QANOV-228726 |
          | blaude  | 13.9 | QANOV-257959 |
          | o2de    | 14.2 | QANOV-228727 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User not belonging to a given audience will see the cards included in a category that has been segmented if they are associated to other not segmented categories
    Given an explore category has been segmented with an audience
      And another explore category hasn't been segmented
      And user does not belong to the audience
      And there is content associated to the segmented category and to the not-segmented
     Then the categories carousel does not show the segmented category
      And the cards associated to both categories are displayed

    @old_app
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228728 |

    Examples:
          | product | cv   | jira_id      |
          | moves   | 13.5 | QANOV-228729 |
          | o2uk    | 13.5 | QANOV-228730 |
          | blaude  | 13.9 | QANOV-257960 |
          | o2de    | 14.2 | QANOV-228731 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User will see the cards in categories segmented with audience B and A, when she belongs to audience B.
    Given an explore category has been segmented with an audience A
      And an explore category has been segmented with an audience B
      And user belongs to the audience B
      And there is content associated to the audience A and audience B
      And there is content associated only to the audience A
     Then the categories carousel does not show the segmented category A
      And the cards associated to both categories are displayed

    @old_app
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228732 |

    Examples:
          | product | cv   | jira_id      |
          | moves   | 13.5 | QANOV-228733 |
          | o2uk    | 13.5 | QANOV-228734 |
          | blaude  | 13.9 | QANOV-257961 |
          | o2de    | 14.2 | QANOV-228735 |
