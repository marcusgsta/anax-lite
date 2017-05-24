Revision History
=========================

v0.1 (2017-04-04)
-------------------------

First working version of the micro framework.

Includes cimage


v1.0.0 (2017-04-10)
-------------------------

Build me-page with home, about and report-pages. Built a navbar.


v2.0.0 (2017-04-19)
-------------------------

Added classes for Navbar and Session and routes for session

v2.0.1 (2017-04-23)
-------------------------

Added a calendar, with classes, navigation, and view

v3.0.0 (2017-05-08)
-------------------------

Added login funcionality, admin pages and admin privileges

v4.0.0 (2017-05-24)
-------------------------

Förbättrade route för tillgång till admin-sidor, med en route admin/** vilket gör att alla routes under admin/ kontrolleras.

v4.0.1 (2017-05-24)
-------------------------

Skapade metoden renderPage() i app-klassen. För att korta ner koden i routerna. Jag sänder $title och $page (och $data om det behövs) till app->renderPage, och sparar kodrader.
