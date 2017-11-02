import React from 'react';
import {Route, withRouter} from 'react-router-dom'
import Profile from './components/Profile'
import LoginForm from './components/LoginForm'
import Navigation from './components/Navigation'
import {connect} from 'react-redux'
import {getCurrentUser} from './actions/user'
import {connectedRouterRedirect} from 'redux-auth-wrapper/history4/redirect'

class App extends React.Component {

  componentDidMount() {
    if (localStorage.getItem('jwt')) {
      this.props.getCurrentUser()
    }
  }


  render() {
    console.log(this.props)
    return (
      <div className="App">
        <Navigation/>
        <Route exact path='/' render={() => <div>hey {this.props.usersReducer.loading ? "Downloading Internet..." : this.props.usersReducer.username}</div>}/>
        <Route exact path='/map' render={() => <div>Mapppppppp</div>}/>
        <Route exact path='/profile' component={userIsAuthenticated(Profile)}/>
        <Route exact path='/login' render={() => <LoginForm onSubmit={this.logIn}/>}/>

      </div>
    )
  }
}

const userIsAuthenticated = connectedRouterRedirect({
  redirectPath: '/login',
  authenticatedSelector: state => !!state.usersReducer.username,
  wrapperDisplayName: 'UserIsAuthenticated'
})

const mapStateToProps = state => {
  return {
    ...state
  }
}

export default withRouter(connect(mapStateToProps, {getCurrentUser})(App));
