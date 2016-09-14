#!/bin/bash

for i in $( azure resource list ); do
            echo item: $i
        done

