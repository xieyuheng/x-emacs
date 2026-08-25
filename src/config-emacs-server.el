;;; -*- lexical-binding: t; -*-
(require 'server)

(if (not (server-running-p))
    (server-start))
