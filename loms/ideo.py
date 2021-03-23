# -*- coding: utf-8 -*-
"""Specific methods for ONISEP's IDEO database.
"""

def url_generator(transformer, formation_id, action_id, session_id):
	# print(formation_id.split('_'))
	parts = formation_id.split('_')
	return "http://www.onisep.fr/http/redirection/formation/slug/%s/%s/%s" % (
		parts[0], parts[1], session_id
	)
