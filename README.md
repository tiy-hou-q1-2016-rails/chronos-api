Chronos - API
==========

An API to let students checkin in to classrooms, using iBeacons

How to Run
---------------

1. Get on heroku
2. Create a Cohort (admin is through heroku console) with a invite code, with
   the beacon id set to the ibeacon's ID
3. Each day run `rake chronos:daily_book`
4. Give students access to the React Native Application
5. Each day, students press their phone to the beacon and checkin

Stack
----

* Rails 4.2
* Doorkeeper
* PostgreSQL

Models
-----

* Student
* Cohort
* Day
* Checkin

LICENSE
-------

The MIT License (MIT)

Copyright (c) 2016 Jesse Wolgamott

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
