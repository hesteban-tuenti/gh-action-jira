# -*- coding: utf-8 -*-
@jira.QANOV-9136
Feature: Channel list

  Actions Before the Feature:
    Given user has a "tv" product


  @jira.QANOV-9137 @android @automatic @ber @cert2 @ios @jira.cv.10.4 @jira.link.relates_to.NOV-52865 @live @mobile @moves
  @next @qa @sanity @webapp
  Scenario: User can access to the "channels" tab contained in a selected pack
    commented_tags="@depends_on.NOV-52861"
    other_affected_versions="2021-28-b"
    Given user has a television "package"
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "TV Dashboard" page
     When clicks on the selected tv pack
     Then the "Detail Products Subscribed" page is displayed
      And the "channels_list" list is displayed
      And each element in the "channels_list" list has the "icon" field
      And each element in the "channels_list" list has the "name" field

  @jira.QANOV-419516 @android @ios @jira.cv.10.4 @manual @mobile @moves @regression
  Scenario: Non promotion channels have a dial number
    Promo channels: Netflix, DAZN, Disney
    Given user does not have a television "promo" pack
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "TV Dashboard" page
     When clicks on the selected tv pack
     Then the "Detail Products Subscribed" page is displayed
      And each element in the channel list has the dial number

  @jira.QANOV-9138 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-52869 @manual @mobile @moves @smoke
  Scenario: User can access to the "channel detail" screen
    commented_tags="@depends_on.NOV-52861"
    other_affected_versions="2021-28-b"
    Given user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "TV Dashboard" page
     When clicks on the "any" TV product in the purchased products carousel
      And the "Detail Products Subscribed" page is displayed
      And clicks on the "any_channel" entrypoint
     Then the "Detail Channel" page is displayed
      And the "Detalle del canal" header is displayed
      And the "tv_channels" carousel is displayed
      And the "title" textfield for the selected "channel" is displayed
      And the "dial_number" textfield with the "Dial XX" format is displayed
      And the "category" textfield for the selected "channel" is displayed
      And the "channel_icon" icon is displayed
      And the "description" textfield is displayed

  @jira.QANOV-9139 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-53472 @manual @mobile @moves @regression
  Scenario: User can switch among the different channels of a TV pack
    commented_tags="@depends_on.NOV-52861"
    other_affected_versions="2021-28-b"
    Given user has the matching subscription selected in the account
      And user is in the "TV Dashboard" page
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
     When clicks on the "any" TV product in the purchased products carousel
      And the "Detail Products Subscribed" page is displayed
      And clicks on the "any_channel" entrypoint
      And user is in the "Detail Channel" page
      And clicks on a different item in the "tv_channels" carousel
     Then the "title" textfield for the selected "channel" is displayed
      And the "dial_number" textfield with the "Dial XX" format is displayed
      And the "category" textfield for the selected "channel" is displayed
      And the "channel_icon" icon is displayed
      And the "description" textfield is displayed
