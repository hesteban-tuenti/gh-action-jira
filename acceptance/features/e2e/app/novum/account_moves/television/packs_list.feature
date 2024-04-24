# -*- coding: utf-8 -*-
@jira.QANOV-9142
Feature: Packs list

  Actions Before the Feature:
    Given user has a "tv" product


  @jira.QANOV-9143 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-52862 @manual @mobile @moves @sanity
  Scenario: User can access to the "detailed TV packs" screen of a "No premium" pack
    internal_checkpoint="NOTE: not all the packs will have the 'channels' and 'additional information' tabs"
    commented_tags="@depends_on.NOV-52861"
    other_affected_versions="2021-28-b"
    Given user does not have a television "premium" pack
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the selected tv pack
      And the "Detail Products Subscribed" page is displayed
      And the selected tv pack has channels tab
     Then the "tv_products" module is displayed
      And the "title" textfield is displayed
      And the "channels_tab" link with "Canales" text is displayed
      And the "more_info_tab" link with "Más información" text is displayed
      And the "channels_tab" tab is selected
      And the "channels_list" list is displayed

  @jira.QANOV-9144 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.4 @jira.link.relates_to.NOV-52862
  @manual @mobile @moves @regression
  Scenario: User can access to the "detailed TV packs" screen of a Netflix pack
    internal_checkpoint="NOTE: not all the packs will have the 'channels' and 'additional information' tabs"
    commented_tags="@depends_on.NOV-52861"
    Given user has a television "Netflix" pack
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the selected tv pack
     Then the "Detail Products Subscribed" page is displayed
      And the "Detalle de productos contratados" header is displayed
      And the "tv_products" carousel is displayed
      And the "title" textfield is displayed
      And the "included" textfield with "CONTRATADO" text is displayed
      And the "channels_tab" link with "Canales" text is displayed
      And the "more_info_tab" link with "Más información" text is displayed
      And the "channels_tab" tab is selected
      And the "channels_list" list is displayed

  @jira.<jira_id> @android @ios @jira.cv.10.6 @jira.link.relates_to.NOV-74800 @manual @mobile @moves @regression
  Scenario Outline: User can access to the Netflix details in a pack
    internal_checkpoint="The description is optional (already verified in a different test case)"
    commented_tags="@depends_on.NOV-52861"
    Given user has the "<plan>" TV plan
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "<element>" TV product in the purchased products carousel
      And the "Detail Products Subscribed" page is displayed
      And clicks on the "Netflix" in the "tv_subproducts" carousel
     Then the "title" textfield with "Netflix" text is displayed
      And the "netflix_icon" icon is displayed
      And the "included" textfield with "CONTRATADO" text is displayed

    Examples:
          | plan                              | element              | jira_id    |
          | TV Fusión Total Plus X2 (Netflix) | fusion_total_plus_x2 | QANOV-9154 |

    @automation.pending_mock @impeded_mock
    Examples:
          | plan                              | element              | jira_id    |
          | TV Fusión Total Plus X4 (Netflix) | fusion_total_plus_x4 | QANOV-9155 |

  @jira.QANOV-9145 @android @ios @jira.cv.11.10 @manual @mobile @moves @regression
  Scenario: User can see a pack description in the "detailed TV packs" screen if the pack contains it
    commented_tags="@depends_on.NOV-52861"
    Given user is subscribed to the "pack_with_description" TV pack
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "pack_with_description" TV product in the purchased products carousel
     Then the "Detail Products Subscribed" page is displayed
      And the "description" textfield for the selected "pack_with_description" is displayed

  @jira.QANOV-9146 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-52863 @manual @mobile @moves @regression
  Scenario: User can switch among packs in the "detailed TV packs" screen
    internal_checkpoint="* NOTE: not all the packs will have the 'channels' and 'additional information' tabs
    - NOTE: If the pack is with products(premium) there will be two rows of buttons."
    commented_tags="@depends_on.NOV-52861"
    Given user is subscribed to "several" TV packs
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "any" TV product in the purchased products carousel
      And the "Detail Products Subscribed" page is displayed
      And clicks on a different item in the "tv_products" carousel
     Then the "title" textfield for the selected "pack" is displayed
      And the "included" textfield with "CONTRATADO" text is displayed
      And the "channels_tab" link with "Canales" text is displayed
      And the "more_info_tab" link with "Más información" text is displayed

  @jira.QANOV-9147 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-52864 @manual @mobile @moves @smoke
  Scenario: User can see the sub-packages contained in a premium TV pack
    commented_tags="@depends_on.NOV-52861"
    Given user is subscribed to the "Premium" TV pack
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "premium_pack" TV product in the purchased products carousel
     Then the "Detail Products Subscribed" page is displayed
      And the "tv_subproducts" carousel is displayed

  @jira.QANOV-9148 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-52870 @manual @mobile @moves @regression
  Scenario: User can switch among the sub-packs included in the premium pack
    internal_checkpoint="The description can be displayed optionally (already verified in a different test case)"
    commented_tags="@depends_on.NOV-52861"
    Given user is subscribed to the "Premium" TV pack
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "premium_pack" TV product in the purchased products carousel
      And the "Detail Products Subscribed" page is displayed
      And clicks on a different item in the "tv_subproducts" carousel
     Then the "title" textfield for the selected "subpack" is displayed
      And the "included" textfield with "CONTRATADO" text is displayed
      And the "channels_tab" link with "Canales" text is displayed
      And the "more_info_tab" link with "Más información" text is displayed

  @jira.QANOV-9149 @android @automation.hard @ios @jira.cv.11.6 @jira.link.parent_test_plan.QANOV-21058
  @jira.link.parent_test_plan.QANOV-51351 @jira.link.relates_to.NOV-187117 @manual @mobile @moves @regression
  Scenario: User can access to the "detailed TV packs" screen of Disney+ and it is not activated yet
    TV channel in tariff hard to automate cause the MOVES team is harcoding this info in this repo and is hard to check: https://github.com/Telefonica/tv-catalogue
    other_affected_versions="2021-05-B"
    commented_tags="@depends_on.NOV-187113"
    Given user has the "Disney+" TV channel in tariff
      And user has "disney" television service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "disney_channel" TV product in the purchased products carousel
     Then the "Detail Products Subscribed" page is displayed
      And the "disney_channel" item is selected in the "tv_products" carousel
      And the "title" textfield with "Disney+" text is displayed
      And the "subtitle" textfield with "Disney+" text is displayed
      And the "included" textfield with "PENDIENTE DE ACTIVAR" text is displayed
      And the "disney_icon" icon is displayed
      And the "description" textfield is displayed
      And the "open_disney" button with "Entrar en Disney+" text is displayed

  @jira.QANOV-55704 @android @automation.hard @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21058
  @jira.link.parent_test_plan.QANOV-51351 @jira.link.relates_to.NOV-187117 @manual @mobile @moves @regression
  Scenario: User can access to the "detailed TV packs" screen of Disney+ and it is already activated
    User Legado: 05960856S
    TV channel in tariff hard to automate cause the MOVES team is harcoding this info in this repo and is hard to check: https://github.com/Telefonica/tv-catalogue
    other_affected_versions="2021-05-B"
    commented_tags="@depends_on.NOV-187113"
    Given user has the "Disney+" TV channel in tariff
      And user has "disney" television service in "activated" status
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "disney_channel" TV product in the purchased products carousel
     Then the "Detail Products Subscribed" page is displayed
      And the "disney_channel" item is selected in the "tv_products" carousel
      And the "title" textfield with "Disney+" text is displayed
      And the "subtitle" textfield with "Disney+" text is displayed
      And the "included" textfield with "INCLUIDO" text is displayed
      And the "disney_icon" icon is displayed
      And the "description" textfield is displayed
      And the "play_disney" button with "Ver Disney+" text is displayed

  @jira.QANOV-9150 @android @automation.hard @ios @jira.cv.11.6 @jira.link.parent_test_plan.QANOV-21058
  @jira.link.parent_test_plan.QANOV-51351 @jira.link.relates_to.NOV-187119 @manual @mobile @moves @regression
  Scenario: User can activate the Disney+ platform from pack details screen
    - Webview is opened in browser mode: [https://docs.google.com/presentation/d/1EAGESvhh0imOSjUeTcxf6f1XwKxxnZmLxlljzM0NdxM/edit#slide=id.g4b83a3ab96_0_199]
    - Disney+ webview is different for Telco and Legados users:
    -- Legado: [https://www.movistar.es/mimovistar-cliente/publico/acceso/privado/vwdisneyPlus]
    -- TELCO: [https://www.movistar.es/mimovistar-cliente/publico/accesoSSO/AppNovum/vwdisneyPlus]
    - User will be authenticated in Mi Movistar, where she/he can create a free account in Disney particular for her/him
    TV channel in tariff hard to automate cause the MOVES team is harcoding this info in this repo and is hard to check: https://github.com/Telefonica/tv-catalogue
    commented_tags="@depends_on.NOV-52861"
    other_affected_versions="2021-05-B"
    Given user has the "Disney+" TV channel in tariff
      And user has "disney" television service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "disney_channel" TV product in the purchased products carousel
      And the "Detail Products Subscribed" page is displayed
      And clicks on the "open_disney" button
     Then the external webview is displayed
      And the "Activación Disney+" header is displayed

  @jira.QANOV-9150 @android @automation.hard @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21058
  @jira.link.parent_test_plan.QANOV-51351 @jira.link.relates_to.NOV-187119 @manual @mobile @moves @regression
  Scenario: User can access the Disney+ webapp from pack details screen
    - Webview is opened in EXTERNAL mode: [https://docs.google.com/presentation/d/1EAGESvhh0imOSjUeTcxf6f1XwKxxnZmLxlljzM0NdxM/edit#slide=id.g4b83a3ab96_0_199]
    - Disney+ webview is different for Telco and Legados users:
    -- Legado: [https://www.movistar.es/mimovistar-cliente/publico/acceso/privado/vwdisneyPlus]
    -- TELCO: [https://www.movistar.es/mimovistar-cliente/publico/accesoSSO/AppNovum/vwdisneyPlus]
    - User will be authenticated in Mi Movistar, where she/he can create a free account in Disney particular for her/him
    TV channel in tariff hard to automate cause the MOVES team is harcoding this info in this repo and is hard to check: https://github.com/Telefonica/tv-catalogue
    commented_tags="@depends_on.NOV-52861"
    other_affected_versions="2021-05-B"
    Given user has the "Disney+" TV channel in tariff
      And user has "disney" television service in "activated" status
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "disney_channel" TV product in the purchased products carousel
      And the "Detail Products Subscribed" page is displayed
      And clicks on the "play_disney" button
     Then the external webview with "https://www.disneyplus.com/es-es/login" url is displayed

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-21055
  @jira.link.parent_test_plan.QANOV-51351 @jira.link.relates_to.NOV-195371 @manual @mobile @moves @regression
  Scenario Outline: User who buy a pack that includes Disney+ can access to it pack details
    internal_checkpoint="The description is optional (already verified in a different test case)
    Users:
    Cine con Disney+ not activated: FIC055532F
    Cine con Disney+ activated: FIC052358F
    Movistar+ Premium con Disney+ activated: FIC28513"
    commented_tags="@depends_on.NOV-195370"
    other_affected_versions="2021-05-B"
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user is subscribed to the "<pack_with_disney>" TV pack
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "<element>" TV product in the purchased products carousel
     Then the "Detail Products Subscribed" page is displayed
      And the "<element>" item is selected in the "tv_products" carousel
      And the "disney_channel_title" textfield with "Disney+" text is displayed
      And the "disney_channel_icon" entrypoint is displayed
      And the "included" textfield with "CONTRATADO" text is displayed

    Examples:
          | account_type  | pack_with_disney              | element                      | jira_id    |
          | postpay       | Cine con Disney+              | cine_disney_pack             | QANOV-9151 |
          | telco postpay | Movistar+ Premium con Disney+ | movistar_premium_disney_pack | QANOV-9152 |
          | postpay       | Premium con Disney+           | premium_disney_pack          | QANOV-9153 |
