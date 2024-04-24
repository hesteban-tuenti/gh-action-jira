# -*- coding: utf-8 -*-
@jira.QANOV-9186
Feature: Functionalities included in TV pack

  Actions Before the Feature:
    Given user has a "tv" product


  @jira.QANOV-9187 @android @automatic @ber @cert2 @ios @jira.cv.10.4 @jira.link.relates_to.NOV-53516 @live @mobile @moves
  @next @qa @smoke
  Scenario: User can access to the "Included functionalities" screen from the TV dashboard
    internal_checkpoint="NOTE: Some functionalities will have the 'More information' link, verified in a different
    test case"
    commented_tags="@depends_on.NOV-52861"
    Given user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-functionalities" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
      And stores the text value from the "functionality_name" field of "included_functionalities_list" list with "any" index
     When clicks on any element in the "included_functionalities_list" list with the "functionality_name" field that contains the "[CONTEXT:functionality_name]" text
     Then the "Included Functionalities" page is displayed
      And the "Funcionalidades incluidas" header is displayed
      And the "included_functionalities_list" carousel is displayed
      And the card with text "[CONTEXT:functionality_name]" of the "included_functionalities_list" carousel is shown highlighted
      And the "functionality_title" textfield with "[CONTEXT:functionality_name]" text is displayed
      And the "functionality_description" textfield is displayed

  @jira.QANOV-9188 @android @ios @jira.cv.10.4 @manual @mobile @moves @regression
  Scenario: User can see the "More info" link in the included functionalities screen
    commented_tags="@depends_on.NOV-52861"
    Given user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-functionalities" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "included_functionality_with_more_info_link" link
     Then the "Included Functionalities" page is displayed
      And the "more_info" link with "Más información" text is displayed

  @jira.QANOV-9189 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-52866 @manual @mobile @moves @regression
  Scenario: User can access to the "Additional information" tab contained in a selected pack
    commented_tags="@depends_on.NOV-52862"
    Given user is subscribed to a TV pack with included functionalities
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-functionalities" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "pack_with_included_functionalities" TV product
      And the "Detail Products Subscribed" page is displayed
      And clicks on the "more_info_tab" link
     Then the "additional_description" textfield is displayed
      And the "included_functionalities_title" textfield with "Funcionalidades incluidas" text is displayed
      And the "included_functionalities_list" list is displayed

  @jira.QANOV-9190 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-53473 @manual @mobile @moves @regression
  Scenario: User can access to the "Included functionalities" screen from the "detailed TV packs" screen
    internal_checkpoint="NOTE: Some functionalities will have the 'More information' link, verified in a different
    test case"
    commented_tags="@depends_on.NOV-52862"
    Given user is subscribed to a TV pack with included functionalities
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-functionalities" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "pack_with_included_functionalities" TV product
      And the "Detail Products Subscribed" page is displayed
      And clicks on the "more_info_tab" link
      And clicks on the "any_included_functionality" link
     Then the "Included Functionalities" page is displayed
      And the "Funcionalidades incluidas" header is displayed
      And the "included_functionalities_list" carousel is displayed
      And the selected functionality is highlighted
      And the "functionality_title" textfield is displayed
      And the "functionality_description" textfield is displayed

  @jira.QANOV-9191 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-9187 @jira.link.depends_on.QANOV-9190
  @jira.link.relates_to.NOV-53477 @manual @mobile @moves @regression
  Scenario: User can switch among the different functionalities included in a pack
    internal_checkpoint="NOTE: not all the functionalities will have the 'More information' link"
    Given user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-functionalities" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Included Functionalities" page
     When clicks on a different item in the "included_functionalities_list" carousel
      And the selected functionality is highlighted
      And the "functionality_title" textfield is displayed
      And the "functionality_description" textfield is displayed

  @jira.QANOV-9192 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-9188 @jira.link.relates_to.NOV-53478 @manual
  @mobile @moves @regression
  Scenario: User can tap on the "More information" link in the "Included functionalities" screen
    Given user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-functionalities" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Included Functionalities" page
     When clicks on the "more_info" link
     Then the external webview is displayed
      And the "functionality_description" textfield is displayed

  @jira.QANOV-228046 @android @ios @jira.cv.13.4 @manual @mobile @moves @regression
  Scenario: User can tap on the "More information" link in the "Included functionalities" screen of the "Movistar+ en Dispositivos" functionality
    Given user is in the "Television" page
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-functionalities" module configured in CMS for "tv" page for the "tv" product
     When clicks on any element in the "included_functionalities_list" list with the "functionality_name" field that contains the "Movistar Plus+ en Dispositivos" text
      And the "Included Functionalities" page is displayed
      And clicks on the "more_info" link
     Then the internal webview with "Área privada Movistar" header is displayed
      And the "Usuario de Movistar Plus+ en dispositivos" string is displayed
