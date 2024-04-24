# -*- coding: utf-8 -*-
@jira.QANOV-127083
Feature: App rating feedback

  Actions Before the Feature:
    Given app rating is "enabled"

  Actions After the Feature:
     Then app rating is "disabled"


  @jira.<jira_id> @android @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-137082
  @mobile @regression @vivobr
  Scenario Outline: Vivo user can close the feedback screen without sending it in Android devices
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user is in the "Explore" page
      And the App Rating popup is displayed
     When clicks on "1" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Explore" page is displayed

    @automatic @qa
    Examples:
          | account_type | number_plans | cv   | parent_test_plan | jira_id    |
          | legacy       | 1            | 11.3 |                  | QANOV-8901 |

    @automatic @live @next
    Examples:
          | account_type | number_plans | cv   | parent_test_plan | jira_id    |
          | beatrix      | any          | 11.3 |                  | QANOV-8902 |

    @manual
    Examples:
          | account_type | number_plans | cv   | parent_test_plan | jira_id      |
          | jeri         | 1            | 13.6 | QANOV-226748     | QANOV-228892 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-137082 @mobile @regression
  Scenario Outline: A <product> user can close the feedback screen without sending it in Android devices
    Given user is in the "Support" page
      And the App Rating popup is displayed
     When clicks on "1" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Support" page is displayed

    @automatic @cert0 @cert1 @cert2 @live @next
    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 11.3 | QANOV-8906 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.5 | QANOV-375539 |
          | o2de    | 14.5 | QANOV-375540 |

  @jira.<jira_id> @<test_priority> @android @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-137077 @mobile @vivobr @<har>
  Scenario Outline: Vivo user can send feedback after a negative rating in Android devices
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user is in the "Explore" page
      And the App Rating popup is displayed
     When clicks on "<number_stars>" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And fills the "input_text" inputtext with the "App rating test" text
      And clicks on the "send_button" button
     Then the "App Rating Feedback Success" page is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "title" textfield with "[LANG:app_rating.feedback_success.title]" text is displayed
      And the "text" textfield with "[LANG:app_rating.feedback_success.subtitle]" text is displayed
      And the "close_button" button with "[LANG:app_rating.feedback_success.close_button]" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Explore" page is displayed

    @automatic @qa
    Examples:
          | account_type | number_stars | number_plans | test_priority | cv   | har  |parent_test_plan | jira_id    |
          | legacy       | 1            | 1            | regression    | 11.3 |      |                 | QANOV-8880 |
          | legacy       | 2            | 1            | regression    | 11.3 |      |                 | QANOV-8882 |
          | legacy       | 3            | 1            | smoke         | 11.3 |      |                 | QANOV-8883 |

    @automatic @live @next
    Examples:
          | account_type | number_stars | number_plans | test_priority | cv   | har  |parent_test_plan | jira_id    |
          | beatrix      | 1            | any          | smoke         | 11.3 | har  |                 | QANOV-8885 |
          | beatrix      | 2            | any          | sanity        | 11.3 |      |                 | QANOV-8887 |
          | beatrix      | 3            | any          | regression    | 11.3 |      |                 | QANOV-8888 |

    @manual
    Examples:
          | account_type | number_stars | number_plans | test_priority | cv   |  har  |parent_test_plan | jira_id      |
          | jeri         | 3            | 1            | smoke         | 13.6 |       |QANOV-226748     | QANOV-228891 |

  @jira.<jira_id> @<product> @<test_priority> @android @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.relates_to.NOV-137077 @mobile
  Scenario Outline: A <product> user can send feedback after a negative rating in Android devices
    Given user is in the "Support" page
      And the App Rating popup is displayed
     When clicks on "<number_stars>" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And fills the "input_text" inputtext with the "<text_feedback>" text
      And clicks on the "send_button" button
     Then the "Feedback" page is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "title" textfield with "[LANG:app_rating.feedback_success.title]" text is displayed
      And the "message" textfield with "[LANG:app_rating.feedback_success.subtitle]" text is displayed
      And the "main_button" button with "[LANG:app_rating.feedback_success.close_button]" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

    @automatic @cert0 @cert1 @cert2 @live @next
    Examples:
          | product | cv   | number_stars | text_feedback   | test_priority | detects | jira_id    |
          | o2uk    | 11.3 | 1            | App rating test | sanity        |         | QANOV-8895 |

    @automatic @cert0 @cert1 @cert2 @live @next
    Examples:
          | product | cv   | number_stars | text_feedback   | test_priority | detects | jira_id    |
          | o2uk    | 11.3 | 2            | App rating test | smoke         |         | QANOV-8897 |
          | o2uk    | 11.3 | 3            | App rating test | regression    |         | QANOV-8899 |

    @automatic @cert3 @live @next @har
    Examples:
          | product | cv   | number_stars | text_feedback   | test_priority | detects | jira_id      |
          | blaude  | 14.5 | 1            | App rating test | sanity        |         | QANOV-375570 |

    @automatic @live @next @har
    Examples:
          | product | cv   | number_stars | text_feedback   | test_priority | detects | jira_id      |
          | o2de    | 14.5 | 3            | App rating test | smoke         |         | QANOV-375581 |

    @manual
    Examples:
          | product | cv   | number_stars | text_feedback                                                                                                                                                                                                                                                                                                                                                 | test_priority | detects | jira_id      |
          | blaude  | 14.5 | 2            | App rating test                                                                                                                                                                                                                                                                                                                                               | regression    |         | QANOV-375571 |
          | blaude  | 14.5 | 3            | App rating test                                                                                                                                                                                                                                                                                                                                               | smoke         |         | QANOV-375572 |
          | blaude  | 14.5 | 1            | This is a feedback with more than 300 characters:Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure d | regression    |         | QANOV-375573 |
          | blaude  | 14.5 | 2            | This is a feedback with more than 300 characters:Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure d | regression    |         | QANOV-375574 |
          | blaude  | 14.5 | 3            | This is a feedback with more than 300 characters:Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure d | regression    |         | QANOV-375575 |
          | blaude  | 14.5 | 1            | empty                                                                                                                                                                                                                                                                                                                                                         | regression    |         | QANOV-375576 |
          | blaude  | 14.5 | 2            | empty                                                                                                                                                                                                                                                                                                                                                         | regression    |         | QANOV-375577 |
          | blaude  | 14.5 | 3            | empty                                                                                                                                                                                                                                                                                                                                                         | regression    |         | QANOV-375578 |
          | o2de    | 14.5 | 1            | App rating test                                                                                                                                                                                                                                                                                                                                               | sanity        |         | QANOV-375579 |
          | o2de    | 14.5 | 2            | App rating test                                                                                                                                                                                                                                                                                                                                               | regression    |         | QANOV-375580 |
          | o2de    | 14.5 | 1            | This is a feedback with more than 300 characters:Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure d | regression    |         | QANOV-375582 |
          | o2de    | 14.5 | 2            | This is a feedback with more than 300 characters:Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure d | regression    |         | QANOV-375583 |
          | o2de    | 14.5 | 3            | This is a feedback with more than 300 characters:Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure d | regression    |         | QANOV-375584 |
          | o2de    | 14.5 | 1            | empty                                                                                                                                                                                                                                                                                                                                                         | regression    |         | QANOV-375585 |
          | o2de    | 14.5 | 2            | empty                                                                                                                                                                                                                                                                                                                                                         | regression    |         | QANOV-375586 |
          | o2de    | 14.5 | 3            | empty                                                                                                                                                                                                                                                                                                                                                         | regression    |         | QANOV-375587 |

  @jira.<jira_id> @android @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-137066
  @mobile @regression @vivobr
  Scenario Outline: Vivo user can go back to the previous tab after providing feedback in Android devices
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user is in the "Explore" page
      And the App Rating popup is displayed
     When clicks on "1" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And fills the "input_text" inputtext with the "App rating test" text
      And clicks on the "send_button" button
      And the "App Rating Feedback Success" page is displayed
      And clicks on the "close_button" button
     Then the "Explore" page is displayed

    @automatic @qa
    Examples:
          | account_type | number_plans | cv   | parent_test_plan | jira_id    |
          | legacy       | 1            | 11.3 |                  | QANOV-8907 |

    @automatic @live @next @har
    Examples:
          | account_type | number_plans | cv   | parent_test_plan | jira_id    |
          | beatrix      | any          | 11.3 |                  | QANOV-8909 |

    @manual
    Examples:
          | account_type | number_plans | cv   | parent_test_plan | jira_id      |
          | jeri         | 1            | 13.6 | QANOV-226748     | QANOV-228893 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-137066 @mobile @regression
  Scenario Outline: A <product> user can go back to the previous tab after providing feedback in Android devices
    Given user is in the "Support" page
      And the App Rating popup is displayed
      And clicks on "1" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And fills the "input_text" inputtext with the "App rating test" text
      And clicks on the "send_button" button
      And the "Feedback" page is displayed
      And clicks on the "main_button" button
     Then the "Support" page is displayed

    @automatic @cert0 @cert1 @cert2 @live @next
    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 11.3 | QANOV-8912 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.5 | QANOV-375588 |
          | o2de    | 14.5 | QANOV-375589 |
