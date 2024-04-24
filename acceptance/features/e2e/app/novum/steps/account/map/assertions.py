"""
Account Map assertions steps
"""

import re
from time import sleep

from behave import step as behave_step  # noqa: F401
from selenium.common.exceptions import WebDriverException
from toolium_telefonica.behave import step

from geopy.geocoders import Nominatim

from acceptance.common.steps.actions.elements import get_element_from_page


@step('the map with the "{location}" location is displayed')
def map_location_is_displayed(context, location):
    """
    Step. Assert that the map location is correct

    :param context: behave context
    :param location: location to check in the map
    """
    sleep(2)
    element = get_element_from_page(context, 'location_text')
    map_location = element.text
    if location != 'current':
        assert location == map_location, f"Current map location '{map_location}' it is not the expected: '{location}'"
    else:
        try:
            current_location = context.driver.location
        except WebDriverException:
            sleep(2)
            current_location = context.driver.location
        geolocator = Nominatim(user_agent="NovumTest")
        location = geolocator.reverse(str(current_location['latitude']) + "," + str(current_location['longitude']))
        address = location.raw['address']

        pattern_cp = '[0-9]{5}.*,'
        pattern = r'[0-9]'
        # Only working for Spain address
        map_location = re.findall(pattern_cp, map_location)
        map_location = map_location[0].split(',')
        map_city = re.sub(pattern, '', map_location[0]).replace(',', '')
        current_city = address.get('city', '')
        if not current_city:
            current_city = address.get('village', '')
        if not current_city:
            current_city = address.get('town', '')
        if not current_city:
            raise Exception("Error locating the user")

        assert map_city.strip() in current_city, f"Current city '{current_city}' " \
                                                 f"it is not shown in the map: '{map_city.strip()}'"
