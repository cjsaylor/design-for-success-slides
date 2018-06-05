import React from 'react';
import { storiesOf } from '@storybook/react';
import { action } from '@storybook/addon-actions';
import List from './list-component';

import {withKnobs, array} from '@storybook/addon-knobs';

storiesOf('List', module)
	.addDecorator(withKnobs)
	.add('No items', () => <List items={[]}/>)
	.add('One item', () => <List items={['item 1']} />)
	.add('Multiple items', () => (
		<List
			onItemClicked={action('Item clicked!')}
			items={array('Items', ['item 1', 'item 2', 'item 3'])}
		/>
	));