#!/bin/bash

/etc/init.d/mysql start
padrino s -h 0.0.0.0

