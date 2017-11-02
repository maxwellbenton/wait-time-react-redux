export default function usersReducer(state = { username: null, loading: false }, action) {
  //TODO: fill this bad boy out
  switch (action.type) {
    case "GETTING_USER":
      return {...state, loading: true}
    case "LOGIN_USER":
      localStorage.setItem('jwt', action.payload.jwt)
      return {...state, username: action.payload.username, loading: false}
    case "SET_CURRENT_USER":
      return {...state, username: action.payload.username, loading: false}
    default:
      return state
  }
}
