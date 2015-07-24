puppet-mms-automation
==========

A puppet module for installing and configuring Mongodb's [MMS-automation](https://mms.mongodb.com) agent.
Quick Start
-----------
### Basic installation with defaults
```puppet
class { 'mms-automation':
  api_key => 'a3fe2877b0dzaezadezaec516c2a2a9'
  grou_id => 'dzadeza4e5za6eza4d5'
}
```
License
-------
This module is released under the [MIT](http://opensource.org/licenses/MIT) License.
Support
-------

Running the tests
-----------------
To run the rspec-puppet tests:
`rake spec`

