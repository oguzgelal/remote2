#!/bin/bash

sudo rm -rf data \
  && docker-compose rm -fsv \
  && docker-compose up --build -d