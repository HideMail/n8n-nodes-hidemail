import { ICredentialType, INodeProperties } from 'n8n-workflow';

export class HideMailApi implements ICredentialType {
	name = 'hidemailApi';
	displayName = 'HideMail API';
	documentationUrl = 'https://hidemail.app';
	properties: INodeProperties[] = [
		{
			displayName: 'API Token',
			name: 'apiToken',
			type: 'string',
			typeOptions: { password: true },
			default: '',
			description:
				'The API token for HideMail. You can get this from your HideMail dashboard under API tokens.',
		},
		{
			displayName: 'Base URL',
			name: 'baseUrl',
			type: 'string',
			default: 'https://hidemail.app',
			description: 'The base URL for the HideMail API',
		},
	];
}
