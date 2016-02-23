/* @flow */
// ------------------------------------
// Constants
// ------------------------------------
export const REQUEST_DOCUMENTS = 'REQUEST_DOCUMENTS'
export const RECEIVE_DOCUMENTS = 'RECEIVE_DOCUMENTS'

export const requestDocuments = () : Action => ({
  type: REQUEST_DOCUMENTS
})

export const receiveDocuments = (json) => {
  return {
    type: RECEIVE_DOCUMENTS,
    documents: json,
    receivedAt: Date.now()
  }
}

export const actions = {
  fetchDocuments
}

export const fetchDocuments = () => {
  return (dispatch) => {
    dispatch(requestDocuments())
    return fetch('http://localhost:3000/api/documents')
      .then((response) => response.json())
      .then((json) => dispatch(receiveDocuments(json)))
  }
}

// ------------------------------------
// Action Handlers
// ------------------------------------
const ACTION_HANDLERS = {
  [REQUEST_DOCUMENTS]: (state) => {
    return Object.assign({}, state, {
      isFetching: true
    })
  },
  [RECEIVE_DOCUMENTS]: (state, { documents }) => {
    return Object.assign({}, state, {
      isFetching: false,
      items: documents
    })
  }
}

// ------------------------------------
// Reducer
// ------------------------------------
const initialState = {
  isFetching: false,
  items: [
    {
      'filename': 'LoL.pdf',
      'created_at': '2016-02-20T02:19:24.887Z',
      'updated_at': '2016-02-20T02:19:24.887Z',
      'id': 'LOL18c32-4868-4b26-9b4d-b24abc79aef3',
      'user_id': '09e00362-7b36-452d-8229-81822533cf9b'
    }
  ]
}

export default function documentsReducer (state: Object = initialState, action: Action): number {
  const handler = ACTION_HANDLERS[action.type]

  return handler ? handler(state, action): state
}
