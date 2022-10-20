Simple responsive webstrore front, made during Aalto university course DAD (Device-Agnostic Design).

On the landing/home/whatever -page is shown products and product categories. Most of the browsing is done here. Category can be selected from the dropdown menu.

Link to the app: https://sirbutthurtalot.github.io/project2/#/

In the topbar are search, shopping car, and user settings.
- In settings user can save their name, address, and credit card information, which are saved between sessions.
- In shooping cart view user can see what they have added to their cart, how much all the items in cart cost combined, and proceed to checkout.
  - In the checkout screen user can select payment method (options very limited, only credit cart and online banking are supported (and neither of those actually do anything.)) 
    After selecting the payment method and proceeding, a summary screen is shown to the user. This screen contains a summary of items they "bought"
- The search view allows the user to search for a specific product.

Clicking or tapping a product shows a bit more detailed product screen.

# 3 key challenges
Trying to display icons on top of other icons is apparently possible natively with flutter,
but that leads to quite convoluted code.
DropdownButton was quite annoying to set up. Documentation could have told that if hint is provided and value is null hint is shown. (Or maybe I am just blind).
Padding is quite annoying to handle since some Widgets have built in padding but other do not, which leads to a lot of unnecessary containers everywhere.

# 3 key learning moments
Using packages (like badges) is often the easiest option to achieve something that would be troublesome in flutter, 
and thus should be kept in mind.
StackOverflow provides better documentation than flutter. Even then, null-safety is very annoying consept to work with.
This project took a lot more time than I initially thought it would