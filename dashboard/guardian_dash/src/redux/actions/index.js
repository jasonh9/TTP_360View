import { ADD_SENSOR_STATE, ADD_USERS } from "../constants/action-types";

export function addSensorState(payload) {
  return { type: ADD_SENSOR_STATE, payload };
}

export function allUsers(payload) {
    return { type: ADD_USERS, payload}
}