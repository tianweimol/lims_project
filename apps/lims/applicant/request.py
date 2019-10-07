#!/usr/bin/env python
# encoding: utf-8

"""
@author: zhanghe
@software: PyCharm
@file: request.py
@time: 2019-09-27 11:31
"""

from __future__ import unicode_literals

from flask_restful import reqparse

structure_key_item = 'applicant'

request_parser = reqparse.RequestParser()
request_parser.add_argument(structure_key_item, type=dict, location='json')

request_parser_item = reqparse.RequestParser(trim=True, bundle_errors=True)

# POST
request_post = request_parser_item.copy()

request_post.add_argument(
    name='receiver_uid',
    location=structure_key_item,
    store_missing=False,
    required=False,
    help='受理人必填',
)
request_post.add_argument(
    name='applicant_cid',
    location=structure_key_item,
    store_missing=False,
    required=True,
    help='委托单位必填',
)
request_post.add_argument(
    name='applicant_uid',
    location=structure_key_item,
    store_missing=False,
    required=True,
    help='送样人必填',
)
request_post.add_argument(
    name='detection_cid',
    location=structure_key_item,
    store_missing=False,
)
request_post.add_argument(
    name='type_detection',
    location=structure_key_item,
    store_missing=False,
    required=True,
    help='检验类型必填',
)
request_post.add_argument(
    name='type_test',
    location=structure_key_item,
    store_missing=False,
    required=True,
    help='测试类型必填',
)
request_post.add_argument(
    name='grade_id',
    location=structure_key_item,
    store_missing=False,
    required=True,
    help='样品等级必填',
)
request_post.add_argument(
    name='summary',
    location=structure_key_item,
    store_missing=False,
    required=True,
    help='样品数量必填',
)
request_post.add_argument(
    name='note',
    location=structure_key_item,
    store_missing=False,
    required=True,
    help='样品描述必填',
)
request_post.add_argument(
    name='style',
    location=structure_key_item,
    store_missing=False,
)
request_post.add_argument(
    name='sku',
    location=structure_key_item,
    store_missing=False,
)
request_post.add_argument(
    name='brand',
    location=structure_key_item,
    store_missing=False,
)
request_post.add_argument(
    name='period',
    location=structure_key_item,
    store_missing=False,
    required=True,
    help='检测周期必填',
)
request_post.add_argument(
    name='req_date',
    location=structure_key_item,
    store_missing=False,
)
request_post.add_argument(
    name='arr_date',
    location=structure_key_item,
    store_missing=False,
)

# PUT
request_put = request_parser_item.copy()

request_put.add_argument(
    name='receiver_uid',
    location=structure_key_item,
    store_missing=False,
)
request_put.add_argument(
    name='applicant_cid',
    location=structure_key_item,
    store_missing=False,
)
request_put.add_argument(
    name='applicant_uid',
    location=structure_key_item,
    store_missing=False,
)
request_put.add_argument(
    name='detection_cid',
    location=structure_key_item,
    store_missing=False,
)
request_put.add_argument(
    name='type_detection',
    location=structure_key_item,
    store_missing=False,
)
request_put.add_argument(
    name='type_test',
    location=structure_key_item,
    store_missing=False,
)
request_put.add_argument(
    name='grade_id',
    location=structure_key_item,
    store_missing=False,
)
request_put.add_argument(
    name='summary',
    location=structure_key_item,
    store_missing=False,
)
request_put.add_argument(
    name='note',
    location=structure_key_item,
    store_missing=False,
)
request_put.add_argument(
    name='style',
    location=structure_key_item,
    store_missing=False,
)
request_put.add_argument(
    name='sku',
    location=structure_key_item,
    store_missing=False,
)
request_put.add_argument(
    name='brand',
    location=structure_key_item,
    store_missing=False,
)
request_put.add_argument(
    name='period',
    location=structure_key_item,
    store_missing=False,
)
request_put.add_argument(
    name='req_date',
    location=structure_key_item,
    store_missing=False,
)
request_put.add_argument(
    name='arr_date',
    location=structure_key_item,
    store_missing=False,
)

# DELETE
request_delete = request_parser_item.copy()

request_delete.add_argument(
    name='id',
    location=structure_key_item,
    store_missing=False,
    required=True,
    help='ID必填',
)
