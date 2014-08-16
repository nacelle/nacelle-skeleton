"""nacelle-skeleton example routes
"""
# third-party imports
from webapp2 import Route


# simple route definition for the handler below
ROUTES = [
    Route(r'/', 'app.handlers.index', name='index'),
]
