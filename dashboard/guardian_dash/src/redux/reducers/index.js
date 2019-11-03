import { ADD_SENSOR_STATE, ADD_USERS } from "../constants/action-types";

const initialState = {
  sensor_state: [],
  user_state: []
};

function rootReducer(state = initialState, action) {
  if (action.type === ADD_SENSOR_STATE) {
    return Object.assign({}, state, {
      sensor_state: (action.payload)
    });
  }
  if(action.type === ADD_USERS) {
    return Object.assign({}, state, {
      user_state: (action.payload)
    });
  }
  return state;
}

export default rootReducer;