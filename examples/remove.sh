#!/bin/bash

puppet apply --libdir ../lib/ --debug --verbose --trace remote.pp
