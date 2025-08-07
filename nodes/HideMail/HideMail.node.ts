import { INodeType, INodeTypeDescription, NodeConnectionType } from 'n8n-workflow';
import { N8NPropertiesBuilder, N8NPropertiesBuilderConfig } from '@devlikeapro/n8n-openapi-node';
import * as doc from './openapi.json';

const config: N8NPropertiesBuilderConfig = {};
const parser = new N8NPropertiesBuilder(doc, config);
const properties = parser.build();

export class HideMail implements INodeType {
	description: INodeTypeDescription = {
		displayName: 'HideMail',
		name: 'hidemail',
		icon: 'file:hidemail.svg',
		group: ['communication'],
		version: 1,

		description: 'Interact with HideMail API - Create and manage email aliases',
		defaults: {
			name: 'HideMail',
		},
		inputs: [NodeConnectionType.Main],
		outputs: [NodeConnectionType.Main],
		credentials: [
			{
				name: 'hidemailApi',
				required: true,
			},
		],
		requestDefaults: {
			headers: {
				Accept: 'application/json',
				'Content-Type': 'application/json',
				Authorization: '=Bearer {{$credentials.apiToken}}',
			},
			baseURL: '={{$credentials.baseUrl}}',
		},

		properties: properties,
	};
}
