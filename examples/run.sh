#!/bin/bash

puppet apply --libdir ../lib/ --debug --verbose --trace test.pp
