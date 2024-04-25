# -*- coding: utf-8 -*-
@jira.QANOV-9537 @not_hardening
Feature: Module management - creation


  @jira.<jira_id> @<product> @ber @manual @sanity @web
  Scenario Outline: A user can access to the create new module screen
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    O2es will have all the modules enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "header_create_module_button" button
     Then the "Create Module" page is loaded
      And the "header_cancel_button" element is displayed
      And the "header_create_button" element is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "page_header" is equal to "Explore modules"
      And the text of the element "page_title" is equal to "Create a module"
      And the text of the element "name_subtitle" is equal to "Name"
      And the text of the element "name_desc" is equal to "This text won't be visible for users. It will be used to identify the module internally in the CMS."
      And the "name_input" inputtext with the "Name" placeholder is displayed
      And the text of the element "module_type_subtitle" is equal to "Type of module"
      And the text of the element "module_type_desc" is equal to "Select the type of module you want to create. The type of module defines the way the content will be displayed."
      And the "module_type_input" inputtext with the "Module search (optional)" placeholder is displayed
      And the "module_type_carousel" carousel with "Featured content|Vertical cards|Rows|Banner|Highlighted cards|Virtual modules|Data cards|Display cards|Poster cards|Banner hero|Naked cards|Naked small cards" cards is displayed

    @jira.cv.11.14
    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-9539   |
          | blaude  | QANOV-286046 |

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | o2de    | QANOV-384515 |
          | moves   | QANOV-328251 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-384516 |

  @jira.QANOV-9538 @ber @jira.cv.11.14 @manual @sanity @vivobr @web
  Scenario: A user can access to the create new module screen
    Vivobr will have Data cards advanced module too, that's why the outline is in a separate scenario.
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "header_create_module_button" button
     Then the "Create Module" page is loaded
      And the "header_cancel_button" element is displayed
      And the "header_create_button" element is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "page_header" is equal to "Explore modules"
      And the text of the element "page_title" is equal to "Create a module"
      And the text of the element "name_subtitle" is equal to "Name"
      And the text of the element "name_desc" is equal to "This text won't be visible for users. It will be used to identify the module internally in the CMS."
      And the "name_input" inputtext with the "Name" placeholder is displayed
      And the text of the element "module_type_subtitle" is equal to "Type of module"
      And the text of the element "module_type_desc" is equal to "Select the type of module you want to create. The type of module defines the way the content will be displayed."
      And the "module_type_input" inputtext with the "Module search (optional)" placeholder is displayed
      And the "module_type_carousel" carousel with "Featured content|Vertical cards|Rows|Banner|Highlighted cards|Virtual modules|Data cards|Data cards advanced|Display cards|Poster cards|Banner hero|Naked cards|Naked small cards" cards is displayed

  @jira.<jira_id> @<product> @jira.cv.Future @manual @regression @web
  Scenario Outline: A user will see the description when selects to create a <module_type> module
    O2es will have all the modules enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
     When I go to "[CONF:cms.base][CONF:cms.modules_repo][CONF:cms.modules_create]" web page
      And the "Create Module" page is loaded
      And I click on the "<module_type_button>" button
     Then the text of the element "module_desc" is equal to "description"

    Examples:
          | product | module_type         | module_type_button      | description                                                                                                                                                                                           | jira_id      |
          | vivobr  | Featured content    | new_featured_content    | This module is designed to accommodate any type of generic content, from devices, news, services, offers, etc.                                                                                        | QANOV-492143 |
          | vivobr  | Vertical cards      | new_vertical_cards      | This module is designed to give a detailed and concise description of our products, such as mobiles, gadgets, wearables, etc.                                                                         | QANOV-492144 |
          | vivobr  | Rows                | new_rows                | This module, designed as a list, has different elements to display personalized content to the user.                                                                                                  | QANOV-492145 |
          | vivobr  | Banner              | new_banner              | This module is designed to support relevant campaign content and promotions in banner format.                                                                                                         | QANOV-492146 |
          | vivobr  | Highlighted cards   | new_highlighted_cards   | This module is designed to highlight content in a very brief way.                                                                                                                                     | QANOV-492147 |
          | vivobr  | Virtual modules     | new_virtual_module      | This module works as any other CMS module but without visual design to adjust its space and display any content injected by API Content.                                                              | QANOV-492148 |
          | vivobr  | Data cards          | new_data_cards          | This module is specifically designed for data and text content.                                                                                                                                       | QANOV-492149 |
          | vivobr  | Data cards advanced | new_data_cards_advanced | The versatility of this module means that, depending on the choice of its slot, its design, and therefore its recommended use, can change.                                                            | QANOV-492150 |
          | vivobr  | Display cards       | new_display_cards       | This module is specifically designed to highlight visual or multimedia content.                                                                                                                       | QANOV-492151 |
          | vivobr  | Poster cards        | new_poster_cards        | This module is specifically designed to visually highlight the content.                                                                                                                               | QANOV-492152 |
          | vivobr  | Banner hero         | new_banner_hero         | This module is designed to highlight content in a very relevant and brief way                                                                                                                         | QANOV-492153 |
          | vivobr  | Naked cards         | new_naked_cards         | Module that shows highlighted content related to offers, products, services and audiovisual content. Unlike Naked Small Cards, here the image has more weight and presence, therefore more relevance. | QANOV-492154 |
          | vivobr  | Naked small cards   | new_naked_small_cards   | This module displays featured content related to offers, products, services and audiovisual content.                                                                                                  | QANOV-492155 |
          | vivobr  | Carousel circle     | new_carousel_circle     | TBD                                                                                                                                                                                                   | QANOV-492156 |
          | o2uk    | Featured content    | new_featured_content    | This module is designed to accommodate any type of generic content, from devices, news, services, offers, etc.                                                                                        | QANOV-492157 |
          | o2uk    | Vertical cards      | new_vertical_cards      | This module is designed to give a detailed and concise description of our products, such as mobiles, gadgets, wearables, etc.                                                                         | QANOV-492158 |
          | o2uk    | Rows                | new_rows                | This module, designed as a list, has different elements to display personalized content to the user.                                                                                                  | QANOV-492159 |
          | o2uk    | Banner              | new_banner              | This module is designed to support relevant campaign content and promotions in banner format.                                                                                                         | QANOV-492160 |
          | o2uk    | Highlighted cards   | new_highlighted_cards   | This module is designed to highlight content in a very brief way.                                                                                                                                     | QANOV-492161 |
          | o2uk    | Virtual modules     | new_virtual_module      | This module works as any other CMS module but without visual design to adjust its space and display any content injected by API Content.                                                              | QANOV-492162 |
          | o2uk    | Data cards          | new_data_cards          | This module is specifically designed for data and text content.                                                                                                                                       | QANOV-492163 |
          | o2uk    | Display cards       | new_display_cards       | This module is specifically designed to highlight visual or multimedia content.                                                                                                                       | QANOV-492164 |
          | o2uk    | Poster cards        | new_poster_cards        | This module is specifically designed to visually highlight the content.                                                                                                                               | QANOV-492165 |
          | o2uk    | Banner hero         | new_banner_hero         | This module is designed to highlight content in a very relevant and brief way                                                                                                                         | QANOV-492166 |
          | o2uk    | Naked cards         | new_naked_cards         | Module that shows highlighted content related to offers, products, services and audiovisual content. Unlike Naked Small Cards, here the image has more weight and presence, therefore more relevance. | QANOV-492167 |
          | o2uk    | Naked small cards   | new_naked_small_cards   | This module displays featured content related to offers, products, services and audiovisual content.                                                                                                  | QANOV-492168 |
          | o2uk    | Carousel circle     | new_carousel_circle     | TBD                                                                                                                                                                                                   | QANOV-492169 |
          | blaude  | Featured content    | new_featured_content    | This module is designed to accommodate any type of generic content, from devices, news, services, offers, etc.                                                                                        | QANOV-492170 |
          | blaude  | Vertical cards      | new_vertical_cards      | This module is designed to give a detailed and concise description of our products, such as mobiles, gadgets, wearables, etc.                                                                         | QANOV-492171 |
          | blaude  | Rows                | new_rows                | This module, designed as a list, has different elements to display personalized content to the user.                                                                                                  | QANOV-492172 |
          | blaude  | Banner              | new_banner              | This module is designed to support relevant campaign content and promotions in banner format.                                                                                                         | QANOV-492173 |
          | blaude  | Highlighted cards   | new_highlighted_cards   | This module is designed to highlight content in a very brief way.                                                                                                                                     | QANOV-492174 |
          | blaude  | Virtual modules     | new_virtual_module      | This module works as any other CMS module but without visual design to adjust its space and display any content injected by API Content.                                                              | QANOV-492175 |
          | blaude  | Data cards          | new_data_cards          | This module is specifically designed for data and text content.                                                                                                                                       | QANOV-492176 |
          | blaude  | Display cards       | new_display_cards       | This module is specifically designed to highlight visual or multimedia content.                                                                                                                       | QANOV-492177 |
          | blaude  | Poster cards        | new_poster_cards        | This module is specifically designed to visually highlight the content.                                                                                                                               | QANOV-492178 |
          | blaude  | Banner hero         | new_banner_hero         | This module is designed to highlight content in a very relevant and brief way                                                                                                                         | QANOV-492179 |
          | blaude  | Naked cards         | new_naked_cards         | Module that shows highlighted content related to offers, products, services and audiovisual content. Unlike Naked Small Cards, here the image has more weight and presence, therefore more relevance. | QANOV-492180 |
          | blaude  | Naked small cards   | new_naked_small_cards   | This module displays featured content related to offers, products, services and audiovisual content.                                                                                                  | QANOV-492181 |
          | blaude  | Carousel circle     | new_carousel_circle     | TBD                                                                                                                                                                                                   | QANOV-492182 |
          | o2de    | Featured content    | new_featured_content    | This module is designed to accommodate any type of generic content, from devices, news, services, offers, etc.                                                                                        | QANOV-492183 |
          | o2de    | Vertical cards      | new_vertical_cards      | This module is designed to give a detailed and concise description of our products, such as mobiles, gadgets, wearables, etc.                                                                         | QANOV-492184 |
          | o2de    | Rows                | new_rows                | This module, designed as a list, has different elements to display personalized content to the user.                                                                                                  | QANOV-492185 |
          | o2de    | Banner              | new_banner              | This module is designed to support relevant campaign content and promotions in banner format.                                                                                                         | QANOV-492186 |
          | o2de    | Highlighted cards   | new_highlighted_cards   | This module is designed to highlight content in a very brief way.                                                                                                                                     | QANOV-492187 |
          | o2de    | Virtual modules     | new_virtual_module      | This module works as any other CMS module but without visual design to adjust its space and display any content injected by API Content.                                                              | QANOV-492188 |
          | o2de    | Data cards          | new_data_cards          | This module is specifically designed for data and text content.                                                                                                                                       | QANOV-492189 |
          | o2de    | Display cards       | new_display_cards       | This module is specifically designed to highlight visual or multimedia content.                                                                                                                       | QANOV-492190 |
          | o2de    | Poster cards        | new_poster_cards        | This module is specifically designed to visually highlight the content.                                                                                                                               | QANOV-492191 |
          | o2de    | Banner hero         | new_banner_hero         | This module is designed to highlight content in a very relevant and brief way                                                                                                                         | QANOV-492192 |
          | o2de    | Naked cards         | new_naked_cards         | Module that shows highlighted content related to offers, products, services and audiovisual content. Unlike Naked Small Cards, here the image has more weight and presence, therefore more relevance. | QANOV-492193 |
          | o2de    | Naked small cards   | new_naked_small_cards   | This module displays featured content related to offers, products, services and audiovisual content.                                                                                                  | QANOV-492194 |
          | o2de    | Carousel circle     | new_carousel_circle     | TBD                                                                                                                                                                                                   | QANOV-492195 |
          | moves   | Featured content    | new_featured_content    | This module is designed to accommodate any type of generic content, from devices, news, services, offers, etc.                                                                                        | QANOV-492196 |
          | moves   | Vertical cards      | new_vertical_cards      | This module is designed to give a detailed and concise description of our products, such as mobiles, gadgets, wearables, etc.                                                                         | QANOV-492197 |
          | moves   | Rows                | new_rows                | This module, designed as a list, has different elements to display personalized content to the user.                                                                                                  | QANOV-492198 |
          | moves   | Banner              | new_banner              | This module is designed to support relevant campaign content and promotions in banner format.                                                                                                         | QANOV-492199 |
          | moves   | Highlighted cards   | new_highlighted_cards   | This module is designed to highlight content in a very brief way.                                                                                                                                     | QANOV-492200 |
          | moves   | Virtual modules     | new_virtual_module      | This module works as any other CMS module but without visual design to adjust its space and display any content injected by API Content.                                                              | QANOV-492201 |
          | moves   | Data cards          | new_data_cards          | This module is specifically designed for data and text content.                                                                                                                                       | QANOV-492202 |
          | moves   | Display cards       | new_display_cards       | This module is specifically designed to highlight visual or multimedia content.                                                                                                                       | QANOV-492203 |
          | moves   | Poster cards        | new_poster_cards        | This module is specifically designed to visually highlight the content.                                                                                                                               | QANOV-492204 |
          | moves   | Banner hero         | new_banner_hero         | This module is designed to highlight content in a very relevant and brief way                                                                                                                         | QANOV-492205 |
          | moves   | Naked cards         | new_naked_cards         | Module that shows highlighted content related to offers, products, services and audiovisual content. Unlike Naked Small Cards, here the image has more weight and presence, therefore more relevance. | QANOV-492206 |
          | moves   | Naked small cards   | new_naked_small_cards   | This module displays featured content related to offers, products, services and audiovisual content.                                                                                                  | QANOV-492207 |
          | moves   | Carousel circle     | new_carousel_circle     | TBD                                                                                                                                                                                                   | QANOV-492208 |
          | o2es    | Featured content    | new_featured_content    | This module is designed to accommodate any type of generic content, from devices, news, services, offers, etc.                                                                                        | QANOV-492209 |
          | o2es    | Vertical cards      | new_vertical_cards      | This module is designed to give a detailed and concise description of our products, such as mobiles, gadgets, wearables, etc.                                                                         | QANOV-492210 |
          | o2es    | Rows                | new_rows                | This module, designed as a list, has different elements to display personalized content to the user.                                                                                                  | QANOV-492211 |
          | o2es    | Banner              | new_banner              | This module is designed to support relevant campaign content and promotions in banner format.                                                                                                         | QANOV-492212 |
          | o2es    | Highlighted cards   | new_highlighted_cards   | This module is designed to highlight content in a very brief way.                                                                                                                                     | QANOV-492213 |
          | o2es    | Virtual modules     | new_virtual_module      | This module works as any other CMS module but without visual design to adjust its space and display any content injected by API Content.                                                              | QANOV-492214 |
          | o2es    | Data cards          | new_data_cards          | This module is specifically designed for data and text content.                                                                                                                                       | QANOV-492215 |
          | o2es    | Display cards       | new_display_cards       | This module is specifically designed to highlight visual or multimedia content.                                                                                                                       | QANOV-492216 |
          | o2es    | Poster cards        | new_poster_cards        | This module is specifically designed to visually highlight the content.                                                                                                                               | QANOV-492217 |
          | o2es    | Banner hero         | new_banner_hero         | This module is designed to highlight content in a very relevant and brief way                                                                                                                         | QANOV-492218 |
          | o2es    | Naked cards         | new_naked_cards         | Module that shows highlighted content related to offers, products, services and audiovisual content. Unlike Naked Small Cards, here the image has more weight and presence, therefore more relevance. | QANOV-492219 |
          | o2es    | Naked small cards   | new_naked_small_cards   | This module displays featured content related to offers, products, services and audiovisual content.                                                                                                  | QANOV-492220 |
          | o2es    | Carousel circle     | new_carousel_circle     | TBD                                                                                                                                                                                                   | QANOV-492221 |

  @jira.<jira_id> @<product> @jira.cv.Future @manual @web
  Scenario Outline: A user will see all the aspect ratio options when selects to create a <module_type> module
    O2es will have all the modules enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
     When I go to "[CONF:cms.base][CONF:cms.modules_repo][CONF:cms.modules_create]" web page
      And the "Create Module" page is loaded
      And I click on the "<module_type_button>" button
     Then the text of the element "aspect_ratio_title" is equal to "Image aspect ratio"
      And the text of the element "aspect_ratio_desc" is equal to "Once the aspect ratio of the cards has been chosen, it cannot be changed."
      And the "aspect_ratio_radio_buttons" radio button list with "aspect_ratio" text is displayed

    @smoke
    Examples:
          | product | module_type      | module_type_button   | aspect_ratio         | jira_id      |
          | vivobr  | Featured content | new_featured_content | 16:9\|4:3\|1:1       | QANOV-492222 |
          | vivobr  | Naked cards      | new_naked_cards      | 16:9\|4:3\|1:1       | QANOV-492223 |
          | vivobr  | Display cards    | new_display_cards    | 9:10\|16:9\|4:3\|1:1 | QANOV-492224 |
          | vivobr  | Poster cards     | new_poster_cards     | 9:10\|16:9\|4:3\|1:1 | QANOV-492225 |
          | o2uk    | Featured content | new_featured_content | 16:9\|4:3\|1:1       | QANOV-492226 |
          | o2uk    | Naked cards      | new_naked_cards      | 16:9\|4:3\|1:1       | QANOV-492227 |
          | o2uk    | Display cards    | new_display_cards    | 9:10\|16:9\|4:3\|1:1 | QANOV-492228 |
          | o2uk    | Poster cards     | new_poster_cards     | 9:10\|16:9\|4:3\|1:1 | QANOV-492229 |
          | blaude  | Featured content | new_featured_content | 16:9\|4:3\|1:1       | QANOV-492230 |
          | blaude  | Naked cards      | new_naked_cards      | 16:9\|4:3\|1:1       | QANOV-492231 |
          | blaude  | Display cards    | new_display_cards    | 9:10\|16:9\|4:3\|1:1 | QANOV-492232 |
          | blaude  | Poster cards     | new_poster_cards     | 9:10\|16:9\|4:3\|1:1 | QANOV-492233 |
          | o2de    | Featured content | new_featured_content | 16:9\|4:3\|1:1       | QANOV-492234 |
          | o2de    | Naked cards      | new_naked_cards      | 16:9\|4:3\|1:1       | QANOV-492235 |
          | o2de    | Display cards    | new_display_cards    | 9:10\|16:9\|4:3\|1:1 | QANOV-492236 |
          | o2de    | Poster cards     | new_poster_cards     | 9:10\|16:9\|4:3\|1:1 | QANOV-492237 |
          | moves   | Featured content | new_featured_content | 16:9\|4:3\|1:1       | QANOV-492238 |
          | moves   | Naked cards      | new_naked_cards      | 16:9\|4:3\|1:1       | QANOV-492239 |
          | moves   | Display cards    | new_display_cards    | 9:10\|16:9\|4:3\|1:1 | QANOV-492240 |
          | moves   | Poster cards     | new_poster_cards     | 9:10\|16:9\|4:3\|1:1 | QANOV-492241 |
          | o2es    | Featured content | new_featured_content | 16:9\|4:3\|1:1       | QANOV-492242 |

    @regression
    Examples:
          | product | module_type   | module_type_button | aspect_ratio         | jira_id      |
          | o2es    | Naked cards   | new_naked_cards    | 16:9\|4:3\|1:1       | QANOV-492243 |
          | o2es    | Display cards | new_display_cards  | 9:10\|16:9\|4:3\|1:1 | QANOV-492244 |
          | o2es    | Poster cards  | new_poster_cards   | 9:10\|16:9\|4:3\|1:1 | QANOV-492245 |

  @jira.<jira_id> @<product> @jira.cv.Future @manual @regression @web
  Scenario Outline: A user will see all the options when selects to create a virtual module module
    O2es will have all the modules enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
     When I go to "[CONF:cms.base][CONF:cms.modules_repo][CONF:cms.modules_create]" web page
      And the "Create Module" page is loaded
      And I click on the "new_virtual_module" button
     Then the text of the element "container_id_title" is equal to "Container ID"
      And the text of the element "container_id_desc" is equal to "This field represents the container_id field that would be used when calling the Explore Content v4 Kernel API"
      And the "container_id_input" inputtext with the "Module ID" placeholder is displayed
      And the text of the element "categories_title" is equal to "Categories"
      And the text of the element "categories_desc" is equal to "You must provide at least one of each of the categories below."
      And the text of the element "explore_categories_subtitle" is equal to "Exlore card categories"
      And the "explore_categories_checkbox_list" list is displayed
      And the text of the element "acount_categories_subtitle" is equal to "Account card categories"
      And the "none_radio_button" element is displayed
      And the "account_radio_button" element is displayed
      And the text of the element "star_tab_title" is equal to "Start tab"
      And the "start_tab_checkbox" list is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-492246 |
          | o2uk    | QANOV-492247 |
          | blaude  | QANOV-492248 |
          | o2de    | QANOV-492249 |
          | moves   | QANOV-492250 |
          | o2es    | QANOV-492251 |

  @jira.<jira_id> @<product> @jira.link.depends_on.<depends_on> @regression @web
  Scenario Outline: A user can cancel the process to create a module
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    O2es will have all the modules enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
     When I go to "[CONF:cms.base][CONF:cms.modules_repo][CONF:cms.modules_create]" web page
      And the "Create Module" page is loaded
      And I click on the "cancel_button" button
     Then the "Modules Repository" page is loaded

    @automatic @jira.cv.11.14 @qa
    Examples:
          | product | depends_on | jira_id      |
          | vivobr  | QANOV-9538 | QANOV-9541   |
          | o2uk    | QANOV-9539 | QANOV-9542   |
          | moves   | QANOV-9540 | QANOV-9543   |
          | blaude  |            | QANOV-286047 |

    @jira.cv.14.3 @manual
    Examples:
          | product | depends_on | jira_id      |
          | o2de    |            | QANOV-384540 |

    @jira.cv.Future @manual
    Examples:
          | product | depends_on | jira_id      |
          | o2es    |            | QANOV-384541 |

  @jira.<jira_id> @<product> @jira.link.depends_on.<depends_on> @web
  Scenario Outline: A user can create a <module_type> module
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    O2es will have all the modules enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
     When I go to "[CONF:cms.base][CONF:cms.modules_repo][CONF:cms.modules_create]" web page
      And the "Create Module" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "QA <module_type> test"
      And I store the text in the "internal_name_input" element in the context storage with key "module_internal_name"
      And I click on the "<module_type>" button
      And I click on the "create_button" button
      And the "Edit Module" page is loaded
      And I click on the "header_save_button" button
      And the "Modules Repository" page is loaded
      And waits until the "filter_modules_button" element is clickable
      And waits "1" seconds
      And I click on the "filter_modules_button" button
      And waits until the "modules_options_overlay" element is visible
      And I click on the "module_option_all" button
     Then any element in the "modules_list" list has the "name" textfield with the "[CONTEXT:module_internal_name]" text

    @automatic @jira.cv.11.14 @qa @sanity
    Examples:
          | product | module_type           | jira_id      |
          | vivobr  | new_featured_content  | QANOV-9556   |
          | vivobr  | new_vertical_cards    | QANOV-9559   |
          | vivobr  | new_rows              | QANOV-9562   |
          | vivobr  | new_highlighted_cards | QANOV-286052 |
          | o2uk    | new_featured_content  | QANOV-9557   |
          | o2uk    | new_vertical_cards    | QANOV-9560   |
          | o2uk    | new_rows              | QANOV-9563   |
          | o2uk    | new_highlighted_cards | QANOV-286053 |
          | moves   | new_featured_content  | QANOV-9558   |
          | moves   | new_vertical_cards    | QANOV-9561   |
          | moves   | new_rows              | QANOV-9564   |
          | moves   | new_highlighted_cards | QANOV-286054 |
          | blaude  | new_featured_content  | QANOV-286048 |
          | blaude  | new_vertical_cards    | QANOV-286049 |
          | blaude  | new_rows              | QANOV-286050 |
          | blaude  | new_highlighted_cards | QANOV-286055 |
          | o2de    | new_featured_content  | QANOV-384542 |
          | o2de    | new_vertical_cards    | QANOV-384543 |
          | o2de    | new_rows              | QANOV-384544 |
          | o2de    | new_highlighted_cards | QANOV-384545 |

    @jira.cv.14.3 @manual @sanity
    Examples:
          | product | module_type             | jira_id      |
          | vivobr  | new_banner              | QANOV-307667 |
          | vivobr  | new_data_cards          | QANOV-384547 |
          | vivobr  | new_display_cards       | QANOV-384551 |
          | vivobr  | new_banner_hero_cards   | QANOV-384555 |
          | vivobr  | new_poster_cards        | QANOV-492252 |
          | vivobr  | new_data_cards_advanced | QANOV-492253 |
          | vivobr  | new_naked_cards         | QANOV-492254 |
          | vivobr  | new_small_naked_cards   | QANOV-492255 |
          | o2uk    | new_banner              | QANOV-307668 |
          | o2uk    | new_data_cards          | QANOV-384548 |
          | o2uk    | new_display_cards       | QANOV-384552 |
          | o2uk    | new_banner_hero_cards   | QANOV-384556 |
          | o2uk    | new_poster_cards        | QANOV-492256 |
          | o2uk    | new_naked_cards         | QANOV-492257 |
          | o2uk    | new_small_naked_cards   | QANOV-492258 |
          | moves   | new_display_cards       | QANOV-328255 |
          | moves   | new_data_cards          | QANOV-328256 |
          | moves   | new_banner_hero_cards   | QANOV-328258 |
          | moves   | new_banner              | QANOV-307669 |
          | moves   | new_poster_cards        | QANOV-492259 |
          | moves   | new_naked_cards         | QANOV-492260 |
          | moves   | new_small_naked_cards   | QANOV-492261 |
          | blaude  | new_banner              | QANOV-307670 |
          | blaude  | new_data_cards          | QANOV-384549 |
          | blaude  | new_display_cards       | QANOV-384553 |
          | blaude  | new_banner_hero_cards   | QANOV-384557 |
          | blaude  | new_poster_cards        | QANOV-492262 |
          | blaude  | new_naked_cards         | QANOV-492263 |
          | blaude  | new_small_naked_cards   | QANOV-492264 |
          | o2de    | new_banner              | QANOV-384546 |
          | o2de    | new_data_cards          | QANOV-384550 |
          | o2de    | new_display_cards       | QANOV-384554 |
          | o2de    | new_banner_hero_cards   | QANOV-384558 |
          | o2de    | new_poster_cards        | QANOV-492265 |
          | o2de    | new_naked_cards         | QANOV-492266 |
          | o2de    | new_small_naked_cards   | QANOV-492267 |
          | o2es    | new_featured_content    | QANOV-384559 |

    @jira.cv.Future @manual @sanity
    Examples:
          | product | module_type        | jira_id      |
          | vivobr  | new_virtual_module | QANOV-389918 |
          | o2uk    | new_virtual_module | QANOV-389919 |
          | moves   | new_virtual_module | QANOV-389920 |
          | blaude  | new_virtual_module | QANOV-389921 |
          | o2de    | new_virtual_module | QANOV-389922 |

    @jira.cv.Future @manual @regression
    Examples:
          | product | module_type           | jira_id      |
          | o2es    | new_vertical_cards    | QANOV-384560 |
          | o2es    | new_rows              | QANOV-384561 |
          | o2es    | new_highlighted_cards | QANOV-384562 |
          | o2es    | new_banner            | QANOV-384563 |
          | o2es    | new_data_cards        | QANOV-384564 |
          | o2es    | new_display_cards     | QANOV-384565 |
          | o2es    | new_banner_hero_cards | QANOV-384566 |
          | o2es    | new_virtual_module    | QANOV-389923 |
          | o2es    | new_poster_cards      | QANOV-492268 |
          | o2es    | new_naked_cards       | QANOV-492269 |
          | o2es    | new_small_naked_cards | QANOV-492270 |

  @jira.<jira_id> @<product> @TBD @jira.cv.Future @jira.link.parent_test_plan.QANOV-386148 @manual @regression @web
  Scenario Outline: A user can create a new virtual module
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    The virtual modules have a container with a container_id with a certain configuration injected via API Content v4,
    this module will have the modules and cards defined in the container.
     When I go to "[CONF:cms.base][CONF:cms.modules_repo][CONF:cms.modules_create]" web page
      And the "Create Module" page is loaded
      And I fill in the "name_input" field with "QA virtual module"
      And I click on the "new_virtual_module" button
      And I fill in the "container_id_input_placeholder" field with "TBD"
      And I select the "first_category" option from "categories_checkbox_list" field
      And I click on the "header_create_button" button
      And the "Edit module" page is loaded
      And I click on the "header_save_button" button
     Then the "Modules Repository" page is loaded
      And the "crouton_message" textfield that contains the "created" text is displayed
      And the "modules_list" elements list contains the text "QA virtual module"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-389926 |
          | o2uk    | QANOV-389927 |
          | moves   | QANOV-389928 |
          | blaude  | QANOV-389930 |
          | o2de    | QANOV-389931 |
          | o2es    | QANOV-389932 |

  @jira.<jira_id> @<product> @ber @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @smoke @web
  Scenario Outline: A user can see the existing modules in the modules repository
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
     Then the "Modules Repository" page is loaded
      And the "create_module_button" element is displayed
      And the "filter_by_module_type_selector" element is displayed
      And the "filter_by_status_selector" element is displayed
      And the "filter_by_name_inputtext" inputtext with the "Filter by name" placeholder is displayed
      And the "modules_list" list is displayed
      And each item in the "modules_list" list has the "name" field
      And each item in the "modules_list" list has the "module_type" field
      And each item in the "modules_list" list has the "status" field
      And each item in the "modules_list" list has the "layouts" field
      And each item in the "modules_list" list has the "actions" field

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-22124  |
          | o2uk    | QANOV-22125  |
          | moves   | QANOV-22126  |
          | blaude  | QANOV-286056 |
          | o2de    | QANOV-384569 |
          | o2es    | QANOV-384570 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user can differentiate the modules being published from the not published ones
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I select the "<option>" option from "filter_by_status_selector" field
     Then each item in the "modules_list" list has the "status" field with the "<option>" text

    Examples:
          | product | option              | jira_id      |
          | vivobr  | Pending publication | QANOV-552685 |
          | vivobr  | Published           | QANOV-552686 |
          | o2uk    | Pending publication | QANOV-552687 |
          | o2uk    | Published           | QANOV-552689 |
          | moves   | Pending publication | QANOV-552690 |
          | moves   | Published           | QANOV-552691 |
          | blaude  | Pending publication | QANOV-552692 |
          | blaude  | Published           | QANOV-552693 |
          | o2de    | Pending publication | QANOV-552694 |
          | o2de    | Published           | QANOV-552696 |
          | o2es    | Pending publication | QANOV-552697 |
          | o2es    | Published           | QANOV-552698 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user can select to show all the modules pubilished and not published
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Active modules are the ones with layouts assigned to them.
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I select the "All" option from "filter_by_status_selector" field
     Then all the modules are shown with the "status" field

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-35171  |
          | o2uk    | QANOV-35172  |
          | moves   | QANOV-35173  |
          | blaude  | QANOV-286057 |
          | o2de    | QANOV-384571 |
          | o2es    | QANOV-384572 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can differentiate the modules by a module type
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Active modules are the ones with layouts assigned to them.
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I select the "<module_type>" option from "filter_by_module_type" field
     Then each element in the "modules_list" list has the "module_type" textfield with "<module_type>" text

    @jira.cv.14.6
    Examples:
          | product | module_type         | jira_id      |
          | vivobr  | Featured content    | QANOV-492289 |
          | vivobr  | Vertical cards      | QANOV-492290 |
          | vivobr  | Rows                | QANOV-492291 |
          | vivobr  | Banner              | QANOV-492292 |
          | vivobr  | Highlighted cards   | QANOV-492293 |
          | vivobr  | Data cards          | QANOV-492294 |
          | vivobr  | Banner hero         | QANOV-492295 |
          | vivobr  | Display cards       | QANOV-492296 |
          | vivobr  | Virtual             | QANOV-492297 |
          | vivobr  | Data cards advanced | QANOV-492298 |
          | vivobr  | Poster cards        | QANOV-492299 |
          | vivobr  | Naked cards         | QANOV-492300 |
          | vivobr  | Naked small cards   | QANOV-492301 |
          | o2uk    | Featured content    | QANOV-492302 |
          | o2uk    | Vertical cards      | QANOV-492303 |
          | o2uk    | Rows                | QANOV-492304 |
          | o2uk    | Banner              | QANOV-492305 |
          | o2uk    | Highlighted cards   | QANOV-492306 |
          | o2uk    | Data cards          | QANOV-492307 |
          | o2uk    | Banner hero         | QANOV-492308 |
          | o2uk    | Display cards       | QANOV-492309 |
          | o2uk    | Virtual             | QANOV-492310 |
          | o2uk    | Poster cards        | QANOV-492311 |
          | o2uk    | Naked cards         | QANOV-492312 |
          | o2uk    | Naked small cards   | QANOV-492313 |
          | moves   | Featured content    | QANOV-492314 |
          | moves   | Vertical cards      | QANOV-492315 |
          | moves   | Rows                | QANOV-492316 |
          | moves   | Banner              | QANOV-492317 |
          | moves   | Highlighted cards   | QANOV-492318 |
          | moves   | Data cards          | QANOV-492319 |
          | moves   | Banner hero         | QANOV-492320 |
          | moves   | Display cards       | QANOV-492321 |
          | moves   | Virtual             | QANOV-492322 |
          | moves   | Poster cards        | QANOV-492323 |
          | moves   | Naked cards         | QANOV-492324 |
          | moves   | Naked small cards   | QANOV-492325 |
          | moves   | Display cards       | QANOV-492326 |
          | blaude  | Featured content    | QANOV-492327 |
          | blaude  | Vertical cards      | QANOV-492328 |
          | blaude  | Rows                | QANOV-492329 |
          | blaude  | Banner              | QANOV-492330 |
          | blaude  | Highlighted cards   | QANOV-492331 |
          | blaude  | Data cards          | QANOV-492332 |
          | blaude  | Banner hero         | QANOV-492333 |
          | blaude  | Display cards       | QANOV-492334 |
          | blaude  | Virtual             | QANOV-492335 |
          | blaude  | Poster cards        | QANOV-492336 |
          | blaude  | Naked cards         | QANOV-492337 |
          | blaude  | Naked small cards   | QANOV-492338 |
          | blaude  | Display cards       | QANOV-492339 |
          | o2de    | Featured content    | QANOV-492340 |
          | o2de    | Vertical cards      | QANOV-492341 |
          | o2de    | Rows                | QANOV-492342 |
          | o2de    | Banner              | QANOV-492343 |
          | o2de    | Highlighted cards   | QANOV-492344 |
          | o2de    | Data cards          | QANOV-492345 |
          | o2de    | Banner hero         | QANOV-492346 |
          | o2de    | Display cards       | QANOV-492347 |
          | o2de    | Virtual             | QANOV-492348 |
          | o2de    | Poster cards        | QANOV-492349 |
          | o2de    | Naked cards         | QANOV-492350 |
          | o2de    | Naked small cards   | QANOV-492351 |
          | o2de    | Carousel cards      | QANOV-492352 |
          | o2de    | Display cards       | QANOV-492353 |
          | o2de    | Featured content    | QANOV-492354 |
          | o2es    | Vertical cards      | QANOV-492355 |
          | o2es    | Rows                | QANOV-492356 |
          | o2es    | Banner              | QANOV-492357 |
          | o2es    | Highlighted cards   | QANOV-492358 |
          | o2es    | Data cards          | QANOV-492359 |
          | o2es    | Banner hero         | QANOV-492360 |
          | o2es    | Display cards       | QANOV-492361 |
          | o2es    | Virtual             | QANOV-492362 |
          | o2es    | Poster cards        | QANOV-492363 |
          | o2es    | Naked cards         | QANOV-492364 |
          | o2es    | Naked small cards   | QANOV-492365 |
          | o2es    | Carousel cards      | QANOV-492366 |
          | o2es    | Display cards       | QANOV-492367 |

  @jira.<jira_id> @<product> @manual @regression @tbd @web
  Scenario Outline: A user can filter the modules by the name
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Active modules are the ones with layouts assigned to them.
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I fill in the "filter_by_name_inputtext" field with "TBD"
     Then any element in the "modules_list" list has the "name" textfield with the "TBD" text

    @jira.cv.14.6
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-492368 |
          | o2uk    | QANOV-492369 |
          | moves   | QANOV-492370 |
          | blaude  | QANOV-492371 |
          | o2de    | QANOV-492372 |
          | o2es    | QANOV-492373 |
