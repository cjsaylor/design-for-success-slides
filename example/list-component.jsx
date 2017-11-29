import React, { Component } from 'react';

export default class ListComponent extends Component {

	onClick = (e) => {
		(this.props.onItemClicked || function(){})(e.target.innerText);
	}

	renderItems() {
		return (this.props.items || []).map((item, i) => <li key={i} onClick={this.onClick}>{item}</li>)
	}

	render() {
		return (
			<ul>
				{this.renderItems()}
			</ul>
		)
	}

}