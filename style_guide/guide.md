# PairBoard Bootstrap Component Library

## Style Guide

### Nav
* brand - h1
* right side nav - h3

### Regstration & Login Page
* title - h2
* form labels - p

### User Create Profile Page
* header - h2
* form labels - p

### user profile page
* user.name - h2
* user.phase, email, phone, h4
* p for the biography


## Red nav bar container (per customer request)
```

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="#">Home</a></li>
        <li class="dropdown">
          <ul class="dropdown-menu">
            <li><a href="#">Page 1-1</a></li>
            <li><a href="#">Page 1-2</a></li>
            <li><a href="#">Page 1-3</a></li>
          </ul>
        </li>
        <li><a href="#">Page 2</a></li>
        <li><a href="#">Page 3</a></li>
      </ul>
    </div>
  </div>
</nav>
```

## Main container for html body
```
<div class="container">
  ...
</div>
```

## Registration and Login form template
```
# source: http://getbootstrap.com/examples/signin/
      <form class="form-signin">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
```


## Form for user profile
```
<form role="form">
  <div class="form-group">

  # choose input box size
  # http://www.w3schools.com/bootstrap/bootstrap_forms_sizing.asp

  </div>
</form>

``

## User profile page
```
< outer container >
  <div class="row">
    <div class="col-sm-2" style="background-color:lavender;">
     USER PHOTO
    </div>
    <div class="col-sm-3" style="background-color:lavenderblush;">
     USER Name<br>
     USER email
    </div>
    <div class="col-sm-3" style="background-color:lavenderblush;">
     USER phase<br>
     USER phone number
    </div>
  </div>
  <div class="row">
    <div class="col-sm-8" style="background-color:lavender;">
     I can mentor on these topics:

    </div>
  </div>
</ outer floating container >

```



## Main Time Grid - Offerings Index Page

### grid
```
http://www.w3schools.com/bootstrap/bootstrap_grid_system.asp

```


### main page buttons
```
source http://www.w3schools.com/bootstrap/bootstrap_buttons.asp
white square (no offering)    <button type="button" class="btn btn-default">Default</button>
blue square (avail = true )   <button type="button" class="btn btn-primary">Primary</button>
orange square (avail = false) <button type="button" class="btn btn-warning">Warning</button>
```

## pop up modal
```
reference http://www.w3schools.com/bootstrap/bootstrap_ref_js_modal.asp
```



