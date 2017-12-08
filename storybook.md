title: Design for Succcess with React and Storybook.js
controls: false
style: storybook.css
theme: ./node_modules/reveal-cleaver-theme
--

# Design for Success
## with React and Storybooks

-- intro-slide

# Chris Saylor

## Lead Engineer @ Zumba

@cjsaylor

--

# Design?
## That's someone elses job.

-- sketchapp

Ugh, another sketch/photoshop slice job. Maybe, if I had been involved...

--

### Why do we do it?

* No code involved, so designers can work completely independently
* Developers usually viewed as "bad" designers

--

### Having Designs delivered:
* Inconsistant designs between "pages"
* Can't easily show animations or responsive designs
* Usually design elements are not modular or componentized
* Version control?
* Some things may not be possible in a browser
* Still have a lot of work to "translate" to html
... and it may not be pixel perfect!

--

# How do we bridge the gap?

--

# Storybook.js

-- storybook

--

### Why Storybook.js?
* Integrates with React and Vue.js
* Immediate feedback of changes
* Easily see history of changes
* At the end of the design phase, we have functional components!

--

# How?

--

> Disclaimer: you'll need developer and designer buy-in

--

### Keep data retrieval separate

* Avoid state in your views as much as possible
* Compose your components as much as possible
* Use props to pass in data

--

### Typical React Tutorial Component

```jsx
export default class ListComponent extends React.Component {
    state = { items: [] }

    async componentDidMount() {
        this.setState({
            items: await fetch('/items')
        });
    }

    renderItems() {
        return this.state.items.map(item => <li>{item}</li>)
    }

    render() {
        return (
            <ul>{ this.renderItems() }</ul>
        );
    }
}
```

--

# Separate!

--

### Use props to display
```jsx
export default class ListComponent extends React.Component {

    renderItems = () => {
        return (this.props.items || []).map(item => <li>{item}</li>)
    }

    render() {
        return (
            <ul>
                { this.renderItems() }
            </ul>
        )
    }
}
```

--

### Pass the state data to the view
```jsx
import List from './list-component';
export class ListContainer extends React.Component {

    state = { items: [] }

    async componentDidMount() {
        this.setState({
            items: await fetch('/items')
        });
    }

    render() {
        return <List items={this.state.items}/>
    }
}
```

--

# Storytime!

--

```jsx
import { storiesOf } from '@storybook/react';
import List from './list-component';

storiesOf('List', module)
    .add('No items', () => <List />)
    .add('One item', () => <List items={['item 1']} />)
    .add('Multiple items', () => {
        return <List items={['item 1', 'item 2', 'item 3']} />;
    });

```

--

![](./04-storybook.png)

--

![](./05-storybook.png)

--

![](./06-storybook.png)

--

### Storybook Capabilities

* Show when user actions occur in the view

-- actions

--

### Add a click action

```jsx
export default class ListComponent extends React.Component {

    onClick = (e) => {
        this.props.onItemClicked(e.target.innerText);
    }

    renderItems = () => {
        return (this.props.items || [])
            .map(item => {
                return <li onClick={this.onClick}>{item}</li>
            });
    }

    render() {
        return <ul>{ this.renderItems() }</ul>
    }

}
```

--

### Modify our story for the action

```jsx
import { storiesOf, action } from '@storybook/react';
import List from './list-component';

storiesOf('List', module)
    .add('No items', () => <List />)
    .add('One item', () => <List items={['item 1']} />)
    .add('Multiple items', () => {
        return (
            <List
                onItemClicked={action('Item clicked!')}
                items={['item 1', 'item 2', 'item 3']}
            />
        );
    });

```

--

### Storybook Capabilities

* Allow User Input In Stories

-- knobs

--

### Add the "knobs" addon

```js
// addons.js
import '@storybook/addon-knobs/register';
```

This is what is responsible for showing the panel

--

### Modify the story
```jsx
import { storiesOf, action } from '@storybook/react';
import List from './list-component';
import {withKnobs, array} from '@storybook/addon-knobs';

storiesOf('List', module)
	.addDecorator(withKnobs)
	.add('Multiple items', () => {
        return (
            <List
                onItemClicked={action('Item clicked!')}
                items={
                    array('Items', [
                        'item 1',
                        'item 2',
                        'item 3'
                    ])
                }
            />
        );
    });
```

--

### Storybook Capabilities

* Interactive Unit Tests

-- unittest

--

### Conclusion

* Getting involved in the design process doesn't have to be scary
* Start fresh or add to existing React/VueJS app
* Hit the ground running when designs are finished
* Version control designs and their stories

--

### Resources

* https://github.com/cjsaylor/design-for-success-slides
* https://www.chris-saylor.com/design-for-success-slides/example

--

# Questions?

--

![](./columbo.jpg)

--

## React-Native considerations

--

### Remember this?
```jsx
import List from './list-component';
export class ListContainer extends React.Component {

    state = { items: [] }

    async componentDidMount() {
        this.setState({
            items: await fetch('/items')
        });
    }

    render() {
        return <List items={this.state.items}/>
    }
}
```

--

### React DOM & Native...together?

--

### Higher-Order Component (HOC)

> Reference: https://reactjs.org/docs/higher-order-components.html

--

```jsx
export default function withListData(WrappedComponent) {
    return class extends React.Component {
        state = { items: [] }
        async componentDidMount() {
            this.setState({
                items: await fetch('/items')
            });
        }

        render() {
            return <WrappedComponent items={this.state.items}/>
        }
    }
}
```

--

### Using the new HOC in React Native

```jsx
import List from './list-component';
import withListData from 'list-container';

export default class SomeReactView extends React.Component {
    componentDidMount() {
        this.wrappedList = withListData(<List/>);
    }

    render() {
        const WrappedList = this.wrappedList;
        return <WrappedList/>;
    }
}
```

--

# Fin