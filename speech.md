Welcome to my talk on designing for success with react and storybooks.

We're going to cover the process of design and how we as developers can not only get involved, but also improve it along the way.

(flip)

My name is Chris Saylor, and I am a lead engineer at Zumba where I work on various platforms of the company ranging from media streaming to ecommerce. We provide support to customers throughout the world and as such have a lot of interesting design challenges for the all the different products that we produce.

(flip)

Design. That's someone else's job, right? We, as developers, are quite eager to dive into the latest javascript framework, or the latest programming language, or the latest devlopment platform. Why is it that we are so resistent to design? Is it because it is somewhat subjective (although less of late). Is it lacking some logical bedrock that we have become so accustomed in code? Is it because design is some mystical art that we are incapable of understanding?

(flip)

We constantly find ourselves in dreadful situations in which we are provided with what could only be described as vaguely coherent designs given to us that we have to 'work our magic'. How many of us have complained about the quality of the design? Maybe it's not the design quality that is in question here. Maybe it's the way it is communicated to developers. Afterall, designs are focused on communicating to the customers, not necessarily on how to build the design.

(flip)

Why do we continue this cycle of self-inflicted torture? Many of us think that we are hired to write code, which at one point included myself. That may be true to some degree, but it certainly isn't what your employer or client thinks is the reason they are paying you. They are really paying for you to deliver a product. If the customer experience could be achieved without code, you can bet that is the route they would take.

(flip)

Why should we care about design? One word: disruption. How many of you took a taxi here from the airport? And, how many took an Uber or Lyft? The taxi industry has operated without much change for generations. They rested on their laurals in spite of customer complaints of service. All it took was a software company, in this case Uber, making a better user experience, that completely changed the taxi service forever. Software design can be that powerful.

(flip)

How can we introduce developers into the design phase. In this illustration, you have what I would describe as a typical design workflow. Rudamentary wire-frames are developed, followed by stake-holder approval, afterwhich the wireframes are refined in some design software such as SketchApp, and finally some sort of prototype system that gives a pseudo-interactive experience to the design. What does this all add up to? How valuable is this at this point?

(flip)

How do we bridge this designer and developer gap.

(flip)

What I propose to you is to introduce developers into the refinement phase. This is where the rubber hits the road in terms of what actually gets developed and ultimately delivered to the customer.

(flip)

And to do that, we are going to use a tool called Storybook.

(flip)

In short, storybook is a tool that allows you to author react components without a backend driving it in order to facilitate functional designing.

(flip)

Why not just use a styleguide? Has anyone ever developed a styleguide for use with their products? What's the one biggest problem that you find with styleguide? It gets outdated almost immediately. Code changes frequently, and because the styleguide isn't connected to the code, it's usually not updated or updated as an after-thought. It also inately carries with is a language barrier. When a designer referes to a specific component or widget, a developer may not be able to clearly reference what that is called in the style guide.

As a result, the styleguide usually fails. This is why so often you can look at a company's public styleguide and then look at their website and see two totally different things.

(flip)

Why storybook? Isn't it just a styleguide? Wouldn't it also fail?

Storybook is fundamentally different because it uses actual react and vuejs components to render what you see.

It gives you immediate feedback of changes (due to built in webpack integration). It also means the designs are codified in the components you create, which means you can see a history and progression of the design via source control. Finally, the biggest and I think the most impactful, is that at the end of the design you have functional components.

(flip)

Now the big question: how do we do this? This is where we start getting into the technical aspect of this approach.

(flip)

Which means, you will need to have buy-in from your designers as well as your developers. Using a tool like storybook may be daunting at first, but if you use it early enough in the process, you can get a very short feedback loop between your designers and developers. This can allow design mistakes to be caught earlier in the development process which can save an enormous amount of time.

With that said, we will need to make sure we construct our components in such a way that storybook can operate on them. Which means...

(flip)

Keep data retrieval separate. What does that mean?

(flip)

This is a typical react 'tutorial' component. I understand why a tutorial would do it this way, it makes it very easy to understand when you are first getting into react. You'll notice that the lifecycle hook 'component did mount' is going to fetch from some server endpoint, put them into the component state, and then render the items from that state change. Why is it important to separate this? First of all, designers are not going to be running your backend on their laptop. More importantly, it makes it so that we are reliant on changes in data on the backend in order to reflect different state scenarios.

(flip)

Let's separate.

(flip)

The first thing we need to do is create a component that simply displays the data we're interested in. One thing you'll notice is that we are expecting items to be passed into this component via props. This is important for storybook as that is how we can show different data scenarios for our design.

(flip)

Now we need to modify our 'tutorial' component into what is known as a 'data container'. This component will be responsible for retrieving the data from the backend, controlling overall state, and passing those state changes down to our new component via props. The render method in this data container now simply renders our new view component and passes in the backend data via the 'items' prop.

(flip)

Now that we've made all the necessary changes to our components, let's see how we can implement storybook with our new view component.

(flip)

