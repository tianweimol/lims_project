#!/usr/bin/env python
# encoding: utf-8

"""
@author: zhanghe
@software: PyCharm
@file: response.py
@time: 2019-09-27 11:30
"""

from __future__ import unicode_literals

from flask_restful import fields

fields_item = {
    'id': fields.Integer(attribute='id'),
    'code': fields.String(attribute='code'),
    'name': fields.String(attribute='name'),
    # 'standard_id': fields.Integer(attribute='standard_id'),  # TODO 废弃
    'condition': fields.String(attribute='condition'),
    'note': fields.String(attribute='note'),
    'create_time': fields.DateTime(dt_format=b'iso8601'),
    'update_time': fields.DateTime(dt_format=b'iso8601'),
}
