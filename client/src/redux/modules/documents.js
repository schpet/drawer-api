
export const actions = {
}

// ------------------------------------
// Action Handlers
// ------------------------------------
const ACTION_HANDLERS = {
}

// ------------------------------------
// Reducer
// ------------------------------------
const initialState = [
  {
    'filename': 'My cool file.pdf',
    'created_at': '2016-02-20T02:19:24.887Z',
    'updated_at': '2016-02-20T02:19:24.887Z',
    'id': '75018c32-4868-4b26-9b4d-b24abc79aef3',
    'user_id': '09e00362-7b36-452d-8229-81822533cf9b'
  },
  {
    'id': 'b2381c99-a9d5-4f18-9f71-3260bfd473a7',
    'user_id': '09e00362-7b36-452d-8229-81822533cf9b',
    'updated_at': '2016-02-20T02:19:22.125Z',
    'filename': 'My fun movie.mov',
    'created_at': '2016-02-20T02:19:22.125Z'
  }
]

export default function documentsReducer (state: Array = initialState, action: Action): number {
  const handler = ACTION_HANDLERS[action.type]

  return handler ? handler(state, action): state
}