This represents a very simple 'story'. By importing the 'react' specific storybook interface and our new list view component, we can add any scenario we wish to render in storybook. Let's imagine in our design phase, we want to see what the view component would look like with various numbers of items. You'll notice that each of the scenarios we add, the component is rendered as it would be rendered with our data container component, we are simply simulating the data that would be retrieved by the backend.

(flip)

Here is what our storybook would look like. The first scenario of "no items" renders rather suspiciously, as it doesn't appear to render anything. This could be a good opportunity to introduce a message stating that there are no items.

(flip)

Here is our first visible render of a single item.

(flip)

And the last scenario which has multiple items rendered.

(flip)

That is the gist of how to create a simple storybook. Now let's look at some of the capabilities storybook provides that allows us to further enhance the design process.

The first capability is to be able to show user interactions of our components in storybook.

(flip)

In this illustration, you can see in the 'action logger' panel that an item was clicked, and what the contents of the particular item clicked. This is really useful to make sure that we are capturing user input properly in the view component that will eventually be integrated into our 'data container'. Now that our view component is separated from the data container, we have to be mindful of notifying our data container on actions it may be interested in. The view component doesn't care about what happens on that click, it should only care that the click occurred and let's the data container decide what to do with it.

(flip)

Here is our view component. You'll notice that we are now listening to the 'on click' event of the li element. When the click occurs, we call a function provided to the view component via a prop.

(flip)

Let's have storybook display that action. I've cut down the scenarios on this story in order to not overwhelm you with code. We must first ensure that we import the 'action' function from the react storybook module. This is what is known as a curry function. When we call the 'action' function it returns another function that accepts whatever is passed to it. This allows the story to define some helpful text, in this case 'item clicked' and the dynamic content that is provided by our view component.

(flip)

What if we don't always want a fixed set of scenarios. What if we want to provide a way to change the scenario within storybook so we can see how the view component changes. This is where storybook really starts to shine in its flexibility. Up until this point, everything you've seen of storybook comes stock with the main package. Storybook provides an addon system that let's us customize storybook in all sorts of different ways. In order for us to add the user input capability to our stories, we need to integrate the 'knob' addon.

(flip)

In this illustration, you can see that we are changing the content being passed to our list component and it re-rendering as we put in the data. You'll also notice that our action logger panel can track the click events of these newly rendered items as if we had statically defined them in our story scenario.

Let's see how we can add this capability to our storybook.

(flip)

First, we need to import the knobs add-on. There is a special file that storybook looks for to register addons, this is what I'm showing here. The only thing this registration does is make the knob panel show up on storybook. We still need to modify our story to define what we want to allow to be customized.

(flip)

In the story, we'll need to import two functions: 'withKnobs' and 'array' from the add-on. 'withKnobs' is what storybook calls a decorator, but in react world we call it a higher-order component. We'll talk about higher-order components a little bit later. The 'array' function is another curry function, similar to the 'action' function from before. The items prop is modified to be a result of the 'array' curry of which we are passing in a label to display in the knobs panel and the default values the scenario should initially display.

(flip)

The final capability I'm going to show is the ability for storybook to run interactive unit tests. This is, admitedly, overkill for the purposes of design, but I wanted to include it to show just how flexable and powerful storybook can be in customization to fit your needs.

(flip)

This is what it would look like. I don't really have any slides on how to implement this, but you can find documentation on how to integrate this on storybook's documentation website.

(flip)

My overall objective of this talk was to convince developers to be interested in design. I know we developers have a propensity towards shiny toys, so storybook is going to serve as the carrot on the stick.

Design doesn't have to be scary. Your involvement in the process doesn't have to be all or nothing. It can start with a single component.

(flip)

I've already posted the slides up on speakerdeck and slideshare which contains all these links. The second link goes to a github repo that has the actual working source files of the componenents and storybook that was shown during the talk, and the final link is the storybook we created that you can browse without having to install anything.

(flip)

Does anyone have questions?

(flip)

There's just one more thing...

(flip)

Anyone heard of or is interested in react native? Storybook has the capability to support react-native apps, although I've not tried it myself. We can go a step further and prepare our app to support react-native.

(flip)

This is our data container from before. The render method of this component is hardcoded to our react-dom list view component. If we wanted to provide data to a react-native view component, we would have to duplicate this data container.

(flip)

How could we change the data container component to allow us to use it for both our react-dom and react-native components?

(flip)

I briefly mentioned about higher-order components when we were talking about the knobs add-on, so let me first define what it is. Simply put, it is a function that returns a component. Think of it as a way to configure or provide functionality to another component.

(flip)

Let's take our data container component and turn it into a higher-order component. The first thing you'll notice is we convert this into a function called 'withListData' and it takes as its argument a component. This allows the ability to have data be provided to an arbitrary view. Notice in the render method, we are rendering the component argument and providing the state data from the backend to the items prop.

(flip)

With our nice and shiny higher-order component, we can take our react-native component, and pass it into our higher-order component in order to produce a rendered view with backend data without having to duplicate that functionality. Afterall, the view is only interested in how to render data given to it, not how the data was retrieved.

(flip)

Thank you for coming to my talk.