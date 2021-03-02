#!/usr/bin/env python3

#
# Copyright 2015 Dovetail Genomics LLC
#
#

from builtins import object

class BamTags(object):

    @staticmethod
    def mate_mapq(line):
        if line.has_tag('XM'):
            return line.get_tag('XM')
        elif line.has_tag('MQ'):
            return line.get_tag('MQ')
        else:
            return KeyError

    @staticmethod
    def mate_start(line):
        return line.get_tag("XS")

    @staticmethod
    def orientation(line):
        return line.get_tag("XT")

    @staticmethod
    def junction(line):
        return line.get_tag("XJ")
