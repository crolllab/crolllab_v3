---
title: Contact
nav:
  order: 6
---

# {% include icon.html icon="fa-regular fa-envelope" %}Contact

We are always happy to receive a message! 

_Interested in joining our lab?_ You can either propose to apply for a fellowship (SNSF Postdoctoral Fellowship, Marie Curie, EMBO, HFSP, Swiss Government Excellence, etc.) or inquire about PhD student/postdoc openings in the lab. Please make sure to briefly explain why you’d like to join us, what your background is and what general interests you have moving forward.

{%
  include button.html
  type="email"
  text="daniel.croll@unine.ch"
  link="daniel.croll@unine.ch"
%}
{%
  include button.html
  type="phone"
  text="+41 (0) 32 718 23 30"
  link="+41 (0) 32 718 23 30"
%}
{%
  include button.html
  type="address"
  tooltip="Our location on Google Maps for easy navigation"
  link="https://www.google.com/maps/place/Rue+Emile-Argand+11,+2000+Neuchâtel/@46.9974915,6.9359098,14.92z/data=!4m6!3m5!1s0x478e0a2666edbb0f:0xf582a3f51b276226!8m2!3d46.9999234!4d6.9493576!16s%2Fg%2F11c26rx1gw"
%}

{% include section.html %}

{% capture col1 %}

{%
  include figure.html
  image="images/contact_1.jpeg"
  caption="View of the Alps"
%}

{% endcapture %}

{% capture col2 %}

{%
  include figure.html
  image="images/contact_2.jpeg"
  caption="BBQ time"
%}

{% endcapture %}

{% capture col3 %}

{%
  include figure.html
  image="images/contact_3.jpeg"
  caption="Jura mountains"
%}

{% endcapture %}

{% include cols.html col1=col1 col2=col2 col3=col3 %}
