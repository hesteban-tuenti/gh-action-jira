# -*- coding: utf-8 -*-
@jira.QANOV-127443
Feature: Youtube support in explore no connectivity

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-136551 @manual @mobile @regression
  Scenario Outline: User without data connectivity cannot play a video in Explore tab
    internal_checkpoint="Player behaviour:
    for iOS devices a black screen with a close button will be shown
    for Android devices a loading spinner will be shown at the center of the player"
    Given user has a card with a "valid" youtube link configured in the CMS
      And user has accepted the zero rating alert since logged in
      And user turns on the Airplane mode
     When clicks on the explore item
     Then the video is not reproduced

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | vivobr  | 13.3   | QANOV-10905  | QANOV-10987  |
          | o2uk    | 13.3   | QANOV-10913  | QANOV-10989  |
          | moves   | 13.3   | QANOV-10921  | QANOV-10991  |
          | blaude  | 13.9   | QANOV-228422 | QANOV-228447 |
          | o2de    | 14.2   | QANOV-49167  | QANOV-49175  |
          | o2es    | Future |              | QANOV-407314 |
