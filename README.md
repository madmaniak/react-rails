# Quick start


```
git clone git@github.com:madmaniak/react-rails.git
bundle install
npm install
rails s
```

# Links to read

http://facebook.github.io/react/docs/flux-overview.html

https://egghead.io/lessons/react-flux-overview-and-dispatchers

Couple days ago facebook started implementing flux:

https://github.com/facebook/flux


# Problems solved

* run react and flux on rails
 * compile jsx
 * run browserify with rails
 * <code>require</code> overrides <code>this</code> in coffee files - therefore dependencies are in another file
* implement part of example from egghead tutorial in coffee, using facebook flux
* <code>\_\_DEV\_\_</code> in FB code is probably for development errors messages

# Conclusion

Looks wierd. Needs further investigation.

# Code

https://github.com/madmaniak/react-rails/tree/master/app/assets/javascripts
