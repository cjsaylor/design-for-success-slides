import React from 'react';
import { storiesOf, action } from '@storybook/react';
import List from './list-component';

import {withKnobs, array} from '@storybook/addon-knobs';

storiesOf('List', module)
	.addDecorator(withKnobs)
	.add('No items', () => <List />)
	.add('One item', () => <List items={['item 1']} />)
	.add('Multiple items', () => {
		return <List onItemClicked={action('Item clicked!')} items={array('Items', ['item 1', 'item 2', 'item 3'])} />;
	});