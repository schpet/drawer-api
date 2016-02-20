import { combineReducers } from 'redux'
import { routerReducer as router } from 'react-router-redux'
import counter from './modules/counter'
import documents from './modules/documents'

export default combineReducers({
  counter,
  documents,
  router
})
