# -*- coding: utf-8 -*-
@jira.QANOV-369707
Feature: Entrypoints Lists - Snap cards


  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @mobile @qa @sanity @webapp
  @fixture.cms.entrypoint_list.snapcard_<human_readable_representation>_carousel
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a basic snapcard carousel when there is a snapcard carousel configured in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<representation>" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.snap_cards_carousel" carousel is displayed
      And each of the snap card of the "entrypoint_list.snap_cards_carousel" snap cards carousel has "<human_readable_representation>" representation

    Examples:
          | product | cv   | representation           | human_readable_representation | jira_id      |
          | vivobr  | 14.4 | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-369708 |
          | vivobr  | 14.4 | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-495346 |
          | o2uk    | 14.4 | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-369709 |
          | o2uk    | 14.4 | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-495347 |
          | moves   | 14.4 | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-369710 |
          | moves   | 14.4 | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-495348 |
          | blaude  | 14.4 | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-369711 |
          | blaude  | 14.4 | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-495349 |
          | o2de    | 24.0 | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-369712 |
          | o2de    | 24.0 | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-495350 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @manual @mobile @sanity @vivobr
  Scenario Outline: A user can see a basic snapcard carousel when there is a snapcard carousel of type API configured in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And user has apps included in the tariff
      And the list of entrypoints list is of type "API"
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<representation>" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.snap_cards_carousel" carousel is displayed
      And each of the snap card of the "entrypoint_list.snap_cards_carousel" snap cards carousel has "<human_readable_representation>" representation

    Examples:
          | representation           | human_readable_representation | jira_id      |
          | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-554885 |
          | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-554886 |

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @mobile @qa @sanity @webapp
  @fixture.cms.entrypoint_list.snapcard_<list_type_full_name>_with_summary_of_3_items_and_summary_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the snapcard <list_type> summary with title when there is a snapcard <list_type> configured in CMS with title and max number of elements to show in summary
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<representation>" visual representation
      And the list of entrypoints configured in CMS has a "title" defined
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.title" textfield with "[CONTEXT:current_module.entrypoint_list_title]" text is displayed
      And the "entrypoint_list.snap_cards_<list_type>" carousel is displayed
      And the "entrypoint_list.snap_cards_<list_type>" list has "3" elements

    Examples:
          | product | cv   | list_type_full_name     | representation           | list_type | jira_id      |
          | vivobr  | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369713 |
          | vivobr  | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495351 |
          | vivobr  | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495352 |
          | o2uk    | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369714 |
          | o2uk    | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495353 |
          | o2uk    | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495354 |
          | moves   | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369715 |
          | moves   | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495355 |
          | blaude  | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369716 |
          | blaude  | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495357 |
          | blaude  | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495358 |
          | o2de    | 24.0 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369717 |
          | o2de    | 24.0 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495359 |
          | o2de    | 24.0 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495360 |

    @jira.link.parent_test_plan.QANOV-525492
    Examples:
          | product | cv   | list_type_full_name | representation        | list_type | jira_id      |
          | moves   | 14.4 | grid                | SNAPCARD_STACKED_GRID | grid      | QANOV-495356 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.entrypoint_list.snapcard_<list_type_full_name>_with_summary_of_3_items_and_both_titles
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the complete entrypoint list with the full title when there is a snapcard <list_type_full_name> configured with full title in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<representation>" visual representation
      And the list of entrypoints configured in CMS has a "full_title" defined
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with see all link
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on the "entrypoint_list.see_all" button
     Then the "Modular Page Full Entrypoint List" page is displayed
      And the "[CONTEXT:current_module.entrypoint_list_full_title]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | cv   | list_type_full_name     | representation           | jira_id      |
          | vivobr  | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | QANOV-369718 |
          | vivobr  | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | QANOV-495361 |
          | vivobr  | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | QANOV-495362 |
          | o2uk    | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | QANOV-369719 |
          | o2uk    | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | QANOV-495363 |
          | o2uk    | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | QANOV-495364 |
          | moves   | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | QANOV-369720 |
          | moves   | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | QANOV-495365 |
          | moves   | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | QANOV-495366 |
          | blaude  | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | QANOV-369721 |
          | blaude  | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | QANOV-495367 |
          | blaude  | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | QANOV-495368 |
          | o2de    | 24.0 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | QANOV-369722 |
          | o2de    | 24.0 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | QANOV-495369 |
          | o2de    | 24.0 | grid                    | SNAPCARD_STACKED_GRID    | QANOV-495370 |

  @jira.<jira_id> @android @automatic @ios @mobile @qa @regression @webapp
  @fixture.cms.entrypoint_list.snapcard_<list_type_full_name>_with_summary_of_3_items_and_add_item_card_<add_item_card_title>_title_and_<with_icons>_icons
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see an additional card in the summary of snapcards list with <list_type_full_name> representation with a link to show the full entrypoint list
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<representation>" visual representation
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with additional item to show more
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has "5" entrypoints
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.see_all" link is not displayed
      And the "entrypoint_list.snap_cards_<list_type>" carousel has "4" cards
      And the element in "3" position in the "entrypoint_list.snap_cards_<list_type>" list has the "title" textfield with the "<show_more_link_text>" text
      And the element in "3" position in the "entrypoint_list.snap_cards_<list_type>" list <has_icon> the "icon" field

    @jira.cv.14.10 @vivobr
    Examples:
          | list_type_full_name     | representation           | list_type | add_item_card_title | show_more_link_text                                                           | with_icons | has_icon | jira_id      |
          | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | without             | Ver todos                                                                     | without    | has not  | QANOV-495371 |
          | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | without             | Ver todos                                                                     | without    | has not  | QANOV-495372 |
          | grid                    | SNAPCARD_STACKED_GRID    | grid      | without             | Ver todos                                                                     | without    | has not  | QANOV-495373 |
          | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | without    | has not  | QANOV-495374 |
          | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | without    | has not  | QANOV-495375 |
          | grid                    | SNAPCARD_STACKED_GRID    | grid      | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | without    | has not  | QANOV-495376 |
          | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | without             | Ver todos                                                                     | with       | has      | QANOV-495377 |
          | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | without             | Ver todos                                                                     | with       | has      | QANOV-495378 |
          | grid                    | SNAPCARD_STACKED_GRID    | grid      | without             | Ver todos                                                                     | with       | has      | QANOV-495379 |
          | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | with       | has      | QANOV-495380 |
          | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | with       | has      | QANOV-495381 |
          | grid                    | SNAPCARD_STACKED_GRID    | grid      | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | with       | has      | QANOV-495382 |

    @jira.cv.14.10 @o2uk
    Examples:
          | list_type_full_name     | representation           | list_type | add_item_card_title | show_more_link_text                                                           | with_icons | has_icon | jira_id      |
          | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | without             | View all                                                                      | with       | has      | QANOV-495383 |
          | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | without             | View all                                                                      | with       | has      | QANOV-495384 |
          | grid                    | SNAPCARD_STACKED_GRID    | grid      | without             | View all                                                                      | with       | has      | QANOV-495385 |
          | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | with       | has      | QANOV-495386 |
          | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | with       | has      | QANOV-495387 |
          | grid                    | SNAPCARD_STACKED_GRID    | grid      | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | with       | has      | QANOV-495388 |

    @jira.cv.14.10 @moves
    Examples:
          | list_type_full_name     | representation           | list_type | add_item_card_title | show_more_link_text                                                           | with_icons | has_icon | jira_id      |
          | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | without             | Ver todos                                                                     | with       | has      | QANOV-495389 |
          | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | without             | Ver todos                                                                     | with       | has      | QANOV-495390 |
          | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | with       | has      | QANOV-495392 |
          | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | with       | has      | QANOV-495393 |

    @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-525492 @moves
    Examples:
          | list_type_full_name | representation        | list_type | add_item_card_title | show_more_link_text                                                           | with_icons | has_icon | jira_id      |
          | grid                | SNAPCARD_STACKED_GRID | grid      | without             | Ver todos                                                                     | with       | has      | QANOV-495391 |
          | grid                | SNAPCARD_STACKED_GRID | grid      | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | with       | has      | QANOV-495394 |

    @blaude @jira.cv.14.10
    Examples:
          | list_type_full_name     | representation           | list_type | add_item_card_title | show_more_link_text                                                           | with_icons | has_icon | jira_id      |
          | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | without             | Alle ansehen                                                                  | without    | has not  | QANOV-495395 |
          | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | without             | Alle ansehen                                                                  | without    | has not  | QANOV-495396 |
          | grid                    | SNAPCARD_STACKED_GRID    | grid      | without             | Alle ansehen                                                                  | without    | has not  | QANOV-495397 |
          | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | without    | has not  | QANOV-495398 |
          | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | without    | has not  | QANOV-495399 |
          | grid                    | SNAPCARD_STACKED_GRID    | grid      | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | without    | has not  | QANOV-495400 |

    @jira.cv.24.0 @o2de
    Examples:
          | list_type_full_name     | representation           | list_type | add_item_card_title | show_more_link_text                                                           | with_icons | has_icon | jira_id      |
          | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | without             | Alle ansehen                                                                  | without    | has      | QANOV-495401 |
          | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | without             | Alle ansehen                                                                  | without    | has      | QANOV-495402 |
          | grid                    | SNAPCARD_STACKED_GRID    | grid      | without             | Alle ansehen                                                                  | without    | has      | QANOV-495403 |
          | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | without    | has      | QANOV-495404 |
          | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | without    | has      | QANOV-495405 |
          | grid                    | SNAPCARD_STACKED_GRID    | grid      | with                | [CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText] | without    | has      | QANOV-495406 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.entrypoint_list.snapcard_<list_type_full_name>_with_summary_of_3_items_and_both_titles_and_add_item_card
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the complete entrypoint list with the full title when there is a snapcard <list_type> configured with full title in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<representation>" visual representation
      And the list of entrypoints configured in CMS has a "full_title" defined
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with see all link
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has "4" entrypoints
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on the "3" element in the "entrypoint_list.snap_cards_<list_type>" list
     Then the "Modular Page Full Entrypoint List" page is displayed
      And the "[CONTEXT:current_module.entrypoint_list_full_title]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | cv   | list_type_full_name     | representation           | list_type | jira_id      |
          | vivobr  | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-495407 |
          | vivobr  | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495408 |
          | vivobr  | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495409 |
          | o2uk    | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-495410 |
          | o2uk    | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495411 |
          | o2uk    | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495412 |
          | moves   | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-495413 |
          | moves   | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495414 |
          | moves   | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495415 |
          | blaude  | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-495416 |
          | blaude  | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495417 |
          | blaude  | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495418 |
          | o2de    | 24.0 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-495419 |
          | o2de    | 24.0 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495420 |
          | o2de    | 24.0 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495421 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @mobile @qa @regression
  @fixture.cms.entrypoint_list.snapcard_<human_readable_representation>_carousel
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can swipe the entrypoints of the snapcard carousel
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<representation>" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.snap_cards_carousel" carousel can be swiped

    @ios @manual
    Examples:
          | product | cv   | representation           | human_readable_representation | jira_id      |
          | vivobr  | 14.4 | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-369723 |
          | vivobr  | 14.4 | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-495422 |
          | o2uk    | 14.4 | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-369724 |
          | o2uk    | 14.4 | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-495423 |
          | moves   | 14.4 | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-369725 |
          | moves   | 14.4 | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-495424 |
          | blaude  | 14.4 | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-369726 |
          | blaude  | 14.4 | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-495425 |
          | o2de    | 24.0 | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-369727 |
          | o2de    | 24.0 | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-495426 |

    @android @automatic
    Examples:
          | product | cv   | representation           | human_readable_representation | jira_id      |
          | vivobr  | 14.4 | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-153423 |
          | vivobr  | 14.4 | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-495427 |
          | o2uk    | 14.4 | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-153424 |
          | o2uk    | 14.4 | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-495428 |
          | moves   | 14.4 | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-153425 |
          | moves   | 14.4 | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-495429 |
          | blaude  | 14.4 | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-189746 |
          | blaude  | 14.4 | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-495430 |
          | o2de    | 24.0 | SNAPCARD_CAROUSEL        | dynamic_height                | QANOV-189747 |
          | o2de    | 24.0 | SNAPCARD_SQUARE_CAROUSEL | square                        | QANOV-495431 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.entrypoint_list.snapcard_<list_type_full_name>_with_icons
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see all cards with icons
    All entrypoint list element have icons and that is not something that can be configured
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<representation>" visual representation
      And the list of entrypoints configured in CMS has an entrypoint with icon defined
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.snap_cards_<list_type>" carousel is displayed
      And the "entrypoint_list.snap_cards_<list_type>" list has "3" elements
      And any element in the "entrypoint_list.snap_cards_<list_type>" list has the "icon" field

    Examples:
          | product | cv   | list_type_full_name     | representation           | list_type | jira_id      |
          | o2uk    | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369739 |
          | o2uk    | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495432 |
          | o2uk    | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495433 |
          | moves   | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369740 |
          | moves   | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495434 |
          | moves   | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495435 |
          | o2de    | 24.0 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369742 |
          | o2de    | 24.0 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495436 |
          | o2de    | 24.0 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495437 |
          | vivobr  | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369738 |
          | vivobr  | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495438 |
          | vivobr  | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495439 |

  @jira.<jira_id> @blaude @android @automatic @ios @jira.cv.14.4 @mobile @qa @smoke @webapp
  @fixture.cms.entrypoint_list.snapcard_<list_type_full_name>
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see no icon cards
    None entrypoint list element have icons and that is not something that can be configured
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<representation>" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.snap_cards_<list_type>" carousel is displayed
      And the "entrypoint_list.snap_cards_<list_type>" list has "3" elements
      And no element in the "entrypoint_list.snap_cards_<list_type>" list has the "icon" field

    Examples:
          | list_type_full_name     | representation           | list_type | jira_id      |
          | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369746 |
          | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495440 |
          | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495441 |

  @jira.<jira_id> @o2de @android @automatic @ios @jira.cv.24.0 @mobile @qa @smoke @webapp
  @fixture.cms.entrypoint_list.snapcard_<list_type_full_name>
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the default icon cards when no icon is defined
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<representation>" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.snap_cards_<list_type>" carousel is displayed
      And the "entrypoint_list.snap_cards_<list_type>" list has "3" elements
      And each element has the "icon" field displayed in the "entrypoint_list.snap_cards_<list_type>" list

    Examples:
          | list_type_full_name     | representation           | list_type | jira_id      |
          | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-495442 |
          | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495443 |
          | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495444 |

  @jira.QANOV-369743 @android @automatic @ios @jira.cv.14.4 @mobile @qa @smoke @vivobr @webapp
  @fixture.cms.entrypoint_list.snapcard_<list_type_full_name>
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see all cards without icons when the snapcard <list_type> denies icons
    Regardless wheter the entrypoint has icon or not, no icon is shown
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<representation>" visual representation
      And the list of entrypoints configured in CMS has an entrypoint with icon defined
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.snap_cards_<list_type>" carousel is displayed
      And the "entrypoint_list.snap_cards_<list_type>" list has "3" elements
      And no element in the "entrypoint_list.snap_cards_<list_type>" list has the "icon" field

    Examples:
          | list_type_full_name     | representation           | list_type | jira_id      |
          | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369743 |
          | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-369743 |
          | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-369743 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.11 @mobile @qa @regression @vivobr @webapp
  @fixture.cms.entrypoint_list.snapcard_<carousel_type>_carousel_with_page_bullets
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can page bullets under the <carousel_type> carousel when not all cards fit in the screen
    Regardless wheter the entrypoint has icon or not, no icon is shown
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<representation>" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.snap_cards_carousel" carousel is displayed
      And each of the snap card of the "entrypoint_list.snap_cards_carousel" snap cards carousel has "<carousel_type>" representation
      And the "entrypoint_list.page_bullets" list is displayed

    Examples:
          | carousel_type  | representation           | jira_id      |
          | dynamic_height | SNAPCARD_CAROUSEL        | QANOV-495445 |
          | square         | SNAPCARD_SQUARE_CAROUSEL | QANOV-495446 |

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @mobile @qa @smoke
  @fixture.cms.entrypoint_list.snapcard_<list_type_full_name>
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on a card with custom url pointing to an external webview of a <list_type_full_name>
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a custom url to an external endpoint
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<representation>" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on any element in the "entrypoint_list.snap_cards_<list_type>" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | cv   | list_type_full_name     | representation           | list_type | jira_id      |
          | vivobr  | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369748 |
          | vivobr  | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495447 |
          | vivobr  | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495448 |
          | o2uk    | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369749 |
          | o2uk    | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495449 |
          | o2uk    | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495450 |
          | moves   | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369750 |
          | moves   | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495451 |
          | moves   | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495452 |
          | blaude  | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369751 |
          | blaude  | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495453 |
          | blaude  | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495454 |
          | o2de    | 24.0 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | QANOV-369752 |
          | o2de    | 24.0 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | QANOV-495455 |
          | o2de    | 24.0 | grid                    | SNAPCARD_STACKED_GRID    | grid      | QANOV-495456 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke
  @fixture.cms.entrypoint_list.snapcard_<list_type_full_name>
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on an entry point when there is a custom entry point with preconfigured url to <preconfiguration>
    We are assuming that the list is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a preconfigured url to "<preconfiguration>"
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<representation>" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on any element in the "entrypoint_list.snap_cards_<list_type>" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | preconfiguration | header        | cv   | list_type_full_name     | representation           | list_type | button       |  jira_id      |
          | vivobr  | services-list    | Mais serviços | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | back_button  | QANOV-369753 |
          | vivobr  | services-list    | Mais serviços | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | back_button  | QANOV-495457 |
          | vivobr  | services-list    | Mais serviços | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | back_button  | QANOV-495458 |
          | blaude  | NAME_CHANGE      | Namen ändern  | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | close_button | QANOV-369754 |
          | blaude  | NAME_CHANGE      | Namen ändern  | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | close_button | QANOV-495459 |
          | blaude  | NAME_CHANGE      | Namen ändern  | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | close_button | QANOV-495460 |
          | o2uk    | bolt_on_details  | Your Bolt Ons | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | back_button  | QANOV-369755 |
          | o2uk    | bolt_on_details  | Your Bolt Ons | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | back_button  | QANOV-495461 |
          | o2uk    | bolt_on_details  | Your Bolt Ons | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | back_button  | QANOV-495462 |
          | moves   | invoices_list    | Facturas      | 14.4 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | back_button  | QANOV-369756 |
          | moves   | invoices_list    | Facturas      | 14.4 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | back_button  | QANOV-495463 |
          | moves   | invoices_list    | Facturas      | 14.4 | grid                    | SNAPCARD_STACKED_GRID    | grid      | back_button  | QANOV-495464 |
          | o2de    | NAME_CHANGE      | Namen ändern  | 24.0 | dynamic_height_carousel | SNAPCARD_CAROUSEL        | carousel  | close_button | QANOV-369757 |
          | o2de    | NAME_CHANGE      | Namen ändern  | 24.0 | square_carousel         | SNAPCARD_SQUARE_CAROUSEL | carousel  | close_button | QANOV-495465 |
          | o2de    | NAME_CHANGE      | Namen ändern  | 24.0 | grid                    | SNAPCARD_STACKED_GRID    | grid      | close_button | QANOV-495466 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @sanity @webapp
  @fixture.cms.entrypoint_list.snapcard_square_carousel
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a snapcard square carousel when there is a snapcard square carousel configured in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAPCARD_SQUARE_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.snap_cards_carousel" carousel is displayed
      And each of the snap card of the "entrypoint_list.snap_cards_carousel" snap cards carousel has "square" representation

    @jira.link.parent_test_plan.QANOV-420452
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.8 | QANOV-440806 |

    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 14.8 | QANOV-440807 |
          | moves   | 14.8 | QANOV-440808 |
          | blaude  | 14.8 | QANOV-440809 |
          | o2de    | 24.0 | QANOV-440810 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.entrypoint_list.snapcard_grid
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a snapcard grid when there is a snapcard configured as grid in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAPCARD_STACKED_GRID" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.snap_cards_grid" grid is displayed

    @jira.link.parent_test_plan.QANOV-420452
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.8 | QANOV-495467 |

    @jira.link.parent_test_plan.QANOV-525492
    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.8 | QANOV-495469 |

    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 14.8 | QANOV-495468 |
          | blaude  | 14.8 | QANOV-495470 |
          | o2de    | 24.0 | QANOV-495471 |
