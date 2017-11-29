title: Design for Succcess with React and Storybook.js
controls: false
style: storybook.css
theme: ./node_modules/reveal-cleaver-theme
--

# Design for Success
## with React and Storybooks

-- intro-slide

--

# Design?
## That's someone elses job.

--

Ugh, another sketch/photoshop slice job

Maybe, if I had been involved...

![](./03-text-styles-opt.jpg)

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

![](./07-storybook.gif)

--

### @todo:

* Additional reasons why?
  * Show some plugins like "knob" and linkage
  * No need to have an existing app, can have standalone components that storybook draws
  * functional testing embedded into storybook
  * Reusable container components for data retrieval with react-native apps
* React-native considerations?

--

### Conclusion

* Getting involved in the design process doesn't have to be scary
* Start fresh or add to existing React/VueJS app
* Hit the ground running when designs are finished
* Version control designs and their stories

--

# Questions?