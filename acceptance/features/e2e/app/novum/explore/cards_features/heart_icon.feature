# -*- coding: utf-8 -*-
@jira.QANOV-523323
Feature: Heart icon

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @mobile
  @smoke
  Scenario Outline: User can see the Favourites Explore category
    Given user has ">=1" "any" cards with product id and "wishlisted" in the Explore content
      And the "categories_carousel" carousel is displayed
     Then any card in the "categories_carousel" carousel has the "name" field with "[LANG:explore.favourites.title]" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-523324 |
          | o2uk    | QANOV-523325 |
          | moves   | QANOV-523326 |
          | blaude  | QANOV-523327 |
          | o2de    | QANOV-523328 |
          | o2es    | QANOV-523329 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @mobile
  @sanity
  Scenario Outline: User can access to the Favourites Explore category and see the wishlisted cards
    Given user has ">=1" "any" cards with product id and "wishlisted" in the Explore content
      And the "categories_carousel" carousel is displayed
     When clicks on the element with "name" field with "[LANG:explore.favourites.title]" value of the "categories_carousel" list
     Then the "Favourites" page is displayed
      And the "favourites_list" list is displayed
      And each card in the "favourites_list" carousel has the "favorite_card.icon" field
      And each card in the "favourites_list" carousel has the "favorite_card.title" field
      And each card in the "favourites_list" carousel has the "favorite_card.description" field
      And each card in the "favourites_list" carousel has the "favorite_card.details_link" field
      And each card in the "favourites_list" carousel has the "favorite_card.delete_button" field

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-523330 |
          | o2uk    | QANOV-523331 |
          | moves   | QANOV-523332 |
          | blaude  | QANOV-523333 |
          | o2de    | QANOV-523334 |
          | o2es    | QANOV-523335 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @mobile
  @sanity
  Scenario Outline: User can see a heart icon in a <module_type> card in Explore
    Cards with the possibility of the heart icon: Featured content, vertical cards, display cards, Poster cards, Naked cards
    Given user has a "<module_type>" module with ">=1" cards with product id in the Explore content
     When searches the "card"
     Then the selected explore "card" has the "heart_icon" field displayed

    Examples:
          | product | module_type     | jira_id      |
          | vivobr  | feature content | QANOV-523336 |
          | vivobr  | vertical cards  | QANOV-523337 |
          | vivobr  | display cards   | QANOV-523338 |
          | vivobr  | poster cards    | QANOV-523339 |
          | vivobr  | naked cards     | QANOV-523340 |
          | o2uk    | feature content | QANOV-523341 |
          | o2uk    | vertical cards  | QANOV-523342 |
          | o2uk    | display cards   | QANOV-523343 |
          | o2uk    | poster cards    | QANOV-523344 |
          | o2uk    | naked cards     | QANOV-523345 |
          | moves   | feature content | QANOV-523346 |
          | moves   | vertical cards  | QANOV-523347 |
          | moves   | display cards   | QANOV-523348 |
          | moves   | poster cards    | QANOV-523349 |
          | moves   | naked cards     | QANOV-523350 |
          | blaude  | feature content | QANOV-523351 |
          | blaude  | vertical cards  | QANOV-523352 |
          | blaude  | display cards   | QANOV-523353 |
          | blaude  | poster cards    | QANOV-523354 |
          | blaude  | naked cards     | QANOV-523355 |
          | o2de    | feature content | QANOV-523356 |
          | o2de    | vertical cards  | QANOV-523357 |
          | o2de    | display cards   | QANOV-523358 |
          | o2de    | poster cards    | QANOV-523359 |
          | o2de    | naked cards     | QANOV-523360 |
          | o2es    | feature content | QANOV-523361 |
          | o2es    | vertical cards  | QANOV-523362 |
          | o2es    | display cards   | QANOV-523363 |
          | o2es    | poster cards    | QANOV-523364 |
          | o2es    | naked cards     | QANOV-523365 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @mobile
  @regression
  Scenario Outline: User can see a voucher code and heart icon in a Featured content card
    Given user has a "featured content" card with product id and voucher code in the Explore content
     When searches the "card"
     Then the selected explore "card" has the "heart_icon" field displayed
      And the selected explore "card" has the "voucher_code" field displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-523366 |
          | o2uk    | QANOV-523367 |
          | moves   | QANOV-523368 |
          | blaude  | QANOV-523369 |
          | o2de    | QANOV-523370 |
          | o2es    | QANOV-523371 |

  @jira.<jira_id> @<product> @android @<ber> @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @mobile
  @smoke
  Scenario Outline: User can tap the heart icon of a <module_type> card and add it to the Favourites Explore category
    Cards with the possibility of the heart icon: Featured content, vertical cards, display cards, Poster cards, Naked cards
    After few seconds the crouton will disapears
    Given user has ">=1" "<module_type>" cards with product id and "not wishlisted" in the Explore content
     When searches the "card"
      And clicks on the "heart_icon" field in the explore "card"
     Then the text of the element "crouton_text" is equal to "[LANG:explore.favourites.added_text]"
      And the "crouton_link" link with "[LANG:explore.favourites.added_link]" text is displayed
      And the "heart_icon" checkbox is enabled

    Examples:
          | product | module_type     | ber | jira_id      |
          | vivobr  | feature content | ber | QANOV-523372 |
          | vivobr  | vertical cards  |     | QANOV-523373 |
          | vivobr  | display cards   |     | QANOV-523374 |
          | vivobr  | poster cards    |     | QANOV-523375 |
          | vivobr  | naked cards     |     | QANOV-523376 |
          | o2uk    | feature content |     | QANOV-523377 |
          | o2uk    | vertical cards  | ber | QANOV-523378 |
          | o2uk    | display cards   |     | QANOV-523379 |
          | o2uk    | poster cards    |     | QANOV-523380 |
          | o2uk    | naked cards     |     | QANOV-523381 |
          | moves   | feature content |     | QANOV-523382 |
          | moves   | vertical cards  |     | QANOV-523383 |
          | moves   | display cards   | ber | QANOV-523384 |
          | moves   | poster cards    |     | QANOV-523385 |
          | moves   | naked cards     |     | QANOV-523386 |
          | blaude  | feature content |     | QANOV-523387 |
          | blaude  | vertical cards  |     | QANOV-523388 |
          | blaude  | display cards   |     | QANOV-523389 |
          | blaude  | poster cards    | ber | QANOV-523390 |
          | blaude  | naked cards     |     | QANOV-523391 |
          | o2de    | feature content |     | QANOV-523392 |
          | o2de    | vertical cards  |     | QANOV-523393 |
          | o2de    | display cards   |     | QANOV-523394 |
          | o2de    | poster cards    |     | QANOV-523395 |
          | o2de    | naked cards     | ber | QANOV-523396 |
          | o2es    | feature content |     | QANOV-523397 |
          | o2es    | vertical cards  |     | QANOV-523398 |
          | o2es    | display cards   | ber | QANOV-523399 |
          | o2es    | poster cards    |     | QANOV-523400 |
          | o2es    | naked cards     |     | QANOV-523401 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @mobile
  @smoke
  Scenario Outline: User can tap the heart icon of a card and see it into the Favourites Explore category
    Cards with the possibility of the heart icon: Featured content, vertical cards, display cards, Poster cards, Naked cards
    Given user has ">=1" "any" cards with product id and "not wishlisted" in the Explore content
      And user has ">=1" "any" cards with product id and "wishlisted" in the Explore content
     When searches the "card"
      And clicks on the "heart_icon" field in the explore "card"
      And the "heart_icon" checkbox is enabled
      And clicks on the element with "name" field with "[LANG:explore.favourites.title]" value of the "categories_carousel" list
     Then the "Favourites" page is loaded
      And any element in the "favourites_list" carousel has the "title" field with "[CONTEXT:card_product]" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-523402 |
          | o2uk    | QANOV-523403 |
          | moves   | QANOV-523404 |
          | blaude  | QANOV-523405 |
          | o2de    | QANOV-523406 |
          | o2es    | QANOV-523407 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @mobile
  @smoke
  Scenario Outline: User can tap the heart icon of a card and the Favourites Explore category appears when Explore is refreshed
    Cards with the possibility of the heart icon: Featured content, vertical cards, display cards, Poster cards, Naked cards
    If explore has self-refreshed for some reason it is not necessary to refresh the tab
    Given user has ">=1" "any" cards with product id and "not wishlisted" in the Explore content
      And user has "0" "any" cards with product id and "wishlisted" in the Explore content
     When searches the "card"
      And clicks on the "heart_icon" field in the explore "card"
      And the "heart_icon" checkbox is enabled
      And pulls down the page to refresh
     Then any element in the "categories_carousel" carousel has the "text" field with "[LANG:explore.favourites.title]" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-525468 |
          | o2uk    | QANOV-525469 |
          | moves   | QANOV-525470 |
          | blaude  | QANOV-525471 |
          | o2de    | QANOV-525472 |
          | o2es    | QANOV-525473 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @mobile
  @regression
  Scenario Outline: The link of the wishlisted card crouton redirects to the Favourites Explore category
    Cards with the possibility of the heart icon: Featured content, vertical cards, display cards, Poster cards, Naked cards
    Given user has ">=1" "any" cards with product id and "not wishlisted" in the Explore content
     When searches the "card"
      And the selected explore "card" has the "heart_icon" field displayed
      And clicks on the "heart_icon" field in the explore "card"
      And the text of the element "crouton_text" is equal to "[LANG:explore.favourites.added_text]"
      And the "crouton_link" link with "[LANG:explore.favourites.added_link]" text is displayed
      And clicks on the "crouton_link" link
     Then the "Favourites category" page is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-523408 |
          | o2uk    | QANOV-523409 |
          | moves   | QANOV-523410 |
          | blaude  | QANOV-523411 |
          | o2de    | QANOV-523412 |
          | o2es    | QANOV-523413 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @mobile
  @smoke
  Scenario Outline: User can untap the heart icon of a <module_type> card and remove it from the Favourites Explore category
    Cards with the possibility of the heart icon: Featured content, vertical cards, display cards, Poster cards, Naked cards
    After few seconds the crouton will disapears
    Given user has ">=1" "<module_type>" cards with product id and "wishlisted" in the Explore content
     When searches the "card"
      And clicks on the "heart_icon" field in the explore "card"
     Then the text of the element "crouton_text" is equal to "[LANG:explore.favourites.removed_text]"
      And the "crouton_link" link with "[LANG:explore.favourites.removed_link]" text is displayed
      And the "heart_icon" checkbox is disabled

    Examples:
          | product | module_type     | jira_id      |
          | vivobr  | feature content | QANOV-523414 |
          | vivobr  | vertical cards  | QANOV-523415 |
          | vivobr  | display cards   | QANOV-523416 |
          | vivobr  | poster cards    | QANOV-523417 |
          | vivobr  | naked cards     | QANOV-523418 |
          | o2uk    | feature content | QANOV-523419 |
          | o2uk    | vertical cards  | QANOV-523420 |
          | o2uk    | display cards   | QANOV-523421 |
          | o2uk    | poster cards    | QANOV-523422 |
          | o2uk    | naked cards     | QANOV-523423 |
          | moves   | feature content | QANOV-523424 |
          | moves   | vertical cards  | QANOV-523425 |
          | moves   | display cards   | QANOV-523426 |
          | moves   | poster cards    | QANOV-523427 |
          | moves   | naked cards     | QANOV-523428 |
          | blaude  | feature content | QANOV-523429 |
          | blaude  | vertical cards  | QANOV-523430 |
          | blaude  | display cards   | QANOV-523431 |
          | blaude  | poster cards    | QANOV-523432 |
          | blaude  | naked cards     | QANOV-523433 |
          | o2de    | feature content | QANOV-523434 |
          | o2de    | vertical cards  | QANOV-523435 |
          | o2de    | display cards   | QANOV-523436 |
          | o2de    | poster cards    | QANOV-523437 |
          | o2de    | naked cards     | QANOV-523438 |
          | o2es    | feature content | QANOV-523439 |
          | o2es    | vertical cards  | QANOV-523440 |
          | o2es    | display cards   | QANOV-523441 |
          | o2es    | poster cards    | QANOV-523442 |
          | o2es    | naked cards     | QANOV-523443 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @mobile
  @smoke
  Scenario Outline: User can untap the heart icon of a card and don't see it into the Favourites Explore category
    Cards with the possibility of the heart icon: Featured content, vertical cards, display cards, Poster cards, Naked cards
    Given user has ">1" "any" cards with product id and "wishlisted" in the Explore content
     When searches the "card"
      And clicks on the "heart_icon" field in the explore "card"
      And the "heart_icon" checkbox is disabled
      And clicks on the element with "name" field with "[LANG:explore.favourites.title]" value of the "categories_carousel" list
     Then the "Favourites" page is loaded
      And no element in the "favourites_list" list has the value "[CONTEXT:card_product]" in the "title" field

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-523444 |
          | o2uk    | QANOV-523445 |
          | moves   | QANOV-523446 |
          | blaude  | QANOV-523447 |
          | o2de    | QANOV-523448 |
          | o2es    | QANOV-523449 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @mobile
  @regression
  Scenario Outline: User can untap the heart icon of a card and the Favourites Explore category disapears when Explore is refreshed
    Cards with the possibility of the heart icon: Featured content, vertical cards, display cards, Poster cards, Naked cards
    If explore has self-refreshed for some reason it is not necessary to refresh the tab
    Given user has "1" "any" cards with product id and "wishlisted" in the Explore content
      And user has "0" "any" cards with product id and "not wishlisted" in the Explore content
     When searches the "card"
      And clicks on the "heart_icon" field in the explore "card"
      And the "heart_icon" checkbox is disabled
      And pulls down the page to refresh
     Then no element in the "categories_carousel" list has the value "[LANG:explore.favourites.title]" in the "text" field

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-525474 |
          | o2uk    | QANOV-525475 |
          | moves   | QANOV-525476 |
          | blaude  | QANOV-525477 |
          | o2de    | QANOV-525478 |
          | o2es    | QANOV-525479 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @mobile
  @regression
  Scenario Outline: User can untap the heart icon of a card to remove it from the Favourites Explore category but cancel it
    Cards with the possibility of the heart icon: Featured content, vertical cards, display cards, Poster cards, Naked cards
    Given user has ">=1" "any" cards with product id and "wishlisted" in the Explore content
     When searches the "card"
      And the selected explore "card" has the "heart_icon" field displayed
      And clicks on the "heart_icon" field in the explore "card"
      And the "heart_icon" checkbox is disabled
      And clicks on the "crouton_link" link
     Then the "heart_icon" checkbox is enabled

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-523450 |
          | o2uk    | QANOV-523451 |
          | moves   | QANOV-523452 |
          | blaude  | QANOV-523453 |
          | o2de    | QANOV-523454 |
          | o2es    | QANOV-523455 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @mobile
  @regression
  Scenario Outline: User can delete wishlisted cards from the Favourites Explore category
    After few seconds the crouton will disapears
    Given user has ">1" "any" cards with product id and "wishlisted" in the Explore content
      And the "categories_carousel" carousel is displayed
      And user is in the "Favourites Category" page
      And I store the text in the "first_product" element in the context storage with key "favourite_title"
     When clicks on the "first_favourite_delete_icon" button
     Then the text of the element "crouton_text" is equal to "[LANG:explore.favourites.removed_text]"
      And the text of the element "crouton_link" is equal to "[LANG:explore.favourites.removed_link]"
      And no element in the "favourites_list" list has the value "[CONTEXT:favourite_title]" in the "title" field

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-523456 |
          | o2uk    | QANOV-523457 |
          | moves   | QANOV-523458 |
          | blaude  | QANOV-523459 |
          | o2de    | QANOV-523460 |
          | o2es    | QANOV-523461 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @mobile
  @regression
  Scenario Outline: User can delete all wishlisted cards from the Favourites Explore category and see the empty-case
    After few seconds the crouton will disapears
    Given user has "1" "any" cards with product id and "wishlisted" in the Explore content
      And the "categories_carousel" carousel is displayed
     When clicks on the element with "name" field with "[LANG:explore.favourites.title]" value of the "categories_carousel" list
      And the "Favourites" page is displayed
      And clicks on the "favourite_delete_icon" button
     Then the text of the element "crouton_text" is equal to "[LANG:explore.favourites.removed_text]"
      And the text of the element "crouton_link" is equal to "[LANG:explore.favourites.removed_link]"
      And the "favourites_list" list is not displayed
      And the "heart" icon is displayed
      And the "empty_title" textfield with "[LANG:explore.favourites.empty_case_title]" text is displayed
      And the "empty_desc" textfield with "[LANG:explore.favourites.empty_case_text]" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-523462 |
          | o2uk    | QANOV-523463 |
          | moves   | QANOV-523464 |
          | blaude  | QANOV-523465 |
          | o2de    | QANOV-523466 |
          | o2es    | QANOV-523467 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @mobile
  @regression
  Scenario Outline: User can delete wishlisted cards from the "Favourites" Explore category and cancel it
    Given user has ">=1" "any" cards with product id and "wishlisted" in the Explore content
      And the "categories_carousel" carousel is displayed
     When clicks on the element with "name" field with "[LANG:explore.favourites.title]" value of the "categories_carousel" list
      And the "Favourites" page is displayed
      And I store the text in the "first_favourite" element in the context storage with key "favourite_title"
      And clicks on the "first_favourite_delete_icon" button
      And the text of the element "crouton_text" is equal to "[LANG:explore.favourites.removed_text]"
      And the text of the element "crouton_link" is equal to "[LANG:explore.favourites.removed_link]"
      And clicks on the "crouton_link" link
     Then any element in the "products_list" list has the "title" textfield with the "[CONTEXT:favourite_title]" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-523468 |
          | o2uk    | QANOV-523469 |
          | moves   | QANOV-523470 |
          | blaude  | QANOV-523471 |
          | o2de    | QANOV-523472 |
          | o2es    | QANOV-523473 |
