Simple webstrore front.


# 3 key challenges
Trying to display icons on top of other icons is apparently possible natively with flutter,
but that leads to quite convoluted code.
DropdownButton was quite annoying to set up. Documentation could have told that if hint is provided and value is null hint is shown.
Padding is quite annoying to handle since some Widgets have built in padding but other do not, which leads to a lot of unnecessary containers everywhere.

# 3 key learning moments
Using packages (like badges) is often the easiest option to achieve something that would be convoluted in flutter, 
and thus should be kept in mind.
StackOverflow provides better documentation than flutter. Even then, nullsafety is very annoying consept to work with.
This project took a lot more time than I initially thought it would