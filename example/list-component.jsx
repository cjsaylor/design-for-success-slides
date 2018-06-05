import React, { Component } from 'react';

export default class ListComponent extends Component {

	onClick = (e) => {
		(this.props.onItemClicked || function(){})(e.target.innerText);
	}

	renderItems() {
		return (this.props.items || [])
			.map((item, i) => <li key={i} onClick={this.onClick}>{item}</li>)
	}

	render() {
		return (
			<div>
				{!this.props.items.length &&
					<p>No Items.</p>
				}
				<ul>
					{this.renderItems()}
				</ul>
			</div>
		)
	}

}